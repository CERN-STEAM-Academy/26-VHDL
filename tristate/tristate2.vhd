----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 14:56:42
-- Design Name: 
-- Module Name: tristate2 - Behavioral
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
library UNISIM;
use UNISIM.VComponents.all;

entity tristate2 is

Port (
   I    : in  STD_LOGIC; 
   T    : in  STD_LOGIC; 
   O    : out STD_LOGIC);
end tristate2;

architecture Behavioral of tristate2 is

begin

   OBUFT_inst : OBUFT
   generic map (
      DRIVE => 12,
      IOSTANDARD => "DEFAULT",
      SLEW => "SLOW")
   port map (
      O => O,     -- Buffer output (connect directly to top-level port)
      I => I,     -- Buffer input
      T => T      -- 3-state enable input 
   );


end Behavioral;
