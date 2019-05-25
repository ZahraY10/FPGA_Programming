library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity CCITT is
    Port (input: in STD_LOGIC;
          reset: in STD_LOGIC;
          enable: in STD_LOGIC;
          clk: in std_logic;
          output: out STD_LOGIC_VECTOR (15 downto 0));
end CCITT;

architecture Behavioral of CCITT is

    component INV
        Port(A: in STD_LOGIC;
             F: out STD_LOGIC);
    end component;

    component reg        Port(D: in STD_LOGIC;
        reset: in STD_LOGIC;
        clk: in std_logic;
        Q: out STD_LOGIC);
    end component;

    type sign_arr is array (15 downto 0) of std_logic;
    signal signal_array : sign_arr;
    signal s1,s2,s3,s4 : std_logic;

begin
  
    gen_reg: for I in 0 to 2 generate
        REGX: reg port map(D => signal_array(i+1),
                               reset => reset,
                               clk => clk,
                               Q => signal_array(i));
    end generate gen_reg;
   
   REGX3: reg port map (D => s1,
                            reset => reset,
                            clk => clk,
                            Q => signal_array(3));
   
   GEN_REG2: for I in 4 to 9 generate
        REGX: reg port map (D => signal_array(i + 1),
                                reset => reset,
                                clk => clk,
                                Q => signal_array(i));
   end generate GEN_REG2;
   
   REGX10: reg port map (D => s2,
                             reset => reset,
                             clk => clk,
                             Q => signal_array(10));
   
   GEN_REG3: for I in 11 to 14 generate
        REGX : reg port map (D => signal_array(i + 1),
                                 reset => reset,
                                 clk => clk,
                                 Q => signal_array(i));
   end generate GEN_REG3;
   
   REGX15: reg port map (D => s3,
                             reset => reset,
                             clk => clk,
                             Q => signal_array(15));
       
    
    out_gen: for I in 0 to 15 generate
        output(i) <= signal_array(i);
    end generate out_gen;
   
    s4 <= signal_array(0) xor input;
    s3 <= s4 xor '0';
    s2 <= signal_array(11) xor s4;
    s1 <= signal_array(4) xor s4;
 
end Behavioral;
