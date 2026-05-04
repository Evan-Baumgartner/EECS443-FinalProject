----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity clock_divider is
    port(
        clk: in std_logic;
        f_o: out std_logic
    );
end clock_divider;

architecture Behavioral of clock_divider is
constant count_max: natural := integer(1000);
constant n: natural := integer(500);

--Signal/constant/component declarations
signal r_reg, r_next: std_logic_vector (n-1 downto 0):= (others => '0');

begin
process (clk) begin
    if rising_edge(clk) then 
        r_reg <= r_next;
    end if; 
end process;

r_next <= r_reg + '1' when (r_reg < count_max - 1) else (others => '0');
f_o <= '0' when (r_reg < count_max/2) else '1';

end Behavioral;
