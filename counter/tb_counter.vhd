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
    generic(
      period : integer := 2**26
    );
    port(
      clk : in std_logic;
      rst : in std_logic;
      sw  : in std_logic_vector(1 downto 0);
      O   : out std_logic_vector(3 downto 0)    
    );
end component;

signal clk : std_logic := '0';
signal rst : std_logic := '0';
signal sw : std_logic_vector(1 downto 0) :=(others=>'0');
signal counter_o : std_logic_vector(3 downto 0);
constant clk_period : time := 10 ns;

begin

DUT: counter
    generic map(
        period => 2**5 - 1
    )    
    port map(
        clk => clk,
        rst => rst,
        sw => sw,
        O  => counter_o
    );    

clk <= not clk after clk_period/2;

--clk_p: process
--begin
--    clk <= '1';
--    wait for clk_period/2;
--    clk <= '0';
--    wait for clk_period/2;    
--end process;

stim_p: process
begin
    wait for 20 us;
    sw <= "01";
    wait for 20 us;
    sw <= "10";
    wait for 20 us;
    sw <= "11";        
    wait;
end process;
    
end Behavioral;
