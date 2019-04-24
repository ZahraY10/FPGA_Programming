library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
-- use IEEE.NUMERIC_STD.ALL;
use IEEE.math_real.all;

entity diod is
	
	generic (Vt: real := 4.0;
	eta: real := 4.0;
	G: real := 4.0;
	B: real := 4.0;
	V: real := 4.0;
	Ibv: real := 4.0;
	e: real := 2.7182);
	
	Port(I: in real := 4.0;
	Vd: in real := 4.0;
	Id: out real := 0.0);
	
end diod;

architecture Behavioral of diod is
		
	-- epsilon := 1.0E-5

begin

	shockley_diode: process(I, Vd)
	begin
		if (-5.0*Vt-Vd <= 1.0E-5) then
			Id <= I * (e**(Vd / (eta * Vt))-1.0)+Vd*G;
		elsif (-1.0 * B * V - Vd < 1.0E-5 and Vd + 5.0 * Vt < 1.0E-5) then
			Id <= -1.0 * I + Vd * G;
		elsif (Vd = -1.0 * B * V) then
			Id <= -1.0 * Ibv;
		elsif (Vd - B * V <= 1.0E-5) then
			Id <= I * (e ** (Vd / (eta * Vt)) + (B * V) / Vt - 1.0) + Vd * G;
		end if;
	end process;

end Behavioral;

