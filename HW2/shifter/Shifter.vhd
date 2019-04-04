library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Shifter is
	Port(input: in std_logic_vector(7 downto 0) := (others => '0');
		shamt: in std_logic_vector(2 downto 0) := (others => '0');
		mode: in std_logic := '0';
		output: out std_logic_vector(7 downto 0)
	);

end Shifter;

architecture Behavioral of Shifter is

	signal my_vector: std_logic_vector(7 downto 0);
	signal msb : std_logic := '0';
	signal concat : std_logic := '0';
	
begin
	process
		begin
			my_vector <= input;
			msb <= my_vector(7);
			concat <= msb and mode;
			for I in 0 to (to_integer(unsigned(shamt)) - 1) loop
				my_vector <= concat & my_vector(my_vector'left downto 1);
			end loop;	
			output <= my_vector;
			wait for 1000 ns;
	end process;
end Behavioral;

