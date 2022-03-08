library ieee;
use ieee.std_logic_1164.all;

entity two_digit_bcd_counter is
port(
    v_cc  : in std_logic;
    clk   : in std_logic;
	 clr   : in std_logic;
    bcd0 : out std_logic_vector(3 downto 0);
	 bcd1 : out std_logic_vector(3 downto 0)
);
end two_digit_bcd_counter;

architecture structural of two_digit_bcd_counter is

signal y1, y2, y3, y4, y5, y6, y7, y8 : std_logic;
signal output0, output1 : std_logic_vector(3 downto 0);

component decade_counter is
port(
    v_cc  : in std_logic;
    clk   : in std_logic;
	 clr   : in std_logic;
    Q_out : out std_logic_vector(3 downto 0)
);
end component;
	 
begin
    bcd_counter_0: decade_counter port map(v_cc=>v_cc, clk=> clk, clr=> y8, Q_out=> output0);
	 bcd_counter_1: decade_counter port map(v_cc=>y3 , clk=> clk, clr=> y7, Q_out=> output1);
	 
	 y1 <= output0(0);
	 y2 <= output0(3);
	 y4 <= output1(0);
	 y5 <= output1(3);
	 
	 y3 <= y1 and y2;
	 y6 <= y4 and y5;
	 y8 <= y3 or clr;
	 y7 <= y6 or clr;
	 
	 bcd0 <= output0;
	 bcd1 <= output1;
	 
end structural; 