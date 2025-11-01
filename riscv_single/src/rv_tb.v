#! /c/Source/iverilog-install/bin/vvp
:ivl_version "12.0 (devel)" "(s20150603-1539-g2693dd32b)";
:ivl_delay_selection "TYPICAL";
:vpi_time_precision + 0;
:vpi_module "C:\iverilog\lib\ivl\system.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_sys.vpi";
:vpi_module "C:\iverilog\lib\ivl\vhdl_textio.vpi";
:vpi_module "C:\iverilog\lib\ivl\v2005_math.vpi";
:vpi_module "C:\iverilog\lib\ivl\va_math.vpi";
:vpi_module "C:\iverilog\lib\ivl\v2009.vpi";
S_000001b1ccba3360 .scope package, "$unit" "$unit" 2 1;
 .timescale 0 0;
S_000001b1ccb36fd0 .scope module, "testbench" "testbench" 3 107;
 .timescale 0 0;
v000001b1ccc03310_0 .net "DataAdr", 31 0, v000001b1ccbfc9b0_0;  1 drivers
v000001b1ccc03b30_0 .net "MemWrite", 0 0, L_000001b1ccc034f0;  1 drivers
v000001b1ccc03950_0 .net "WriteData", 31 0, L_000001b1ccc04d50;  1 drivers
v000001b1ccc04fd0_0 .var "clk", 0 0;
v000001b1ccc039f0_0 .var "reset", 0 0;
E_000001b1ccb99640 .event negedge, v000001b1ccb92b60_0;
S_000001b1ccb37160 .scope module, "dut" "top" 3 116, 3 153 0, S_000001b1ccb36fd0;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "reset";
    .port_info 2 /OUTPUT 32 "WriteData";
    .port_info 3 /OUTPUT 32 "DataAdr";
    .port_info 4 /OUTPUT 1 "MemWrite";
v000001b1ccc019e0_0 .net "DataAdr", 31 0, v000001b1ccbfc9b0_0;  alias, 1 drivers
v000001b1ccc03ef0_0 .net "Instr", 31 0, L_000001b1ccb86520;  1 drivers
v000001b1ccc04ad0_0 .net "MemWrite", 0 0, L_000001b1ccc034f0;  alias, 1 drivers
v000001b1ccc04530_0 .net "PC", 31 0, v000001b1ccbfda90_0;  1 drivers
v000001b1ccc04990_0 .net "ReadData", 31 0, L_000001b1ccb86590;  1 drivers
v000001b1ccc04f30_0 .net "WriteData", 31 0, L_000001b1ccc04d50;  alias, 1 drivers
v000001b1ccc045d0_0 .net "clk", 0 0, v000001b1ccc04fd0_0;  1 drivers
v000001b1ccc031d0_0 .net "reset", 0 0, v000001b1ccc039f0_0;  1 drivers
S_000001b1ccb39710 .scope module, "dmem" "dmem" 3 163, 3 419 0, S_000001b1ccb37160;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "we";
    .port_info 2 /INPUT 32 "a";
    .port_info 3 /INPUT 32 "wd";
    .port_info 4 /OUTPUT 32 "rd";
L_000001b1ccb86590 .functor BUFZ 32, L_000001b1ccc5fdf0, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
v000001b1ccb937e0 .array "RAM", 0 63, 31 0;
v000001b1ccb92700_0 .net *"_ivl_0", 31 0, L_000001b1ccc5fdf0;  1 drivers
v000001b1ccb92ac0_0 .net *"_ivl_3", 29 0, L_000001b1ccc60430;  1 drivers
v000001b1ccb92ca0_0 .net "a", 31 0, v000001b1ccbfc9b0_0;  alias, 1 drivers
v000001b1ccb92b60_0 .net "clk", 0 0, v000001b1ccc04fd0_0;  alias, 1 drivers
v000001b1ccb93f60_0 .net "rd", 31 0, L_000001b1ccb86590;  alias, 1 drivers
v000001b1ccb93880_0 .net "wd", 31 0, L_000001b1ccc04d50;  alias, 1 drivers
v000001b1ccb93d80_0 .net "we", 0 0, L_000001b1ccc034f0;  alias, 1 drivers
E_000001b1ccb99440 .event posedge, v000001b1ccb92b60_0;
L_000001b1ccc5fdf0 .array/port v000001b1ccb937e0, L_000001b1ccc60430;
L_000001b1ccc60430 .part v000001b1ccbfc9b0_0, 2, 30;
S_000001b1ccb398a0 .scope module, "imem" "imem" 3 162, 3 408 0, S_000001b1ccb37160;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "a";
    .port_info 1 /OUTPUT 32 "rd";
L_000001b1ccb86520 .functor BUFZ 32, L_000001b1ccc60e30, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
v000001b1ccb932e0 .array "RAM", 0 63, 31 0;
v000001b1ccb93920_0 .net *"_ivl_0", 31 0, L_000001b1ccc60e30;  1 drivers
v000001b1ccb92c00_0 .net *"_ivl_3", 29 0, L_000001b1ccc60d90;  1 drivers
v000001b1ccb92d40_0 .net "a", 31 0, v000001b1ccbfda90_0;  alias, 1 drivers
v000001b1ccb92f20_0 .net "rd", 31 0, L_000001b1ccb86520;  alias, 1 drivers
L_000001b1ccc60e30 .array/port v000001b1ccb932e0, L_000001b1ccc60d90;
L_000001b1ccc60d90 .part v000001b1ccbfda90_0, 2, 30;
S_000001b1ccb593d0 .scope module, "rvsingle" "riscvsingle" 3 160, 3 166 0, S_000001b1ccb37160;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "reset";
    .port_info 2 /OUTPUT 32 "PC";
    .port_info 3 /INPUT 32 "Instr";
    .port_info 4 /OUTPUT 1 "MemWrite";
    .port_info 5 /OUTPUT 32 "ALUResult";
    .port_info 6 /OUTPUT 32 "WriteData";
    .port_info 7 /INPUT 32 "ReadData";
v000001b1ccc02f20_0 .net "ALUControl", 4 0, v000001b1ccb931a0_0;  1 drivers
v000001b1ccc01800_0 .net "ALUResult", 31 0, v000001b1ccbfc9b0_0;  alias, 1 drivers
v000001b1ccc02a20_0 .net "ALUSrc", 0 0, L_000001b1ccc03a90;  1 drivers
v000001b1ccc02b60_0 .net "ImmSrc", 1 0, L_000001b1ccc04850;  1 drivers
v000001b1ccc02c00_0 .net "Instr", 31 0, L_000001b1ccb86520;  alias, 1 drivers
v000001b1ccc02ca0_0 .net "Jump", 0 0, L_000001b1ccc04710;  1 drivers
v000001b1ccc02e80_0 .net "MemWrite", 0 0, L_000001b1ccc034f0;  alias, 1 drivers
v000001b1ccc02fc0_0 .net "PC", 31 0, v000001b1ccbfda90_0;  alias, 1 drivers
v000001b1ccc01120_0 .net "PCSrc", 0 0, L_000001b1ccb86280;  1 drivers
v000001b1ccc011c0_0 .net "ReadData", 31 0, L_000001b1ccb86590;  alias, 1 drivers
v000001b1ccc01260_0 .net "RegWrite", 0 0, L_000001b1ccc04b70;  1 drivers
v000001b1ccc01300_0 .net "ResultSrc", 1 0, L_000001b1ccc038b0;  1 drivers
v000001b1ccc013a0_0 .net "WriteData", 31 0, L_000001b1ccc04d50;  alias, 1 drivers
v000001b1ccc01580_0 .net "Zero", 0 0, L_000001b1ccc60070;  1 drivers
v000001b1ccc016c0_0 .net "clk", 0 0, v000001b1ccc04fd0_0;  alias, 1 drivers
v000001b1ccc01760_0 .net "reset", 0 0, v000001b1ccc039f0_0;  alias, 1 drivers
L_000001b1ccc04670 .part L_000001b1ccb86520, 0, 7;
L_000001b1ccc033b0 .part L_000001b1ccb86520, 12, 3;
L_000001b1ccc04cb0 .part L_000001b1ccb86520, 30, 1;
S_000001b1ccb59560 .scope module, "c" "controller" 3 177, 3 188 0, S_000001b1ccb593d0;
 .timescale 0 0;
    .port_info 0 /INPUT 7 "op";
    .port_info 1 /INPUT 3 "funct3";
    .port_info 2 /INPUT 1 "funct7b5";
    .port_info 3 /INPUT 1 "Zero";
    .port_info 4 /OUTPUT 2 "ResultSrc";
    .port_info 5 /OUTPUT 1 "MemWrite";
    .port_info 6 /OUTPUT 1 "PCSrc";
    .port_info 7 /OUTPUT 1 "ALUSrc";
    .port_info 8 /OUTPUT 1 "RegWrite";
    .port_info 9 /OUTPUT 1 "Jump";
    .port_info 10 /OUTPUT 2 "ImmSrc";
    .port_info 11 /OUTPUT 5 "ALUControl";
