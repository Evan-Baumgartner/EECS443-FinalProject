----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 07:55:34 PM
-- Design Name: 
-- Module Name: Triangle - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Triangle is
    Port ( Phase : in STD_LOGIC_VECTOR (7 downto 0);
           Wav : out STD_LOGIC_VECTOR (7 downto 0));
end Triangle;

architecture Behavioral of Triangle is
begin

Wav <= STD_LOGIC_VECTOR(2 * unsigned(Phase(6 downto 0))) when Phase(7) = '0' else
       STD_LOGIC_VECTOR(2 * ( 127 - unsigned(Phase(6 downto 0))));
       
end Behavioral;
