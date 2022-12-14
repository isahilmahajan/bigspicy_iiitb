# bigspicy_iiitb

##Introduction
BigSpicy is a tool for merging circuit descriptions (netlists), generating Spice decks modeling those circuits, generating Spice tests to measure those models, and analyzing the results of running Spice on those tests. Bigspicy allows you to combine structural Verilog from a PDK, Spice models of standard cells, a structural Verilog model of some circuit implemented in that PDK, and parasitics extracted into SPEF format. You can then reason about the electrical structure of the design however you want. Bigspicy generates Spice decks in Xyce format, though this can (and should) be extended to other 
Spice dialects.<br> 

This repository shows the steps for merging the SPEF, verilog and spice netlist into a circuit protobuf and generating the spice file of the design which can further be used to perform various tests and analysis.
In this repo, the design of 4 bit bidirectional counter is implemented using SKY130 PDKS. The RTL to GDS2 flow of the given design can be referred from the following github repo.
<br> https://github.com/isahilmahajan/iiitb_4bbc.git

## Pre-Requisites
We need to install some python dependencies, for that follow the below steps
```
git clone https://github.com/isahilmahajan/bigspicy_iiitb.git
cd BigSpicy/
sudo apt-get update
pip install -e ".[dev]"
pip install -r requirements.txt
sudo apt install -y protobuf-compiler iverilog
```
Another prerequisite for this step is to compile protobufs into python file.(_pb2.py).
To compile the protobufs, type the below command in terminal in the BigSpicy(cloned_repo) directory:
```
git submodule update --init  
protoc --proto_path vlsir vlsir/*.proto vlsir/*/*.proto --python_out=.
protoc proto/*.proto --python_out=.
```

## Flowchart
![image](https://user-images.githubusercontent.com/110079689/200117467-c5c6d165-5011-4002-9b82-d756f3bbd48d.png)

## XDM- File Conversion to Xyce format
Primitives and spice files are needed by BigSpicy but they are not processed in their raw format. The files that are fed to BigSpicy should be in Xyce format as minimal internal processing is required for them. 
<br>XDM can be installed from the below link
<br>https://github.com/Xyce/XDM

#### Steps to convert file into Xyce format
```
xdm_bdl -s hspice "path to the pdk"/"file to be converted" -d lib
```

## Xyce
### 1) Merge SPEF, Verilog and Spice files into circuit protobuf</n>
After obtaining all the required files that is, 7nm Primitives and Spice files in Xyce format, netlist and spice files. We need to merge them as in order to generate a spice deck the order of ports for each instantiated module are also required which leads to dependency on PDK. We then convert the merged files into protobuf with the help of protoc. 
<br>Xyce can be installed from the below link
<br>https://xyce.sandia.gov/documentation/BuildingGuide.html

#### Steps to merge file to obtain circuit protobuf
```
./bigspicy.py \
   --import \
   --spef example_inputs/iiitb_4bbc/iiitb_4bbc.spef
   --spice lib/sky130_fd_sc_hd.spice \
   --verilog example_inputs/iiitb_4bbc/iiitb_4bbc.v\
   --spice_header lib/sky130_fd_pr__pfet_01v8.pm3.spice \
   --spice_header lib/sky130_fd_pr__nfet_01v8.pm3.spice \
   --spice_header lib/sky130_ef_sc_hd__decap_12.spice \
   --spice_header lib/sky130_fd_pr__pfet_01v8_hvt.pm3.spice \
   --top iiitb_4bbc \
   --save final.pb \
```
The above steps will generate final.pb file. To specify the location of the final.pb file, go to bigspicy.py file and search for "def withoptions()" function. Change the "output_dir" variable to your desired path.
## 2) Generating Module Spice Model and Transistor level Spice
The protobuf file that we have generated in the previous step and PDK spice file are then used to make a whole module spice model.</n>
We then pass the ```--flatten_spice``` argument to convert the whole module spice model into transistor level spice. In order to generate "spice.sp" file follow the steps below 
```
./bigspicy.py --import \
    --verilog example_inputs/iiitb_4bbc/iiitb_4bbc.v \
    --spice lib/sky130_fd_sc_hd.spice \
    --spice_header lib/sky130_fd_pr__pfet_01v8.pm3.spice \
    --spice_header lib/sky130_fd_pr__nfet_01v8.pm3.spice \
    --spice_header lib/sky130_ef_sc_hd__decap_12.spice \
    --spice_header lib/sky130_fd_pr__pfet_01v8_hvt.pm3.spice \
    --save final.pb \
    --top iiitb_4bbc \
    --flatten_spice --dump_spice spice.sp
```
## 3) Generating test to measure input capacitance
We take the protobuf file, PDK primitives file and the spice file of our module to generate the test manifest and circuit analysis protobuf files. We then run Xyce to perform tests. 

Capacitances is an important parameter for any chip that we design. The propagation delays of a circuit depend on the capacitances of each and every standard cell.propagation delay is the amount of time it takes for signals to pass between two Flip-Flops. <br>In order to make a chip work faster, we want the worst case delay to be as minimum as possible without violating the setup and hold time. The setup and hold time are maintained so that the clock is not running faster than the logic allows.
## Setup and Hold Time
In digital designs, each and every flip-flop has some restrictions related to the data with respect to the clock in the form of windows in which data can change or not. There is always a region around the clock edge in which input data should not change at the input of the flip-flop. This is because, if the data changes within this window, we cannot guarantee the output.
<br><br><b>Setup Time</b>: Setup time is the amount of time required for the input to a Flip-Flop to be stable before a clock edge.<br><br>
<b>Hold TIme</b>: Hold time is the minimum amount of time required for the input to a Flip-Flop to be stable after a clock edge.<br>
<p align="center">
 <img src="https://user-images.githubusercontent.com/110080106/201023386-a0506ab5-a057-4626-b28b-656e86990351.png"width="600"/><br><b>
 Fig 1. Timing Diagram</b>
</p>
<br>Setup time and hold time are said to be the backbone of timing analysis. Rightly so, for the chip to function properly, setup and hold timing constraints need to be met properly for each and every flip-flop in the design. If even a single flop exists that does not meet setup and hold requirements for timing paths starting from/ending at it, the design will fail and meta-stability will occur.

## Measuring Input Capacitance in BigSpicy
<b>Input Files to these steps<br></b> "Final.pb", Spice file for our design 
<b><br>Output File</b><br> All necessary test files, "test_manifest.pb", "circuit_analysis.pb"

## Running Xyce to perform tests

## 4) Linear and transient analysis
we then perform the linear and transient analysis using Xyce with the help of test manifest and circuit analysis protobuf files. 
## 5) Generating wire and whole module tests
We take the protobuf file, primitives, spice, test manifest and circuit analysis file to generate test for whole module. 
  
## 6) perform analysis on wire and whole module tests
We take Final.pb, PDK primitives, test_manifest, test_analysis, PDK spice decks. Input capacitance and delays will be analysed.

## Future Work
We have currently generated the "final.pb" and "spice.sp" files. The next steps includes finding the path delay for our design and running Xyce to perform test. For the path delay we need t extract different paths using xyce and compare the delay result with other tools. 

## Acknowledgement 
- Kunal Ghosh, VSD Corp. Pvt. Ltd. 
- Madhav Rao, Professor, IIIT Bangalore
- Nanditha Rao, Professor, IIIT Bangalore