L_000001b1ccb866e0 .functor AND 1, L_000001b1ccc03d10, L_000001b1ccc60070, C4<1>, C4<1>;
L_000001b1ccb86280 .functor OR 1, L_000001b1ccb866e0, L_000001b1ccc04710, C4<0>, C4<0>;
v000001b1ccbee540_0 .net "ALUControl", 4 0, v000001b1ccb931a0_0;  alias, 1 drivers
v000001b1ccbecce0_0 .net "ALUOp", 1 0, L_000001b1ccc048f0;  1 drivers
v000001b1ccbecd80_0 .net "ALUSrc", 0 0, L_000001b1ccc03a90;  alias, 1 drivers
v000001b1ccbed780_0 .net "Branch", 0 0, L_000001b1ccc03d10;  1 drivers
v000001b1ccbeea40_0 .net "ImmSrc", 1 0, L_000001b1ccc04850;  alias, 1 drivers
v000001b1ccbed820_0 .net "Jump", 0 0, L_000001b1ccc04710;  alias, 1 drivers
v000001b1ccbed640_0 .net "MemWrite", 0 0, L_000001b1ccc034f0;  alias, 1 drivers
v000001b1ccbee9a0_0 .net "PCSrc", 0 0, L_000001b1ccb86280;  alias, 1 drivers
v000001b1ccbed8c0_0 .net "RegWrite", 0 0, L_000001b1ccc04b70;  alias, 1 drivers
v000001b1ccbed1e0_0 .net "ResultSrc", 1 0, L_000001b1ccc038b0;  alias, 1 drivers
v000001b1ccbee5e0_0 .net "Zero", 0 0, L_000001b1ccc60070;  alias, 1 drivers
v000001b1ccbeda00_0 .net *"_ivl_2", 0 0, L_000001b1ccb866e0;  1 drivers
v000001b1ccbed320_0 .net "funct3", 2 0, L_000001b1ccc033b0;  1 drivers
v000001b1ccbed960_0 .net "funct7b5", 0 0, L_000001b1ccc04cb0;  1 drivers
v000001b1ccbedaa0_0 .net "op", 6 0, L_000001b1ccc04670;  1 drivers
L_000001b1ccc04c10 .part L_000001b1ccc04670, 5, 1;
S_000001b1ccb67f50 .scope module, "ad" "aludec" 3 204, 3 241 0, S_000001b1ccb59560;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "opb5";
    .port_info 1 /INPUT 3 "funct3";
    .port_info 2 /INPUT 1 "funct7b5";
    .port_info 3 /INPUT 2 "ALUOp";
    .port_info 4 /OUTPUT 5 "ALUControl";
L_000001b1ccb87080 .functor AND 1, L_000001b1ccc04cb0, L_000001b1ccc04c10, C4<1>, C4<1>;
v000001b1ccb931a0_0 .var "ALUControl", 4 0;
v000001b1ccb94000_0 .net "ALUOp", 1 0, L_000001b1ccc048f0;  alias, 1 drivers
v000001b1ccb92200_0 .net "RtypeSub", 0 0, L_000001b1ccb87080;  1 drivers
v000001b1ccb922a0_0 .net "funct3", 2 0, L_000001b1ccc033b0;  alias, 1 drivers
v000001b1ccb92340_0 .net "funct7b5", 0 0, L_000001b1ccc04cb0;  alias, 1 drivers
v000001b1ccb923e0_0 .net "opb5", 0 0, L_000001b1ccc04c10;  1 drivers
E_000001b1ccb99e40 .event anyedge, v000001b1ccb94000_0, v000001b1ccb922a0_0, v000001b1ccb92200_0, v000001b1ccb92340_0;
S_000001b1ccb680e0 .scope module, "md" "maindec" 3 202, 3 210 0, S_000001b1ccb59560;
 .timescale 0 0;
    .port_info 0 /INPUT 7 "op";
    .port_info 1 /OUTPUT 2 "ResultSrc";
    .port_info 2 /OUTPUT 1 "MemWrite";
    .port_info 3 /OUTPUT 1 "Branch";
    .port_info 4 /OUTPUT 1 "ALUSrc";
    .port_info 5 /OUTPUT 1 "RegWrite";
    .port_info 6 /OUTPUT 1 "Jump";
    .port_info 7 /OUTPUT 2 "ImmSrc";
    .port_info 8 /OUTPUT 2 "ALUOp";
v000001b1ccb85f70_0 .net "ALUOp", 1 0, L_000001b1ccc048f0;  alias, 1 drivers
v000001b1ccbedbe0_0 .net "ALUSrc", 0 0, L_000001b1ccc03a90;  alias, 1 drivers
v000001b1ccbed5a0_0 .net "Branch", 0 0, L_000001b1ccc03d10;  alias, 1 drivers
v000001b1ccbee7c0_0 .net "ImmSrc", 1 0, L_000001b1ccc04850;  alias, 1 drivers
v000001b1ccbed000_0 .net "Jump", 0 0, L_000001b1ccc04710;  alias, 1 drivers
v000001b1ccbede60_0 .net "MemWrite", 0 0, L_000001b1ccc034f0;  alias, 1 drivers
v000001b1ccbecba0_0 .net "RegWrite", 0 0, L_000001b1ccc04b70;  alias, 1 drivers
v000001b1ccbedc80_0 .net "ResultSrc", 1 0, L_000001b1ccc038b0;  alias, 1 drivers
v000001b1ccbed6e0_0 .net *"_ivl_10", 10 0, v000001b1ccbed280_0;  1 drivers
v000001b1ccbed280_0 .var "controls", 10 0;
v000001b1ccbecc40_0 .net "op", 6 0, L_000001b1ccc04670;  alias, 1 drivers
E_000001b1ccb99e00 .event anyedge, v000001b1ccbecc40_0;
L_000001b1ccc04b70 .part v000001b1ccbed280_0, 10, 1;
L_000001b1ccc04850 .part v000001b1ccbed280_0, 8, 2;
L_000001b1ccc03a90 .part v000001b1ccbed280_0, 7, 1;
L_000001b1ccc034f0 .part v000001b1ccbed280_0, 6, 1;
L_000001b1ccc038b0 .part v000001b1ccbed280_0, 4, 2;
L_000001b1ccc03d10 .part v000001b1ccbed280_0, 3, 1;
L_000001b1ccc048f0 .part v000001b1ccbed280_0, 1, 2;
L_000001b1ccc04710 .part v000001b1ccbed280_0, 0, 1;
S_000001b1ccbeeb60 .scope module, "dp" "datapath" 3 181, 3 304 0, S_000001b1ccb593d0;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "reset";
    .port_info 2 /INPUT 2 "ResultSrc";
    .port_info 3 /INPUT 1 "PCSrc";
    .port_info 4 /INPUT 1 "ALUSrc";
    .port_info 5 /INPUT 1 "RegWrite";
    .port_info 6 /INPUT 2 "ImmSrc";
    .port_info 7 /INPUT 5 "ALUControl";
    .port_info 8 /OUTPUT 1 "Zero";
    .port_info 9 /OUTPUT 32 "PC";
    .port_info 10 /INPUT 32 "Instr";
    .port_info 11 /OUTPUT 32 "ALUResult";
    .port_info 12 /OUTPUT 32 "WriteData";
    .port_info 13 /INPUT 32 "ReadData";
