----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.09.2023 11:46:45
-- Design Name: 
-- Module Name: 4bit_adder - Behavioral
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

entity fourbit_adder is
port (
    A : in std_logic_vector(3 downto 0);
    B : in std_logic_vector(3 downto 0);
    Cin : in std_logic;
    Sum : out std_logic_vector(3 downto 0);
    Cout: out std_logic);
end fourbit_adder;

architecture Behavioral of fourbit_adder is

component onebit_adder is
    port (
    A : in std_logic;
    B : in std_logic;
    Cin : in std_logic;
    Sum : out std_logic;
    Cout: out std_logic);
end component;

signal y1, y2, y3 : std_logic;

begin

a1: onebit_adder
    port map (
        A       => A(0),
        B       => B(0),
        Cin     => Cin,
        Sum     => Sum(0),
        Cout    => y1
    );
    
a2: onebit_adder
    port map (
        A       => A(1),
        B       => B(1),
        Cin     => y1,
        Sum     => Sum(1),
        Cout    => y2
    );

a3: onebit_adder
    port map (
        A       => A(2),
        B       => B(2),
        Cin     => y2,
        Sum     => Sum(2),
        Cout    => y3
    );
 
a4: onebit_adder
    port map (
        A       => A(3),
        B       => B(3),
        Cin     => y3,
        Sum     => Sum(3),
        Cout    => Cout
    );            

end Behavioral;
