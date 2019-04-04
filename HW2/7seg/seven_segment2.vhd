library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity seven_segment2 is
	Port(input: in std_logic_vector(3 downto 0);
		output: out std_logic_vector(6 downto 0)
	);
end seven_segment2;

architecture Behavioral of seven_segment2 is

begin

	output <=  "0111111" when input = "0000" else
    "0000110" when input = "0001" else
    "1011011" when input = "0010" else
    "1001111" when input = "0011" else
    "1100110" when input = "0100" else
    "1101101" when input = "0101" else
    "1111101" when input = "0110" else
    "0000111" when input = "0111" else
    "1111111" when input = "1000" else
    "1101111" when input = "1001" else
    "1110111" when input = "1010" else --A
    "1111100" when input = "1011" else --B
    "0111001" when input = "1100" else --C
    "1011110" when input = "1101" else --D
    "1111001" when input = "1110" else --E
    "1110001"; --F

end Behavioral;

