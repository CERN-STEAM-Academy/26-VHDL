----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.09.2023 08:49:20
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    port(
        clk     : in    std_logic;
        input   : in    std_logic;
        output  : out   std_logic       
    );
end top;

architecture Behavioral of top is

component clk_wiz_0
port
 (-- Clock in ports
  -- Clock out ports
  clk_out1          : out    std_logic;
  clk_in1           : in     std_logic
 );
end component;

COMPONENT ila_0
PORT (
	clk : IN STD_LOGIC;
    probe0 : IN STD_LOGIC_VECTOR(0 DOWNTO 0); 
	probe1 : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
	probe2 : IN STD_LOGIC_VECTOR(0 DOWNTO 0)
);
END COMPONENT  ;

signal internal, internal2, edge : std_logic;

begin

clk_gen : clk_wiz_0
   port map ( 
  -- Clock out ports  
   clk_out1 => output,
   -- Clock in ports
   clk_in1 => clk
 );

process(clk)
begin
    if rising_edge(clk) then
        internal <= input;
        if (internal = '0') and (input = '1') then
            edge <= '1';
        else
            edge <= '0';
        end if;    
    end if;
end process;

debug_core : ila_0
PORT MAP (
	clk => clk,
	probe0(0) => input, 
	probe1(0) => internal,
	probe2(0) => edge
);
    

end Behavioral;
