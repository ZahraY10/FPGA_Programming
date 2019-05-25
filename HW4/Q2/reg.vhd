Library IEEE;
USE IEEE.Std_logic_1164.all;

entity reg is 
  port (
  D: in STD_LOGIC;
  reset : in STD_LOGIC;
  clk : in std_logic;
  Q: out STD_LOGIC);
end reg;

architecture Behavioral of reg is  
begin  
 process(Clk)
 begin 
    if(rising_edge(Clk)) then
   if(reset='1') then 
    Q <= '0';
   else 
    Q <= D; 
   end if;
    end if;       
 end process;  
end Behavioral;