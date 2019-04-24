library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity piso is
	
	Generic(n: integer := 4);
	
	Port(shift_enable: in std_logic;
		reset: in std_logic;
      load: in std_logic;
      input: in std_logic_vector(n - 1 downto 0);
      output: out std_logic);

end piso;


architecture Behavioural of piso is
begin

    process(shift_enable,reset,load,input) is
    variable temp: std_logic_vector(input'range);
    begin
        if(reset = '1') then
            temp := (others => '0');
        elsif(load = '1') then
            temp := input ;
        elsif(shift_enable = '1') then
            output <= temp(3);
            temp := temp(n - 2 downto 0) & '0';
        end if;
    end process;

end Behavioural;
