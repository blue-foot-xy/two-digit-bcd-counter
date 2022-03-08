library ieee;
use ieee.std_logic_1164.all;

entity decade_counter is
port(
    v_cc  : in std_logic;
    clk   : in std_logic;
    clr   : in std_logic;
    Q_out : out std_logic_vector(3 downto 0)
);
end decade_counter;

architecture structural of decade_counter is

    signal reset : std_logic;
	 signal Q     : std_logic_vector(3 downto 0);
	 signal Q_bar0, Q_bar1, Q_bar2 : std_logic;
	 
    component t_flip_flop is
    port(
             T        : in std_logic;
	     clk      : in std_logic;
	     reset    : in std_logic;
	     Q, Q_bar : out std_logic
    );
    end component;
	 
begin
    reset <= '1' when (clr='1') else
	     '1' when (Q(1)='1' and Q(3)='1') else
	     --'1' when (v_cc='0') else
	     '0';

    tff0: t_flip_flop port map(T=>v_cc, clk=>clk, Q=>Q(0), Q_bar=>Q_bar0, reset=>reset);
    tff1: t_flip_flop port map(T=>v_cc, clk=>Q_bar0, Q=>Q(1), Q_bar=>Q_bar1, reset=>reset);
    tff2: t_flip_flop port map(T=>v_cc, clk=>Q_bar1, Q=>Q(2), Q_bar=>Q_bar2, reset=>reset);
    tff3: t_flip_flop port map(T=>v_cc, clk=>Q_bar2, Q=>Q(3), reset=>reset);
	 
    Q_out <= Q;
	 
end structural; 
