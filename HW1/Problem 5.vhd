library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FPGAQ1 is
	port( A: in STD_LOGIC_VECTOR(1 downto 0);
		B: in STD_LOGIC_VECTOR(1 downto 0);
		F: out STD_LOGIC
	);
end FPGAQ1;

architecture Behavioral of FPGAQ1 is
	
begin
	
	F <= (((not A(0)) or B(0)) and ((not A(1)) or B(1))) or (B(0) and B(1)); 
	
end Behavioral;

