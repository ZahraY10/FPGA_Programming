library ieee;
use ieee.std_logic_1164.all;

entity sipo is
	
	Generic(n: integer := 4);
	
	Port(shift_enable: in std_logic;
		reset: in std_logic;
		input: in std_logic;
		output: inout std_logic_vector(n - 1 downto 0) := (others => '0'));
	
end sipo;

architecture Behavioural of sipo is

	begin
		process(shift_enable)
		begin
		if(reset = '1') then
			output <= (others => '0');
		elsif(shift_enable'event and shift_enable = '1') then
			output(n - 1 downto 1) <= output(n - 2 downto 0);
			output(0) <= input;
		end if;
	 end process;

end Behavioural;
