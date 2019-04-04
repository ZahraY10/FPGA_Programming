library ieee;
use ieee.STD_LOGIC_1164.all;

entity mux is
  Port(w0: in std_logic;
	 w1: in std_logic;
	 w2: in std_logic;
	 w3: in std_logic;
	 w4: in std_logic;
	 w5: in std_logic;
	 w6: in std_logic;
	 w7: in std_logic;
	 S: in std_logic_vector(2 downto 0);
  y: out std_logic);
end mux;

architecture Behavioural of mux is
begin
  y <= w0 when S = "000" else
       w1 when S = "001" else
       w2 when S = "010" else
       w3 when S = "011" else
       w4 when S = "100" else
       w5 when S = "101" else
       w6 when S = "110" else
       w7;
  
end Behavioural;
