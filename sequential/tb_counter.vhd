----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2023 12:45:27
-- Design Name: 
-- Module Name: tb_counter - Behavioral
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

entity tb_counter is
--  Port ( );
end tb_counter;

architecture Behavioral of tb_counter is

component counter is
    port(
      Clk : in std_logic;
      O   : out std_logic_vector(3 downto 0)    
    );
end component;

signal clk : std_logic := '0';
signal counter_o : std_logic_vector(3 downto 0);
constant clk_period : time := 10 ns;

begin

DUT: counter
    port map(
        Clk => clk,
        O  => counter_o
    );    

clk <= not clk after clk_period/2;

end Behavioral;
