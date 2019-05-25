library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity stack is
	generic(
	m : natural := 8;
        n: natural := 8 ;
        DEPTH: natural := 256);

	Port(data_in: in  std_logic_vector(m - 1 downto 0);
             data_out: out std_logic_vector(m - 1 downto 0);
             I_RD_WR: in  std_logic;
             write: in  std_logic;
             read: in  std_logic;
             full: out std_logic;
             empty: out std_logic;
             error: out std_logic;
             clock: in  std_logic;
             reset: in  std_logic);
end stack;

architecture Behavioral of stack is
 
	function to_std_logic(B : boolean) return std_logic is
 		begin
	  	        if B = false then
	            		return '0';
	        	else
	            		return '1';
	        	end if;
    	end function to_std_logic;

	type memory_type is array (0 to DEPTH - 1) of std_logic_vector(m - 1 downto 0);
        signal memory : memory_type;

begin
 
	main: process(CLOCK, RESET) is
        	variable stack_pointer: integer range 0 to DEPTH := 0;
        	variable EMPTY, FULL  : boolean                  := false;
        	begin
        	if (reset = '1') then
	        	memory   <= (others => (others => '0'));
	                EMPTY := true;
	          	FULL  := false;
			stack_pointer := 0;
                elsif (rising_edge(clock)) then
                	if (WRITE = '1') then
                        	if (stack_pointer < 16) then
                                	stack_pointer := stack_pointer + 1;
                                	memory(stack_pointer - 1) <=DATA_IN;
                            	end if;
                        end if;   
            	elsif (READ = '1') then
                	if (not EMPTY) then
                		data_out <= memory(stack_pointer);
                    		stack_pointer := stack_pointer - 1;
                	end if;
			if (stack_pointer = 0) then
                		EMPTY := true;
            		else
                		EMPTY := false;
            		end if;
			if (stack_pointer = DEPTH) then
                		FULL := true;
            		else
                		FULL := false;
            		end if;
        	end if;

		FULL  <= to_std_logic(FULL);
        	EMPTY <= to_std_logic(EMPTY);
    end process main;
end Behavioral;
