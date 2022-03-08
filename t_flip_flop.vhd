library ieee;
use ieee.std_logic_1164.all;

entity t_flip_flop is
port(
    T        : in std_logic;
    clk      : in std_logic;
    reset    : in std_logic;
    Q, Q_bar : out std_logic
);
end t_flip_flop;

architecture behavioral of t_flip_flop is
begin
   process(clk, reset)
        variable temp: std_logic;
   begin
	if (reset = '1') then
	        temp := '0';
        elsif (clk'event and clk='1') then	  
	    if (T='1') then
		temp := NOT(temp);
            end if;
		-- if T=0, the output will remain the same as before which
		-- is the default action, so no code is needed to describe it
	end if;
        Q <= temp;
        Q_bar <= NOT temp;
    end process;
end behavioral;
