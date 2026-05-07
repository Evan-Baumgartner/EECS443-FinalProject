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
use IEEE.NUMERIC_STD.ALL;

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

signal freq: std_logic_vector(1 downto 0):= "00";
signal wav1, wav2, wav3, wav4: std_logic_vector(7 downto 0) := "00000000";
signal clk: std_logic:= '0';

begin

UUT1: Top 
port map (clk => clk, freq => freq, wav => wav1, sel => "00");

UUT2: Top
port map (clk => clk, freq => freq, wav => wav2, sel => "01");

UUT3: Top
port map (clk => clk, freq => freq, wav => wav3, sel => "10");

UUT4: Top
port map (clk => clk, freq => freq, wav => wav4, sel => "11");

process
    variable k : integer := 0;
	begin
	
	   for i in 0 to 3 loop
            wait for 10 ns;
            for j in 0 to 500000 loop
                clk <= '1';
                wait for 5 ns;
                clk <= '0';
                wait for 5 ns;
            end loop;
            freq <= std_logic_vector(unsigned(freq) + 1);
	   end loop;
	
	end process;

end Behavioral;
