----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 09:59:41 PM
-- Design Name: 
-- Module Name: Top_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_tb is
   --port()
end Top_tb;

architecture Behavioral of Top_tb is
component Top is 
 Port ( freq : in STD_LOGIC_VECTOR (1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           wav : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end component;

signal freq, sel: std_logic_vector(1 downto 0):= "10";
signal wav: std_logic_vector(7 downto 0);
signal clk: std_logic:= '0';

begin

UUT: Top 
port map (clk => clk, freq => freq, wav => wav, sel => sel);

process
		variable k : integer := 0;
	begin
		
		wait for 10 ns;
		for i in 0 to 200000000 loop
            clk <= '1';
            wait for 10 ns;
            clk <= '0';
            wait for 10 ns;
        end loop;
	end process;

end Behavioral;
