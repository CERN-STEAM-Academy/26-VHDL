----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 15:52:15
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    port(
      Clk : in std_logic;
      O   : out std_logic_vector(3 downto 0)    
    );
end counter;

architecture Behavioral of counter is

signal count : unsigned(3 downto 0) :=(others => '0');

begin

process(Clk, count)
begin 
    if(rising_edge(Clk)) then
        count <= count + 1; 
    end if;       
end process;  

O <= std_logic_vector(count);
   
end Behavioral;
