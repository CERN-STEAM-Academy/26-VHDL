----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 15:15:42
-- Design Name: 
-- Module Name: d_flipflop - Behavioral
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

entity d_flipflop is
port(
      Q : out std_logic;    
      Clk :in std_logic; 
      rst :in std_logic;  
      D :in  std_logic    
   );
end d_flipflop;

architecture Behavioral of d_flipflop is

begin

process(Clk)
begin 
   
  if (rising_edge(Clk)) then        -- (Clk'EVENT and Clk = '1') 
    if rst = '1' then    
        Q <= '0';
    else    
        Q <= D;
    end if;       
  end if;       
end process;  


end Behavioral;
