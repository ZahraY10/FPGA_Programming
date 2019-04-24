library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity sum_time is

end sum_time;

architecture Behavioral of sum_time is
	
	subtype time_part is integer;
	type whole_time is array (2 downto 0) of time_part;
	
	function "+" (a, b: whole_time) return whole_time is
		variable hour: time_part := 0;
		variable minute: time_part := 0;
		variable second: time_part := 0;
		variable new_time: whole_time;
	begin
		hour := (a(2) + b(2)) mod 24;
		minute := (a(1) + b(1)) mod 60;
		second := (a(0) + b(0)) mod 60;
		new_time(2) := hour;
		new_time(1) := minute;
		new_time(0) := second;
		return new_time;
	end "+";
	
	signal t1: whole_time := (1, 23, 45);
	signal t2: whole_time := (5, 43, 21);
	signal t3: whole_time := (0, 0, 0);
	
begin
	
	t3 <= t1 + t2;
	
end Behavioral;