v000001b1ccc02660_0 .net "ALUControl", 4 0, v000001b1ccb931a0_0;  alias, 1 drivers
v000001b1ccc028e0_0 .net "ALUResult", 31 0, v000001b1ccbfc9b0_0;  alias, 1 drivers
v000001b1ccc01e40_0 .net "ALUSrc", 0 0, L_000001b1ccc03a90;  alias, 1 drivers
v000001b1ccc01940_0 .net "ImmExt", 31 0, v000001b1ccbfdf90_0;  1 drivers
v000001b1ccc02700_0 .net "ImmSrc", 1 0, L_000001b1ccc04850;  alias, 1 drivers
v000001b1ccc022a0_0 .net "Instr", 31 0, L_000001b1ccb86520;  alias, 1 drivers
v000001b1ccc025c0_0 .net "PC", 31 0, v000001b1ccbfda90_0;  alias, 1 drivers
v000001b1ccc023e0_0 .net "PCNext", 31 0, L_000001b1ccc03590;  1 drivers
v000001b1ccc02160_0 .net "PCPlus4", 31 0, L_000001b1ccc03c70;  1 drivers
v000001b1ccc02340_0 .net "PCSrc", 0 0, L_000001b1ccb86280;  alias, 1 drivers
v000001b1ccc027a0_0 .net "PCTarget", 31 0, L_000001b1ccc04a30;  1 drivers
v000001b1ccc018a0_0 .net "ReadData", 31 0, L_000001b1ccb86590;  alias, 1 drivers
v000001b1ccc01bc0_0 .net "RegWrite", 0 0, L_000001b1ccc04b70;  alias, 1 drivers
v000001b1ccc01a80_0 .net "Result", 31 0, L_000001b1ccc5f710;  1 drivers
v000001b1ccc01c60_0 .net "ResultSrc", 1 0, L_000001b1ccc038b0;  alias, 1 drivers
v000001b1ccc01d00_0 .net "SrcA", 31 0, L_000001b1ccc03770;  1 drivers
v000001b1ccc01ee0_0 .net "SrcB", 31 0, L_000001b1ccc043f0;  1 drivers
v000001b1ccc02de0_0 .net "WriteData", 31 0, L_000001b1ccc04d50;  alias, 1 drivers
v000001b1ccc01f80_0 .net "Zero", 0 0, L_000001b1ccc60070;  alias, 1 drivers
v000001b1ccc02020_0 .net "clk", 0 0, v000001b1ccc04fd0_0;  alias, 1 drivers
v000001b1ccc02520_0 .net "reset", 0 0, v000001b1ccc039f0_0;  alias, 1 drivers
L_000001b1ccc03450 .part L_000001b1ccb86520, 15, 5;
L_000001b1ccc04df0 .part L_000001b1ccb86520, 20, 5;
L_000001b1ccc040d0 .part L_000001b1ccb86520, 7, 5;
L_000001b1ccc036d0 .part L_000001b1ccb86520, 7, 25;
S_000001b1ccbeecf0 .scope module, "alu" "alu" 3 334, 3 431 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "a";
    .port_info 1 /INPUT 32 "b";
    .port_info 2 /INPUT 5 "alucontrol";
    .port_info 3 /OUTPUT 32 "result";
    .port_info 4 /OUTPUT 1 "zero";
