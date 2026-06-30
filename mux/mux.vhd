----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.06.2025 17:00:43
-- Design Name: 
-- Module Name: mux - Behavioral
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

entity mux is
   port (
   a, b, c, d   :   in  std_logic;
   s            :   in  std_logic_vector(1 downto 0);
   y            :   out std_logic
   );
end mux;


architecture Behavioral of mux is

begin

y <= 	a when s = "00" else
   	    b when s = "01" else 
   	    c when s = "10" else
   	    d when s = "11" else
   	    'X';


end Behavioral;
