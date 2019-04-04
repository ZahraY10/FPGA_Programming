library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ROM is
	
	generic (n : integer := 4;
	m : integer := 4);
	
	Port( mode: in std_logic := '0';
	address: in std_logic_vector(m-1 downto 0) := (others => '0');
	data: out std_logic_vector(n-1 downto 0) := (others => '0')
	);
end ROM;

architecture Behavioral of ROM is

	subtype ROW_BYTE is std_logic_vector((n-1) downto 0);
	type memory is array (0 to 2 ** m - 1) of ROW_BYTE;
	
	function init_rom
		return memory is 
		variable tmp : memory := (others => (others => '0'));
	begin 
		for addr_pos in 0 to 2 ** m - 1 loop 
			-- Initialize each address with the address itself
			tmp(addr_pos):= std_logic_vector(to_unsigned(addr_pos, n));
		end loop;
		return tmp;
	end init_rom;	 
	
	signal r : memory := init_rom;
	signal addr : integer := 0;

begin

	process
		begin
			addr <= to_integer(unsigned(address));
			if(mode = '0') then --Big Endian
				data <= r(addr);
				wait for 100 ns;
				data <= r(addr + 1);
				wait for 100 ns;
				data <= r(addr + 2);
				wait for 100 ns;
				data <= r(addr + 3);
			elsif(mode = '1') then --Little Endian	
				data <= r(addr + 3);
				wait for 100 ns;
				data <= r(addr + 2);				
				wait for 100 ns;
				data <= r(addr + 1);
				wait for 100 ns;
				data <= r(addr);
			end if;
	end process;

end Behavioral;

