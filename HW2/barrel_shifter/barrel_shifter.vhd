library ieee;
use ieee.STD_LOGIC_1164.all;

entity barrel_shifter is
	port(input: in std_logic_vector(7 downto 0);
		shamt: in std_logic_vector(2 downto 0);
		mode: in std_logic;
	output: out std_logic_vector(7 downto 0));
end barrel_shifter;

architecture Behavioural of barrel_shifter is

	component mux is
	  Port(w0: in std_logic;
		 w1: in std_logic;
		 w2: in std_logic;
		 w3: in std_logic;
		 w4: in std_logic;
		 w5: in std_logic;
		 w6: in std_logic;
		 w7: in std_logic;
		 S: in std_logic_vector(2 downto 0);
	  y: out std_logic);
	end component mux;
begin

    M0: mux port map(input(0), input(1), input(2), input(3), input(4), input(5), input(6), input(7), shamt, output(0));
    M1: mux port map(input(1), input(2), input(3), input(4), input(5), input(6), input(7), input(0), shamt, output(1));
    M2: mux port map(input(2), input(3), input(4), input(5), input(6), input(7), input(0), input(1), shamt, output(2));
    M3: mux port map(input(3), input(4), input(5), input(6), input(7), input(0), input(1), input(2), shamt, output(3));
    M4: mux port map(input(4), input(5), input(6), input(7), input(0), input(1), input(2), input(3), shamt, output(4));
    M5: mux port map(input(5), input(6), input(7), input(0), input(1), input(2), input(3), input(4), shamt, output(5));
    M6: mux port map(input(6), input(7), input(0), input(1), input(2), input(3), input(4), input(5), shamt, output(6));
    M7: mux port map(input(7), input(0), input(1), input(2), input(3), input(4), input(5), input(6), shamt, output(7));
  
end Behavioural;
  
  
  
