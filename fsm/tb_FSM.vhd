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

entity tb_FSM is
--  Port ( );
end tb_FSM;

architecture Behavioral of tb_FSM is

component FSM is
    port(
      Clk : in std_logic;
      Rst : in std_logic;
      Sel : in std_logic_vector(3 downto 0);
      Dout   : out std_logic    
    );
end component;

signal Clk : std_logic := '0';
signal Rst : std_logic := '1';
signal Sel : std_logic_vector(3 downto 0) :=(others=>'0');
signal Dout : std_logic;
constant clk_period : time := 10 ns;

begin

DUT: FSM 
    port map(
        Clk => Clk,
        Rst => Rst,
        Sel => Sel,
        Dout => Dout
    );    

clk <= not clk after clk_period/2;

stim_p: process
begin
    Rst <= '0';
    wait for 20 us;  
    Rst <= '1'; 
    wait for 20 us;
    Sel <= x"1";
    wait for 20 us;
    Sel <= x"3";
    wait for 20 us;
    Sel <= x"7";    
    wait for 20 us;
    Sel <= x"F";   
    wait for 20 us;
    Rst <= '0';
    wait for 20 us;  
    Rst <= '1'; 
    wait;
end process;
    
end Behavioral;