L_000001b1ccb86360 .functor NOT 32, L_000001b1ccc043f0, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>, C4<00000000000000000000000000000000>;
L_000001b1ccb86c90 .functor OR 1, L_000001b1ccc04e90, L_000001b1ccc03bd0, C4<0>, C4<0>;
L_000001b1ccb867c0 .functor XOR 1, L_000001b1ccc5f170, L_000001b1ccc5f5d0, C4<0>, C4<0>;
L_000001b1ccb86e50 .functor XOR 1, L_000001b1ccb867c0, L_000001b1ccc607f0, C4<0>, C4<0>;
L_000001b1ccb86f30 .functor NOT 1, L_000001b1ccb86e50, C4<0>, C4<0>, C4<0>;
L_000001b1ccb863d0 .functor XOR 1, L_000001b1ccc60b10, L_000001b1ccc60750, C4<0>, C4<0>;
L_000001b1ccb86d00 .functor AND 1, L_000001b1ccb86f30, L_000001b1ccb863d0, C4<1>, C4<1>;
L_000001b1ccb86440 .functor AND 1, L_000001b1ccb86d00, L_000001b1ccb86c90, C4<1>, C4<1>;
v000001b1ccbee2c0_0 .net *"_ivl_1", 0 0, L_000001b1ccc04490;  1 drivers
L_000001b1ccc053c8 .functor BUFT 1, C4<00001>, C4<0>, C4<0>, C4<0>;
v000001b1ccbee860_0 .net/2u *"_ivl_10", 4 0, L_000001b1ccc053c8;  1 drivers
v000001b1ccbecf60_0 .net *"_ivl_12", 0 0, L_000001b1ccc03bd0;  1 drivers
v000001b1ccbee360_0 .net *"_ivl_16", 31 0, L_000001b1ccc04170;  1 drivers
v000001b1ccbecec0_0 .net *"_ivl_19", 0 0, L_000001b1ccc04210;  1 drivers
v000001b1ccbedb40_0 .net *"_ivl_2", 31 0, L_000001b1ccb86360;  1 drivers
v000001b1ccbee180_0 .net *"_ivl_20", 31 0, L_000001b1ccc042b0;  1 drivers
L_000001b1ccc05410 .functor BUFT 1, C4<0000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbece20_0 .net *"_ivl_23", 30 0, L_000001b1ccc05410;  1 drivers
L_000001b1ccc05458 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbed460_0 .net/2u *"_ivl_26", 31 0, L_000001b1ccc05458;  1 drivers
v000001b1ccbee400_0 .net *"_ivl_31", 0 0, L_000001b1ccc5f170;  1 drivers
v000001b1ccbee220_0 .net *"_ivl_33", 0 0, L_000001b1ccc5f5d0;  1 drivers
v000001b1ccbedd20_0 .net *"_ivl_34", 0 0, L_000001b1ccb867c0;  1 drivers
v000001b1ccbee4a0_0 .net *"_ivl_37", 0 0, L_000001b1ccc607f0;  1 drivers
v000001b1ccbeddc0_0 .net *"_ivl_38", 0 0, L_000001b1ccb86e50;  1 drivers
v000001b1ccbedf00_0 .net *"_ivl_40", 0 0, L_000001b1ccb86f30;  1 drivers
v000001b1ccbed3c0_0 .net *"_ivl_43", 0 0, L_000001b1ccc60b10;  1 drivers
v000001b1ccbed500_0 .net *"_ivl_45", 0 0, L_000001b1ccc60750;  1 drivers
v000001b1ccbedfa0_0 .net *"_ivl_46", 0 0, L_000001b1ccb863d0;  1 drivers
v000001b1ccbed0a0_0 .net *"_ivl_48", 0 0, L_000001b1ccb86d00;  1 drivers
L_000001b1ccc05380 .functor BUFT 1, C4<00000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbee680_0 .net/2u *"_ivl_6", 4 0, L_000001b1ccc05380;  1 drivers
v000001b1ccbee040_0 .net *"_ivl_8", 0 0, L_000001b1ccc04e90;  1 drivers
v000001b1ccbee0e0_0 .net "a", 31 0, L_000001b1ccc03770;  alias, 1 drivers
v000001b1ccbed140_0 .net "alucontrol", 4 0, v000001b1ccb931a0_0;  alias, 1 drivers
v000001b1ccbee720_0 .var/s "as", 31 0;
v000001b1ccbee900_0 .net "b", 31 0, L_000001b1ccc043f0;  alias, 1 drivers
v000001b1ccbfc910_0 .var/s "bs", 31 0;
v000001b1ccbfd950_0 .net "condinvb", 31 0, L_000001b1ccc03810;  1 drivers
v000001b1ccbfd6d0_0 .net "isAddSub", 0 0, L_000001b1ccb86c90;  1 drivers
v000001b1ccbfc9b0_0 .var "result", 31 0;
v000001b1ccbfcf50_0 .var "sh", 4 0;
v000001b1ccbfc870_0 .net "sum", 31 0, L_000001b1ccc04350;  1 drivers
v000001b1ccbfd3b0_0 .net "v", 0 0, L_000001b1ccb86440;  1 drivers
v000001b1ccbfdef0_0 .net "zero", 0 0, L_000001b1ccc60070;  alias, 1 drivers
E_000001b1ccb997c0/0 .event anyedge, v000001b1ccb931a0_0, v000001b1ccbfc870_0, v000001b1ccbee0e0_0, v000001b1ccbee900_0;
E_000001b1ccb997c0/1 .event anyedge, v000001b1ccbfc870_0, v000001b1ccbfd3b0_0, v000001b1ccbfcf50_0, v000001b1ccbee720_0;
E_000001b1ccb997c0/2 .event anyedge, v000001b1ccbfc910_0;
E_000001b1ccb997c0 .event/or E_000001b1ccb997c0/0, E_000001b1ccb997c0/1, E_000001b1ccb997c0/2;
L_000001b1ccc04490 .part v000001b1ccb931a0_0, 0, 1;
L_000001b1ccc03810 .functor MUXZ 32, L_000001b1ccc043f0, L_000001b1ccb86360, L_000001b1ccc04490, C4<>;
L_000001b1ccc04e90 .cmp/eq 5, v000001b1ccb931a0_0, L_000001b1ccc05380;
L_000001b1ccc03bd0 .cmp/eq 5, v000001b1ccb931a0_0, L_000001b1ccc053c8;
L_000001b1ccc04170 .arith/sum 32, L_000001b1ccc03770, L_000001b1ccc03810;
L_000001b1ccc04210 .part v000001b1ccb931a0_0, 0, 1;
L_000001b1ccc042b0 .concat [ 1 31 0 0], L_000001b1ccc04210, L_000001b1ccc05410;
L_000001b1ccc04350 .arith/sum 32, L_000001b1ccc04170, L_000001b1ccc042b0;
L_000001b1ccc60070 .cmp/eq 32, v000001b1ccbfc9b0_0, L_000001b1ccc05458;
L_000001b1ccc5f170 .part v000001b1ccb931a0_0, 0, 1;
L_000001b1ccc5f5d0 .part L_000001b1ccc03770, 31, 1;
L_000001b1ccc607f0 .part L_000001b1ccc043f0, 31, 1;
L_000001b1ccc60b10 .part L_000001b1ccc03770, 31, 1;
L_000001b1ccc60750 .part L_000001b1ccc04350, 31, 1;
S_000001b1ccb67c30 .scope module, "ext" "extend" 3 330, 3 364 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 25 "instr";
    .port_info 1 /INPUT 2 "immsrc";
    .port_info 2 /OUTPUT 32 "immext";
v000001b1ccbfdf90_0 .var "immext", 31 0;
v000001b1ccbfce10_0 .net "immsrc", 1 0, L_000001b1ccc04850;  alias, 1 drivers
v000001b1ccbfddb0_0 .net "instr", 31 7, L_000001b1ccc036d0;  1 drivers
E_000001b1ccb99500/0 .event anyedge, v000001b1ccbee7c0_0, v000001b1ccbfddb0_0, v000001b1ccbfddb0_0, v000001b1ccbfddb0_0;
E_000001b1ccb99500/1 .event anyedge, v000001b1ccbfddb0_0, v000001b1ccbfddb0_0, v000001b1ccbfddb0_0, v000001b1ccbfddb0_0;
E_000001b1ccb99500/2 .event anyedge, v000001b1ccbfddb0_0, v000001b1ccbfddb0_0, v000001b1ccbfddb0_0;
E_000001b1ccb99500 .event/or E_000001b1ccb99500/0, E_000001b1ccb99500/1, E_000001b1ccb99500/2;
S_000001b1ccb453f0 .scope module, "pcadd4" "adder" 3 323, 3 358 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "a";
    .port_info 1 /INPUT 32 "b";
    .port_info 2 /OUTPUT 32 "y";
v000001b1ccbfc7d0_0 .net "a", 31 0, v000001b1ccbfda90_0;  alias, 1 drivers
L_000001b1ccc050f8 .functor BUFT 1, C4<00000000000000000000000000000100>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfcc30_0 .net "b", 31 0, L_000001b1ccc050f8;  1 drivers
v000001b1ccbfdd10_0 .net "y", 31 0, L_000001b1ccc03c70;  alias, 1 drivers
L_000001b1ccc03c70 .arith/sum 32, v000001b1ccbfda90_0, L_000001b1ccc050f8;
S_000001b1ccb45580 .scope module, "pcaddbranch" "adder" 3 324, 3 358 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "a";
    .port_info 1 /INPUT 32 "b";
    .port_info 2 /OUTPUT 32 "y";
v000001b1ccbfccd0_0 .net "a", 31 0, v000001b1ccbfda90_0;  alias, 1 drivers
v000001b1ccbfd810_0 .net "b", 31 0, v000001b1ccbfdf90_0;  alias, 1 drivers
v000001b1ccbfd8b0_0 .net "y", 31 0, L_000001b1ccc04a30;  alias, 1 drivers
L_000001b1ccc04a30 .arith/sum 32, v000001b1ccbfda90_0, v000001b1ccbfdf90_0;
S_000001b1ccb6c4b0 .scope module, "pcmux" "mux2" 3 325, 3 392 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "d0";
    .port_info 1 /INPUT 32 "d1";
    .port_info 2 /INPUT 1 "s";
    .port_info 3 /OUTPUT 32 "y";
P_000001b1ccb99680 .param/l "WIDTH" 0 3 392, +C4<00000000000000000000000000100000>;
v000001b1ccbfc230_0 .net "d0", 31 0, L_000001b1ccc03c70;  alias, 1 drivers
v000001b1ccbfc0f0_0 .net "d1", 31 0, L_000001b1ccc04a30;  alias, 1 drivers
v000001b1ccbfca50_0 .net "s", 0 0, L_000001b1ccb86280;  alias, 1 drivers
v000001b1ccbfc690_0 .net "y", 31 0, L_000001b1ccc03590;  alias, 1 drivers
L_000001b1ccc03590 .functor MUXZ 32, L_000001b1ccc03c70, L_000001b1ccc04a30, L_000001b1ccb86280, C4<>;
S_000001b1ccb6c640 .scope module, "pcreg" "flopr" 3 322, 3 382 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "reset";
    .port_info 2 /INPUT 32 "d";
    .port_info 3 /OUTPUT 32 "q";
