----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 22.09.2023 15:10:54
-- Design Name: 
-- Module Name: nbit_adder - Behavioral
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

entity nbit_adder is
    generic (n: NATURAL :=4);
    port (A, B: in std_logic_vector(n-1 downto 0);
    Cin : in std_logic;
    Sum : out std_logic_vector(n-1 downto 0);
    Cout: out std_logic);
end nbit_adder;

architecture unsigned_a of nbit_adder is

    signal result : unsigned(n downto 0);
    signal carry : unsigned(n downto 0);
    constant zeros : unsigned(n-1 downto 0) := (others => '0');

begin

    carry <= (zeros & Cin);
    result <= ('0' & unsigned(A)) + ('0' & unsigned(B));-- + carry;
    Sum <= std_logic_vector(result(n-1 downto 0));
    Cout <= result(n);


end unsigned_a;
