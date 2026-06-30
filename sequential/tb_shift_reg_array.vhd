----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.10.2024 08:54:20
-- Design Name: 
-- Module Name: tb_shift_reg_array - Behavioral
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

entity tb_shift_reg_array is
--  Port ( );
end tb_shift_reg_array;

architecture Behavioral of tb_shift_reg_array is

component shift_reg_array is
port(
      clk   : in std_logic; 
      rst   : in std_logic;   
      in_d  : in std_logic_vector(7 downto 0);   
      out_d : out  std_logic_vector(7 downto 0)    
   );
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal in_d : std_logic_vector(7 downto 0) := (others=>'0');
signal out_d : std_logic_vector(7 downto 0);
constant clk_period : time := 10 ns;

begin

DUT: shift_reg_array
    port map(
        clk => clk,
        rst => rst,
        in_d => in_d,
        out_d => out_d
    );  
    
clk <= not clk after clk_period/2;

rst_p: process
begin
    rst <= '1';
    wait for 200 ns;
    rst <= '0';
    wait;
end process; 
    
stim_p: process
begin
    in_d <= std_logic_vector(unsigned(in_d) + 1);
    wait for clk_period;
end process;    

end Behavioral;
