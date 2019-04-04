library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SubAddModule is
	Port( A: in STD_LOGIC_VECTOR(3 downto 0); 
			B: in STD_LOGIC_VECTOR(3 downto 0);
			Opt: in STD_LOGIC;
			Zero: out STD_LOGIC;
			Carry: out STD_LOGIC;
			Result: out STD_LOGIC_VECTOR(3 downto 0);
			Overflow: out STD_LOGIC;
			Neg: out STD_LOGIC
	);
end SubAddModule;

architecture Behavioral of SubAddModule is

	component Ripple_Adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           C0 : in  STD_LOGIC;
           S : out  STD_LOGIC_VECTOR (3 downto 0);
           C4 : out  STD_LOGIC);
	end component;

	signal res: STD_LOGIC_VECTOR(3 downto 0);
	signal resCarry: STD_LOGIC;
	signal B2: STD_LOGIC_VECTOR(3 downto 0);
	
	
begin

	B2(0) <= B(0) xor Opt;
	B2(1) <= B(1) xor Opt;
	B2(2) <= B(2) xor Opt;
	B2(3) <= B(3) xor Opt;
	
	RA: Ripple_Adder port map(A, B2, Opt, res, resCarry);
	
	process(Opt, A, B)
	begin
	
		if(res = "0000" and resCarry = '0') then --zero
				Zero <= '1';
		else
				Zero <= '0';
		end if;
			
		if(res(3) = '1') then --neg
			Neg <= '1';
		end if;
			
		if(A(3) = '0' and B(3) = '0' and res(3) = '1') then --overflow
			Overflow <= '1';
		elsif(A(3) = '1' and B(3) = '1' and res(3) = '0') then
			Overflow <= '1';
		else
			Overflow <= '0';
		end if;
				
	end process;

	Result <= res;
	Carry <= resCarry;
	
end Behavioral;

