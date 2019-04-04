library ieee;
use ieee.STD_LOGIC_1164.all;

entity shift is
end shift;


architecture Behavioural of shift is 

component shifter is
  Port(input: in std_logic_vector(7 downto 0);
	shamt: in std_logic_vector(2 downto 0);
   mode: in std_logic_vector;
   output: out std_logic_vector(7 downto 0)
	);
end component;

	signal mode : std_logic := '0';
	signal input : std_logic_vector(6 downto 0) := (others => '0');

begin

	--PORT MAPPING

end Behavioural;

configuration CONFIG_SHIFTER of shift is

	for Behavioural
		for S1:shifter 
			use entity work.shifter(Behavioral);
		end for;
		for S2:barrel_shifter 
			use entity work.barrel_shifter(Behavioural);
		end for;
	end for;

end CONFIG_SHIFTER;

