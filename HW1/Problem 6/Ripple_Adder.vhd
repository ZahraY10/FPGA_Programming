library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Ripple_Adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C0 : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C4 : out  STD_LOGIC);
end Ripple_Adder;

architecture Behavioral of Ripple_Adder is

	-- component declaration
	component full_adder is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Cin : in  STD_LOGIC;
           S : out  STD_LOGIC;
           Cout : out  STD_LOGIC);
	end component;
	
	-- signal declaration
	signal C1 : STD_LOGIC;
	signal C2 : STD_LOGIC;
	signal C3 : STD_LOGIC;
	
begin
	-- port mapping
		FA1: full_adder port map(A(0), B(0), C0, S(0), C1);
		FA2: full_adder port map(A(1), B(1), C1, S(1), C2);
		FA3: full_adder port map(A(2), B(2), C2, S(2), C3);
		FA4: full_adder port map(A(3), B(3), C3, S(3), C4);
		
end Behavioral;

