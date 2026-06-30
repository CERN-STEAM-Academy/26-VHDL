----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 11:41:54
-- Design Name: 
-- Module Name: 1bit_adder - Behavioral
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

entity onebit_adder is
    port (
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Sum : out std_logic;
    Cout: out std_logic);
end onebit_adder;

architecture Behavioral of onebit_adder is

begin

    Sum <= a xor b xor Cin;
    Cout <= (a and b) or (a and Cin) or (b and Cin);

end Behavioral;