P_000001b1ccb99600 .param/l "WIDTH" 0 3 382, +C4<00000000000000000000000000100000>;
v000001b1ccbfc190_0 .net "clk", 0 0, v000001b1ccc04fd0_0;  alias, 1 drivers
v000001b1ccbfd9f0_0 .net "d", 31 0, L_000001b1ccc03590;  alias, 1 drivers
v000001b1ccbfda90_0 .var "q", 31 0;
v000001b1ccbfdc70_0 .net "reset", 0 0, v000001b1ccc039f0_0;  alias, 1 drivers
E_000001b1ccb99780 .event posedge, v000001b1ccbfdc70_0, v000001b1ccb92b60_0;
S_000001b1ccb64500 .scope module, "resultmux" "mux3" 3 335, 3 400 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "d0";
    .port_info 1 /INPUT 32 "d1";
    .port_info 2 /INPUT 32 "d2";
    .port_info 3 /INPUT 2 "s";
    .port_info 4 /OUTPUT 32 "y";
P_000001b1ccb99b40 .param/l "WIDTH" 0 3 400, +C4<00000000000000000000000000100000>;
v000001b1ccbfcd70_0 .net *"_ivl_1", 0 0, L_000001b1ccc60cf0;  1 drivers
v000001b1ccbfd1d0_0 .net *"_ivl_3", 0 0, L_000001b1ccc60390;  1 drivers
v000001b1ccbfdb30_0 .net *"_ivl_4", 31 0, L_000001b1ccc60890;  1 drivers
v000001b1ccbfdbd0_0 .net "d0", 31 0, v000001b1ccbfc9b0_0;  alias, 1 drivers
v000001b1ccbfde50_0 .net "d1", 31 0, L_000001b1ccb86590;  alias, 1 drivers
v000001b1ccbfc370_0 .net "d2", 31 0, L_000001b1ccc03c70;  alias, 1 drivers
v000001b1ccbfcaf0_0 .net "s", 1 0, L_000001b1ccc038b0;  alias, 1 drivers
v000001b1ccbfc2d0_0 .net "y", 31 0, L_000001b1ccc5f710;  alias, 1 drivers
L_000001b1ccc60cf0 .part L_000001b1ccc038b0, 1, 1;
L_000001b1ccc60390 .part L_000001b1ccc038b0, 0, 1;
L_000001b1ccc60890 .functor MUXZ 32, v000001b1ccbfc9b0_0, L_000001b1ccb86590, L_000001b1ccc60390, C4<>;
L_000001b1ccc5f710 .functor MUXZ 32, L_000001b1ccc60890, L_000001b1ccc03c70, L_000001b1ccc60cf0, C4<>;
S_000001b1ccc00430 .scope module, "rf" "regfile" 3 328, 3 338 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 1 "clk";
    .port_info 1 /INPUT 1 "we3";
    .port_info 2 /INPUT 5 "a1";
    .port_info 3 /INPUT 5 "a2";
    .port_info 4 /INPUT 5 "a3";
    .port_info 5 /INPUT 32 "wd3";
    .port_info 6 /OUTPUT 32 "rd1";
    .port_info 7 /OUTPUT 32 "rd2";
v000001b1ccbfceb0_0 .net *"_ivl_0", 31 0, L_000001b1ccc03130;  1 drivers
v000001b1ccbfcff0_0 .net *"_ivl_10", 6 0, L_000001b1ccc03630;  1 drivers
L_000001b1ccc051d0 .functor BUFT 1, C4<00>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfc550_0 .net *"_ivl_13", 1 0, L_000001b1ccc051d0;  1 drivers
L_000001b1ccc05218 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfd090_0 .net/2u *"_ivl_14", 31 0, L_000001b1ccc05218;  1 drivers
v000001b1ccbfc410_0 .net *"_ivl_18", 31 0, L_000001b1ccc03e50;  1 drivers
L_000001b1ccc05260 .functor BUFT 1, C4<000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfd130_0 .net *"_ivl_21", 26 0, L_000001b1ccc05260;  1 drivers
L_000001b1ccc052a8 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfc4b0_0 .net/2u *"_ivl_22", 31 0, L_000001b1ccc052a8;  1 drivers
v000001b1ccbfc5f0_0 .net *"_ivl_24", 0 0, L_000001b1ccc03270;  1 drivers
v000001b1ccbfc730_0 .net *"_ivl_26", 31 0, L_000001b1ccc03f90;  1 drivers
v000001b1ccbfcb90_0 .net *"_ivl_28", 6 0, L_000001b1ccc04030;  1 drivers
L_000001b1ccc05140 .functor BUFT 1, C4<000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfd270_0 .net *"_ivl_3", 26 0, L_000001b1ccc05140;  1 drivers
L_000001b1ccc052f0 .functor BUFT 1, C4<00>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfd590_0 .net *"_ivl_31", 1 0, L_000001b1ccc052f0;  1 drivers
L_000001b1ccc05338 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfd310_0 .net/2u *"_ivl_32", 31 0, L_000001b1ccc05338;  1 drivers
L_000001b1ccc05188 .functor BUFT 1, C4<00000000000000000000000000000000>, C4<0>, C4<0>, C4<0>;
v000001b1ccbfd450_0 .net/2u *"_ivl_4", 31 0, L_000001b1ccc05188;  1 drivers
v000001b1ccbfd630_0 .net *"_ivl_6", 0 0, L_000001b1ccc03db0;  1 drivers
v000001b1ccbfd770_0 .net *"_ivl_8", 31 0, L_000001b1ccc047b0;  1 drivers
v000001b1ccbfd4f0_0 .net "a1", 4 0, L_000001b1ccc03450;  1 drivers
v000001b1ccc02840_0 .net "a2", 4 0, L_000001b1ccc04df0;  1 drivers
v000001b1ccc02480_0 .net "a3", 4 0, L_000001b1ccc040d0;  1 drivers
v000001b1ccc02d40_0 .net "clk", 0 0, v000001b1ccc04fd0_0;  alias, 1 drivers
v000001b1ccc02980_0 .net "rd1", 31 0, L_000001b1ccc03770;  alias, 1 drivers
v000001b1ccc014e0_0 .net "rd2", 31 0, L_000001b1ccc04d50;  alias, 1 drivers
v000001b1ccc020c0 .array "rf", 0 31, 31 0;
v000001b1ccc02200_0 .net "wd3", 31 0, L_000001b1ccc5f710;  alias, 1 drivers
v000001b1ccc01b20_0 .net "we3", 0 0, L_000001b1ccc04b70;  alias, 1 drivers
L_000001b1ccc03130 .concat [ 5 27 0 0], L_000001b1ccc03450, L_000001b1ccc05140;
L_000001b1ccc03db0 .cmp/ne 32, L_000001b1ccc03130, L_000001b1ccc05188;
L_000001b1ccc047b0 .array/port v000001b1ccc020c0, L_000001b1ccc03630;
L_000001b1ccc03630 .concat [ 5 2 0 0], L_000001b1ccc03450, L_000001b1ccc051d0;
L_000001b1ccc03770 .functor MUXZ 32, L_000001b1ccc05218, L_000001b1ccc047b0, L_000001b1ccc03db0, C4<>;
L_000001b1ccc03e50 .concat [ 5 27 0 0], L_000001b1ccc04df0, L_000001b1ccc05260;
L_000001b1ccc03270 .cmp/ne 32, L_000001b1ccc03e50, L_000001b1ccc052a8;
L_000001b1ccc03f90 .array/port v000001b1ccc020c0, L_000001b1ccc04030;
L_000001b1ccc04030 .concat [ 5 2 0 0], L_000001b1ccc04df0, L_000001b1ccc052f0;
L_000001b1ccc04d50 .functor MUXZ 32, L_000001b1ccc05338, L_000001b1ccc03f90, L_000001b1ccc03270, C4<>;
S_000001b1ccc00a70 .scope module, "srcbmux" "mux2" 3 333, 3 392 0, S_000001b1ccbeeb60;
 .timescale 0 0;
    .port_info 0 /INPUT 32 "d0";
    .port_info 1 /INPUT 32 "d1";
    .port_info 2 /INPUT 1 "s";
    .port_info 3 /OUTPUT 32 "y";
