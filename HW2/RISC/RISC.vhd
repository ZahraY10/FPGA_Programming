library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity RISC is
end RISC;

architecture Behavioral of RISC is

type opcode is array (6 downto 0) of bit;
type rd is array (4 downto 0) of bit;
type funct3 is array (2 downto 0) of bit;
type imm5 is array (4 downto 0) of bit;
type rs1 is array (4 downto 0) of bit;
type rs2 is array (4 downto 0) of bit;
type funct7 is array (6 downto 0) of bit;
type imm12 is array (11 downto 0) of bit;
type imm7 is array (6 downto 0) of bit;
type imm6 is array (5 downto 0) of bit;
type imm20 is array (19 downto 0) of bit;


type R_type is record
  funct7 : funct7;
  rs2 : rs2;
  rs1 : rs1;
  funct3 : funct3;
  opcode : opcode;
end record;

type I_type is record
  imm : imm12;
  rs1 : rs1;
  funct3 : funct3;
  rd : rd;
  opcode : opcode;
end record;

type S_type is record
  imm11_5bit :  imm7;
  rs2 : rs2;
  rs1 : rs1;
  funct3 : funct3;
  imm4_0bit : imm5;
  opcode : opcode;
end record;

type B_type is record
  imm12 : bit;
  imm10_5bit : imm6;
  rs2 : rs2;
  rs1 : rs1;
  funct3 : funct3;
  imm4_1_11bit : imm5;
  opcode : opcode;
end record;

type U_type is record
  imm31_12bit : imm20;
  rd : rd;
  opcode : opcode;
end record;

type J_type is record
  imm : imm20;
  rd : rd;
  opcode : opcode;
end record;
begin



end Behavioral;