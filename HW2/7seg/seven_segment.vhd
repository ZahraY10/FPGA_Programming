library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment is
	Port( input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(6 downto 0)
	);

end seven_segment;

architecture Behavioral of seven_segment is

begin
	
	with input select output <=
	--gfedcba
    "0111111" when "0000",
    "0000110" when "0001",
    "1011011" when "0010",
    "1001111" when "0011",
    "1100110" when "0100",
    "1101101" when "0101",
    "1111101" when "0110",
    "0000111" when "0111",
    "1111111" when "1000",
    "1101111" when "1001",
    "1110111" when "1010", --A
    "1111100" when "1011", --B
    "0111001" when "1100", --C
    "1011110" when "1101", --D
    "1111001" when "1110", --E
    "1110001" when "1111"; --F

end Behavioral;

