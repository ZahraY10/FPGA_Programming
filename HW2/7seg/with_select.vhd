LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
ENTITY with_select IS
END with_select;
 
ARCHITECTURE behavior OF with_select IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT seven_segment
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(6 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(6 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: seven_segment PORT MAP (
          input => input,
          output => output
        );

 
   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	
		input <= "0000";
		wait for 100 ns;	
		input <= "0001";
		wait for 100 ns;	
		input <= "0010";
		wait for 100 ns;	
		input <= "0011";
		wait for 100 ns;	
		input <= "0100";
		wait for 100 ns;	
		input <= "0101";
		wait for 100 ns;	
		input <= "0110";
		wait for 100 ns;	
		input <= "0111"
		;wait for 100 ns;	
		input <= "1000";
		wait for 100 ns;	
		input <= "1001";
		wait for 100 ns;	
		input <= "1010";
		wait for 100 ns;	
		input <= "1011";
		wait for 100 ns;	
		input <= "1100";
		wait for 100 ns;	
		input <= "1101";
		wait for 100 ns;	
		input <= "1110";
		wait for 100 ns;	
		input <= "1111";
      -- insert stimulus here 

      wait;
   end process;

END;