P_000001b1ccb99c40 .param/l "WIDTH" 0 3 392, +C4<00000000000000000000000000100000>;
v000001b1ccc01440_0 .net "d0", 31 0, L_000001b1ccc04d50;  alias, 1 drivers
v000001b1ccc01620_0 .net "d1", 31 0, v000001b1ccbfdf90_0;  alias, 1 drivers
v000001b1ccc01da0_0 .net "s", 0 0, L_000001b1ccc03a90;  alias, 1 drivers
v000001b1ccc02ac0_0 .net "y", 31 0, L_000001b1ccc043f0;  alias, 1 drivers
L_000001b1ccc043f0 .functor MUXZ 32, L_000001b1ccc04d50, v000001b1ccbfdf90_0, L_000001b1ccc03a90, C4<>;
    .scope S_000001b1ccb680e0;
T_0 ;
Ewait_0 .event/or E_000001b1ccb99e00, E_0x0;
    %wait Ewait_0;
    %load/vec4 v000001b1ccbecc40_0;
    %dup/vec4;
    %pushi/vec4 3, 0, 7;
    %cmp/u;
    %jmp/1 T_0.0, 6;
    %dup/vec4;
    %pushi/vec4 35, 0, 7;
    %cmp/u;
    %jmp/1 T_0.1, 6;
    %dup/vec4;
    %pushi/vec4 51, 0, 7;
    %cmp/u;
    %jmp/1 T_0.2, 6;
    %dup/vec4;
    %pushi/vec4 99, 0, 7;
    %cmp/u;
    %jmp/1 T_0.3, 6;
    %dup/vec4;
    %pushi/vec4 19, 0, 7;
    %cmp/u;
    %jmp/1 T_0.4, 6;
    %dup/vec4;
    %pushi/vec4 111, 0, 7;
    %cmp/u;
    %jmp/1 T_0.5, 6;
    %dup/vec4;
    %pushi/vec4 11, 0, 7;
    %cmp/u;
    %jmp/1 T_0.6, 6;
    %pushi/vec4 2047, 2047, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.0 ;
    %pushi/vec4 1168, 0, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.1 ;
    %pushi/vec4 448, 0, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.2 ;
    %pushi/vec4 1796, 768, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.3 ;
    %pushi/vec4 522, 0, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.4 ;
    %pushi/vec4 1156, 0, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.5 ;
    %pushi/vec4 1825, 0, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.6 ;
    %pushi/vec4 1798, 768, 11;
    %store/vec4 v000001b1ccbed280_0, 0, 11;
    %jmp T_0.8;
T_0.8 ;
    %pop/vec4 1;
    %jmp T_0;
    .thread T_0, $push;
    .scope S_000001b1ccb67f50;
T_1 ;
Ewait_1 .event/or E_000001b1ccb99e40, E_0x0;
    %wait Ewait_1;
    %load/vec4 v000001b1ccb94000_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 2;
    %cmp/u;
    %jmp/1 T_1.0, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 2;
    %cmp/u;
    %jmp/1 T_1.1, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 2;
    %cmp/u;
    %jmp/1 T_1.2, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 2;
    %cmp/u;
    %jmp/1 T_1.3, 6;
    %pushi/vec4 31, 31, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.5;
T_1.0 ;
    %pushi/vec4 0, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.5;
T_1.1 ;
    %pushi/vec4 1, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.5;
T_1.2 ;
    %load/vec4 v000001b1ccb922a0_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 3;
    %cmp/u;
    %jmp/1 T_1.6, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 3;
    %cmp/u;
    %jmp/1 T_1.7, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 3;
    %cmp/u;
    %jmp/1 T_1.8, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 3;
    %cmp/u;
    %jmp/1 T_1.9, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 3;
    %cmp/u;
    %jmp/1 T_1.10, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 3;
    %cmp/u;
    %jmp/1 T_1.11, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 3;
    %cmp/u;
    %jmp/1 T_1.12, 6;
    %pushi/vec4 31, 31, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.6 ;
    %load/vec4 v000001b1ccb92200_0;
    %flag_set/vec4 8;
    %jmp/0 T_1.15, 8;
    %pushi/vec4 1, 0, 5;
    %jmp/1 T_1.16, 8;
T_1.15 ; End of true expr.
    %pushi/vec4 0, 0, 5;
    %jmp/0 T_1.16, 8;
 ; End of false expr.
    %blend;
T_1.16;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.7 ;
    %pushi/vec4 5, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.8 ;
    %pushi/vec4 3, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.9 ;
    %pushi/vec4 2, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.10 ;
    %pushi/vec4 4, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.11 ;
    %pushi/vec4 6, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.12 ;
    %pushi/vec4 7, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.14;
T_1.14 ;
    %pop/vec4 1;
    %jmp T_1.5;
T_1.3 ;
    %load/vec4 v000001b1ccb92340_0;
    %load/vec4 v000001b1ccb922a0_0;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 0, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.21, 4;
    %load/vec4 v000001b1ccb92340_0;
    %nor/r;
    %and;
T_1.21;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.19, 8;
    %pushi/vec4 8, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.20;
T_1.19 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 1, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.24, 4;
    %load/vec4 v000001b1ccb92340_0;
    %nor/r;
    %and;
T_1.24;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.22, 8;
    %pushi/vec4 9, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.23;
T_1.22 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 2, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.27, 4;
    %load/vec4 v000001b1ccb92340_0;
    %nor/r;
    %and;
T_1.27;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.25, 8;
    %pushi/vec4 10, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.26;
T_1.25 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 0, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.30, 4;
    %load/vec4 v000001b1ccb92340_0;
    %and;
T_1.30;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.28, 8;
    %pushi/vec4 11, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.29;
T_1.28 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 1, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.33, 4;
    %load/vec4 v000001b1ccb92340_0;
    %and;
T_1.33;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.31, 8;
    %pushi/vec4 12, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.32;
T_1.31 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 2, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.36, 4;
    %load/vec4 v000001b1ccb92340_0;
    %and;
T_1.36;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.34, 8;
    %pushi/vec4 13, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.35;
T_1.34 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 3, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.39, 4;
    %load/vec4 v000001b1ccb92340_0;
    %and;
T_1.39;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.37, 8;
    %pushi/vec4 14, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.38;
T_1.37 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 0, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.42, 4;
    %load/vec4 v000001b1ccb92340_0;
    %nor/r;
    %and;
T_1.42;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.40, 8;
    %pushi/vec4 15, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.41;
T_1.40 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 1, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.45, 4;
    %load/vec4 v000001b1ccb92340_0;
    %nor/r;
    %and;
T_1.45;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.43, 8;
    %pushi/vec4 16, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.44;
T_1.43 ;
    %load/vec4 v000001b1ccb922a0_0;
    %cmpi/e 0, 0, 3;
    %flag_get/vec4 4;
    %jmp/0 T_1.48, 4;
    %load/vec4 v000001b1ccb92340_0;
    %nor/r;
    %and;
T_1.48;
    %flag_set/vec4 8;
    %jmp/0xz  T_1.46, 8;
    %pushi/vec4 17, 0, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
    %jmp T_1.47;
T_1.46 ;
    %pushi/vec4 31, 31, 5;
    %store/vec4 v000001b1ccb931a0_0, 0, 5;
T_1.47 ;
T_1.44 ;
T_1.41 ;
T_1.38 ;
T_1.35 ;
T_1.32 ;
T_1.29 ;
T_1.26 ;
T_1.23 ;
T_1.20 ;
    %jmp T_1.18;
