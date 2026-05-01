----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 07:54:49 PM
-- Design Name: 
-- Module Name: Rectangle - Behavioral
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

entity Rectangle is
    Port ( Phase : in STD_LOGIC_VECTOR (7 downto 0);
           Wav : out STD_LOGIC_VECTOR (7 downto 0));
end Rectangle;

architecture Behavioral of Rectangle is

begin
Wav <= "00000000" when Phase(7) = '0' else --make the square wave flip every 128 units of the counter for 50% duty cycle
       "11111111" when Phase(7) = '1';

end Behavioral;
