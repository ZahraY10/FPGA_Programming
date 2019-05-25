library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL; 

entity inverse is
  port(clk, start, reset: in std_logic;
      input: in std_logic_vector(15 downto 0);
      valid: inout std_logic;
      output: out std_logic_vector(15 downto 0));
end entity;

architecture Behavioral of inverse is
    type matrix is array (0 to 4) of std_logic_vector(15 downto 0);
    
    signal det: std_logic_vector(15 downto 0) := (others => '0');
    signal det1: std_logic_vector(15 downto 0) := (others => '0');
    signal det2: std_logic_vector(15 downto 0) := (others => '0');
    signal temp: matrix := (others => "0000000000000000");
    signal full: integer := 0;
    signal index: integer :=0;
    
    begin
        process(clk, start, reset)
        begin
            if(reset = '1') then
                valid <= '0';
                output <= (others => '0');
                temp <= (others => "0000000000000001");
                det <= (others => '0');
                full <= 0;
            elsif(start = '1' and reset = '0') then
                if(full = 0) then
                    temp(0) <= input;
                    full <= full + 1;
                elsif(full = 1) then
                    temp(1) <= input;
                    full <= full + 1;
                elsif(full = 2) then
                    temp(2) <= input;
                    full <= full + 1;
                elsif(full = 3) then
                    temp(3) <= input;
                    full <= full + 1;
                end if;
                if(full = 4) then 
                    det1 <= std_logic_vector(signed(temp(3)) * signed(temp(0)));
                    det2 <= std_logic_vector(signed(temp(1)) * signed(temp(2)));
                    det <= std_logic_vector(signed(det1) - signed(det2)); 
                    det <= std_logic_vector(-1 / signed(det));
                    temp(0) <= std_logic_vector(signed(temp(0)) * signed(det));
                    temp(1) <= std_logic_vector(signed(temp(1)) * signed(det));
                    temp(2) <= std_logic_vector(signed(temp(2)) * signed(det));
                    temp(3) <= std_logic_vector(signed(temp(3)) * signed(det));
                    valid <= '1';
                    full <= 0;
                end if;    
            end if;        
        end process;
        process(clk) 
        begin
            if(valid = '1') then
                output <= temp(index);
                index <= index + 1;  
            end if;   
        end process; 
end Behavioral;