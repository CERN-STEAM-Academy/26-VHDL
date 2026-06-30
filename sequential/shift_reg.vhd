----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 16:33:25
-- Design Name: 
-- Module Name: shift_reg - Behavioral
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

entity shift_reg is
port(
      clk   : in std_logic; 
      rst   : in std_logic;   
      in_d  : in std_logic;   
      out_d : out  std_logic    
   );
end shift_reg;

architecture Behavioral of shift_reg is

signal reg : std_logic_vector(7 downto 0);

begin

sreg : process(clk, rst)
begin
  if (rst = '1') then
    reg <= (others=>'0');
  elsif (rising_edge(clk)) then
    reg(0) <= in_d;
    for i in 1 to reg'left loop
      reg(i) <= reg(i-1) ;
    end loop;
  end if;
end process;

out_d <= reg(7);

end Behavioral;
