----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2024 08:30:17
-- Design Name: 
-- Module Name: shift_reg_array - Behavioral
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

entity shift_reg_array is
port(
      clk   : in std_logic; 
      rst   : in std_logic;   
      in_d  : in std_logic_vector(7 downto 0);  
      out_d : out  std_logic_vector(7 downto 0)    
   );
end shift_reg_array;

architecture Behavioral of shift_reg_array is

type reg_t is array (0 to 31) of std_logic_vector(7 downto 0);
signal reg : reg_t;

begin

sreg : process(clk, rst)
begin
  if (rst = '1') then
    reg <= (others=>(others=>'0'));
  elsif (rising_edge(clk)) then
    reg(0) <= in_d;
    for i in 1 to reg'right loop
      reg(i) <= reg(i-1) ; 
    end loop;
  end if;
end process;

out_d <= reg(31);

end Behavioral;