T_1.18 ;
    %pop/vec4 1;
    %jmp T_1.5;
T_1.5 ;
    %pop/vec4 1;
    %jmp T_1;
    .thread T_1, $push;
    .scope S_000001b1ccb6c640;
T_2 ;
    %wait E_000001b1ccb99780;
    %load/vec4 v000001b1ccbfdc70_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_2.0, 8;
    %pushi/vec4 0, 0, 32;
    %assign/vec4 v000001b1ccbfda90_0, 0;
    %jmp T_2.1;
T_2.0 ;
    %load/vec4 v000001b1ccbfd9f0_0;
    %assign/vec4 v000001b1ccbfda90_0, 0;
T_2.1 ;
    %jmp T_2;
    .thread T_2;
    .scope S_000001b1ccc00430;
T_3 ;
    %wait E_000001b1ccb99440;
    %load/vec4 v000001b1ccc01b20_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_3.0, 8;
    %load/vec4 v000001b1ccc02200_0;
    %load/vec4 v000001b1ccc02480_0;
    %pad/u 7;
    %ix/vec4 3;
    %ix/load 4, 0, 0; Constant delay
    %assign/vec4/a/d v000001b1ccc020c0, 0, 4;
T_3.0 ;
    %jmp T_3;
    .thread T_3;
    .scope S_000001b1ccb67c30;
T_4 ;
Ewait_2 .event/or E_000001b1ccb99500, E_0x0;
    %wait Ewait_2;
    %load/vec4 v000001b1ccbfce10_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 2;
    %cmp/u;
    %jmp/1 T_4.0, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 2;
    %cmp/u;
    %jmp/1 T_4.1, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 2;
    %cmp/u;
    %jmp/1 T_4.2, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 2;
    %cmp/u;
    %jmp/1 T_4.3, 6;
    %pushi/vec4 4294967295, 4294967295, 32;
    %store/vec4 v000001b1ccbfdf90_0, 0, 32;
    %jmp T_4.5;
T_4.0 ;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 1, 24, 6;
    %replicate 20;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 12, 13, 5;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v000001b1ccbfdf90_0, 0, 32;
    %jmp T_4.5;
T_4.1 ;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 1, 24, 6;
    %replicate 20;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 7, 18, 6;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 5, 0, 2;
    %concat/vec4; draw_concat_vec4
    %store/vec4 v000001b1ccbfdf90_0, 0, 32;
    %jmp T_4.5;
T_4.2 ;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 1, 24, 6;
    %replicate 20;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 1, 0, 2;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 6, 18, 6;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 4, 1, 2;
    %concat/vec4; draw_concat_vec4
    %concati/vec4 0, 0, 1;
    %store/vec4 v000001b1ccbfdf90_0, 0, 32;
    %jmp T_4.5;
T_4.3 ;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 1, 24, 6;
    %replicate 12;
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 8, 5, 4;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 1, 13, 5;
    %concat/vec4; draw_concat_vec4
    %load/vec4 v000001b1ccbfddb0_0;
    %parti/s 10, 14, 5;
    %concat/vec4; draw_concat_vec4
    %concati/vec4 0, 0, 1;
    %store/vec4 v000001b1ccbfdf90_0, 0, 32;
    %jmp T_4.5;
T_4.5 ;
    %pop/vec4 1;
    %jmp T_4;
    .thread T_4, $push;
    .scope S_000001b1ccbeecf0;
T_5 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %store/vec4 v000001b1ccbee720_0, 0, 32;
    %load/vec4 v000001b1ccbee900_0;
    %store/vec4 v000001b1ccbfc910_0, 0, 32;
    %load/vec4 v000001b1ccbee900_0;
    %parti/s 5, 0, 2;
    %store/vec4 v000001b1ccbfcf50_0, 0, 5;
    %end;
    .thread T_5, $init;
    .scope S_000001b1ccbeecf0;
T_6 ;
Ewait_3 .event/or E_000001b1ccb997c0, E_0x0;
    %wait Ewait_3;
    %load/vec4 v000001b1ccbed140_0;
    %dup/vec4;
    %pushi/vec4 0, 0, 5;
    %cmp/u;
    %jmp/1 T_6.0, 6;
    %dup/vec4;
    %pushi/vec4 1, 0, 5;
    %cmp/u;
    %jmp/1 T_6.1, 6;
    %dup/vec4;
    %pushi/vec4 2, 0, 5;
    %cmp/u;
    %jmp/1 T_6.2, 6;
    %dup/vec4;
    %pushi/vec4 3, 0, 5;
    %cmp/u;
    %jmp/1 T_6.3, 6;
    %dup/vec4;
    %pushi/vec4 4, 0, 5;
    %cmp/u;
    %jmp/1 T_6.4, 6;
    %dup/vec4;
    %pushi/vec4 5, 0, 5;
    %cmp/u;
    %jmp/1 T_6.5, 6;
    %dup/vec4;
    %pushi/vec4 6, 0, 5;
    %cmp/u;
    %jmp/1 T_6.6, 6;
    %dup/vec4;
    %pushi/vec4 7, 0, 5;
    %cmp/u;
    %jmp/1 T_6.7, 6;
    %dup/vec4;
    %pushi/vec4 8, 0, 5;
    %cmp/u;
    %jmp/1 T_6.8, 6;
    %dup/vec4;
    %pushi/vec4 9, 0, 5;
    %cmp/u;
    %jmp/1 T_6.9, 6;
    %dup/vec4;
    %pushi/vec4 10, 0, 5;
    %cmp/u;
    %jmp/1 T_6.10, 6;
    %dup/vec4;
    %pushi/vec4 11, 0, 5;
    %cmp/u;
    %jmp/1 T_6.11, 6;
    %dup/vec4;
    %pushi/vec4 12, 0, 5;
    %cmp/u;
    %jmp/1 T_6.12, 6;
    %dup/vec4;
    %pushi/vec4 13, 0, 5;
    %cmp/u;
    %jmp/1 T_6.13, 6;
    %dup/vec4;
    %pushi/vec4 14, 0, 5;
    %cmp/u;
    %jmp/1 T_6.14, 6;
    %dup/vec4;
    %pushi/vec4 15, 0, 5;
    %cmp/u;
    %jmp/1 T_6.15, 6;
    %dup/vec4;
    %pushi/vec4 16, 0, 5;
    %cmp/u;
    %jmp/1 T_6.16, 6;
    %dup/vec4;
    %pushi/vec4 17, 0, 5;
    %cmp/u;
    %jmp/1 T_6.17, 6;
    %pushi/vec4 4294967295, 4294967295, 32;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.0 ;
    %load/vec4 v000001b1ccbfc870_0;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.1 ;
    %load/vec4 v000001b1ccbfc870_0;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.2 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %load/vec4 v000001b1ccbee900_0;
    %and;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.3 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %load/vec4 v000001b1ccbee900_0;
    %or;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.4 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %load/vec4 v000001b1ccbee900_0;
    %xor;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.5 ;
    %load/vec4 v000001b1ccbfc870_0;
    %parti/s 1, 31, 6;
    %pad/u 32;
    %load/vec4 v000001b1ccbfd3b0_0;
    %pad/u 32;
    %xor;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.6 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %ix/getv 4, v000001b1ccbfcf50_0;
    %shiftl 4;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.7 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %ix/getv 4, v000001b1ccbfcf50_0;
    %shiftr 4;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.8 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %load/vec4 v000001b1ccbee900_0;
    %inv;
    %and;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.9 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %load/vec4 v000001b1ccbee900_0;
    %inv;
    %or;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.10 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %load/vec4 v000001b1ccbee900_0;
    %xor;
    %inv;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.11 ;
    %load/vec4 v000001b1ccbee720_0;
    %load/vec4 v000001b1ccbfc910_0;
    %cmp/s;
    %flag_mov 8, 5;
    %jmp/0 T_6.20, 8;
    %load/vec4 v000001b1ccbee0e0_0;
    %jmp/1 T_6.21, 8;
