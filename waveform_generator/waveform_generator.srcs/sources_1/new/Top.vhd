----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/30/2026 07:28:20 PM
-- Design Name: 
-- Module Name: Top - Behavioral
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

entity Top is
    Port ( freq : in STD_LOGIC_VECTOR (1 downto 0);
           sel : in STD_LOGIC_VECTOR (1 downto 0);
           wav : out STD_LOGIC_VECTOR (7 downto 0);
           clk : in STD_LOGIC);
end Top;

architecture Behavioral of Top is

component PhaseAccumulator is
    Port ( Clk : in STD_LOGIC;
           Freq : in STD_LOGIC_VECTOR (1 downto 0);
           Phase : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Rectangle is
    Port ( Phase : in STD_LOGIC_VECTOR (7 downto 0);
           Wav : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Sawtooth is
    Port ( Phase : in STD_LOGIC_VECTOR (7 downto 0);
           Wav : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Sine is
    Port ( Phase : in STD_LOGIC_VECTOR (7 downto 0);
           Wav : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component Triangle is
    Port ( Phase : in STD_LOGIC_VECTOR (7 downto 0);
           Wav : out STD_LOGIC_VECTOR (7 downto 0));
end component;

component clock_divider is
    port(
        clk: in std_logic;
        f_o: out std_logic
    );
end component;

signal internal_phase: std_logic_vector (7 downto 0):= "00000000";
signal rect, saw, sin, tri: std_logic_vector (7 downto 0);
signal divided_clk: std_logic;


begin
my_PhaseAccumulator: PhaseAccumulator port map(
    Clk => divided_clk,
    Freq => freq,
    Phase => internal_phase
);
my_Rectangle: Rectangle port map(
    Phase => internal_phase,
    Wav => rect
);
my_Sawtooth: Sawtooth port map(
    Phase => internal_phase,
    Wav => saw
);
my_Sine: Sine port map(
    Phase => internal_phase,
    Wav => sin
);
my_Triangle: Triangle port map(
    Phase => internal_phase,
    Wav => tri
);
my_clock_divider: clock_divider port map(
    clk => clk,
    f_o => divided_clk
);

wav <= rect when sel="00" else
       saw when sel="01" else
       sin when sel="10" else
       tri;
       



end Behavioral;
