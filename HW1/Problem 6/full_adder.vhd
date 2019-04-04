library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
	
	signal AxorB : STD_LOGIC;
	signal AxorBandCin : STD_LOGIC;
	signal AandB : STD_LOGIC;
	
begin
	
	AxorB <= A xor B;
	S <= Cin xor AxorB;
	AxorBandCin <= AxorB and Cin;
	AandB <= A and B;
	Cout <= AxorBandCin or AandB;

end Behavioral;