T_6.20 ; End of true expr.
    %load/vec4 v000001b1ccbee900_0;
    %jmp/0 T_6.21, 8;
 ; End of false expr.
    %blend;
T_6.21;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.12 ;
    %load/vec4 v000001b1ccbfc910_0;
    %load/vec4 v000001b1ccbee720_0;
    %cmp/s;
    %flag_mov 8, 5;
    %jmp/0 T_6.22, 8;
    %load/vec4 v000001b1ccbee0e0_0;
    %jmp/1 T_6.23, 8;
T_6.22 ; End of true expr.
    %load/vec4 v000001b1ccbee900_0;
    %jmp/0 T_6.23, 8;
 ; End of false expr.
    %blend;
T_6.23;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.13 ;
    %load/vec4 v000001b1ccbee0e0_0;
    %load/vec4 v000001b1ccbee900_0;
    %cmp/u;
    %flag_mov 8, 5;
    %jmp/0 T_6.24, 8;
    %load/vec4 v000001b1ccbee0e0_0;
    %jmp/1 T_6.25, 8;
T_6.24 ; End of true expr.
    %load/vec4 v000001b1ccbee900_0;
    %jmp/0 T_6.25, 8;
 ; End of false expr.
    %blend;
T_6.25;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.14 ;
    %load/vec4 v000001b1ccbee900_0;
    %load/vec4 v000001b1ccbee0e0_0;
    %cmp/u;
    %flag_mov 8, 5;
    %jmp/0 T_6.26, 8;
    %load/vec4 v000001b1ccbee0e0_0;
    %jmp/1 T_6.27, 8;
T_6.26 ; End of true expr.
    %load/vec4 v000001b1ccbee900_0;
    %jmp/0 T_6.27, 8;
 ; End of false expr.
    %blend;
T_6.27;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.15 ;
    %load/vec4 v000001b1ccbfcf50_0;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %flag_mov 8, 4;
    %jmp/0 T_6.28, 8;
    %load/vec4 v000001b1ccbee0e0_0;
    %jmp/1 T_6.29, 8;
T_6.28 ; End of true expr.
    %load/vec4 v000001b1ccbee0e0_0;
    %ix/getv 4, v000001b1ccbfcf50_0;
    %shiftl 4;
    %load/vec4 v000001b1ccbee0e0_0;
    %pushi/vec4 32, 0, 32;
    %load/vec4 v000001b1ccbfcf50_0;
    %pad/u 32;
    %sub;
    %ix/vec4 4;
    %shiftr 4;
    %or;
    %jmp/0 T_6.29, 8;
 ; End of false expr.
    %blend;
T_6.29;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.16 ;
    %load/vec4 v000001b1ccbfcf50_0;
    %pad/u 32;
    %cmpi/e 0, 0, 32;
    %flag_mov 8, 4;
    %jmp/0 T_6.30, 8;
    %load/vec4 v000001b1ccbee0e0_0;
    %jmp/1 T_6.31, 8;
T_6.30 ; End of true expr.
    %load/vec4 v000001b1ccbee0e0_0;
    %ix/getv 4, v000001b1ccbfcf50_0;
    %shiftr 4;
    %load/vec4 v000001b1ccbee0e0_0;
    %pushi/vec4 32, 0, 32;
    %load/vec4 v000001b1ccbfcf50_0;
    %pad/u 32;
    %sub;
    %ix/vec4 4;
    %shiftl 4;
    %or;
    %jmp/0 T_6.31, 8;
 ; End of false expr.
    %blend;
T_6.31;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.17 ;
    %load/vec4 v000001b1ccbee720_0;
    %cmpi/s 0, 0, 32;
    %flag_inv 5; GE is !LT
    %flag_mov 8, 5;
    %jmp/0 T_6.32, 8;
    %load/vec4 v000001b1ccbee0e0_0;
    %jmp/1 T_6.33, 8;
T_6.32 ; End of true expr.
    %pushi/vec4 0, 0, 32;
    %load/vec4 v000001b1ccbee0e0_0;
    %sub;
    %jmp/0 T_6.33, 8;
 ; End of false expr.
    %blend;
T_6.33;
    %store/vec4 v000001b1ccbfc9b0_0, 0, 32;
    %jmp T_6.19;
T_6.19 ;
    %pop/vec4 1;
    %jmp T_6;
    .thread T_6, $push;
    .scope S_000001b1ccb398a0;
T_7 ;
    %vpi_call/w 3 414 "$readmemh", "rvx10.txt", v000001b1ccb932e0 {0 0 0};
    %end;
    .thread T_7;
    .scope S_000001b1ccb39710;
T_8 ;
    %wait E_000001b1ccb99440;
    %load/vec4 v000001b1ccb93d80_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_8.0, 8;
    %load/vec4 v000001b1ccb93880_0;
    %load/vec4 v000001b1ccb92ca0_0;
    %parti/s 30, 2, 3;
    %ix/vec4 3;
    %ix/load 4, 0, 0; Constant delay
    %assign/vec4/a/d v000001b1ccb937e0, 0, 4;
T_8.0 ;
    %jmp T_8;
    .thread T_8;
    .scope S_000001b1ccb36fd0;
T_9 ;
    %pushi/vec4 1, 0, 1;
    %assign/vec4 v000001b1ccc039f0_0, 0;
    %delay 22, 0;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v000001b1ccc039f0_0, 0;
    %end;
    .thread T_9;
    .scope S_000001b1ccb36fd0;
T_10 ;
    %vpi_call/w 3 125 "$dumpfile", "wave.vcd" {0 0 0};
    %vpi_call/w 3 126 "$dumpvars", 32'sb00000000000000000000000000000000, S_000001b1ccb36fd0 {0 0 0};
    %end;
    .thread T_10;
    .scope S_000001b1ccb36fd0;
T_11 ;
    %pushi/vec4 1, 0, 1;
    %assign/vec4 v000001b1ccc04fd0_0, 0;
    %delay 5, 0;
    %pushi/vec4 0, 0, 1;
    %assign/vec4 v000001b1ccc04fd0_0, 0;
    %delay 5, 0;
    %jmp T_11;
    .thread T_11;
    .scope S_000001b1ccb36fd0;
T_12 ;
    %wait E_000001b1ccb99640;
    %load/vec4 v000001b1ccc03b30_0;
    %flag_set/vec4 8;
    %jmp/0xz  T_12.0, 8;
    %load/vec4 v000001b1ccc03310_0;
    %pushi/vec4 100, 0, 32;
    %cmp/e;
    %flag_get/vec4 6;
    %load/vec4 v000001b1ccc03950_0;
    %pushi/vec4 25, 0, 32;
    %cmp/e;
    %flag_get/vec4 6;
    %and;
    %flag_set/vec4 8;
    %jmp/0xz  T_12.2, 8;
    %vpi_call/w 3 143 "$display", "Simulation succeeded" {0 0 0};
    %vpi_call/w 3 144 "$stop" {0 0 0};
    %jmp T_12.3;
T_12.2 ;
    %load/vec4 v000001b1ccc03310_0;
    %cmpi/ne 96, 0, 32;
    %jmp/0xz  T_12.4, 6;
    %vpi_call/w 3 146 "$display", "Simulation failed" {0 0 0};
    %vpi_call/w 3 147 "$stop" {0 0 0};
T_12.4 ;
T_12.3 ;
T_12.0 ;
    %jmp T_12;
    .thread T_12;
# The file index is used to find the file name in the following table.
:file_names 4;
    "N/A";
    "<interactive>";
    "-";
    "riscvsingle.sv";
