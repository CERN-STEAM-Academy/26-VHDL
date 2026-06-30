----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 12:06:54
-- Design Name: 
-- Module Name: nbit_adder_gen - Behavioral
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

entity nbit_adder_gen is
    generic (n: NATURAL :=4);
    port (A, B: in std_logic_vector(n-1 downto 0);
    Cin : in std_logic;
    Sum : out std_logic_vector(n-1 downto 0);
    Cout: out std_logic);
end nbit_adder_gen;

architecture Behavioral of nbit_adder_gen is

component onebit_adder is
    port (
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Sum : out std_logic;
    Cout: out std_logic);
end component;

signal y : std_logic_vector(n downto 0);

begin

y(0) <= Cin;
Cout <= y(n);

addres_gen: for i in 0 to n-1 generate
    add: onebit_adder
        port map(
            A       => A(i),
            B       => B(i),
            Cin     => y(i),
            Sum     => Sum(i),
            Cout    => y(i+1)
        );     
end generate;

end Behavioral;
