----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2023 09:13:47
-- Design Name: 
-- Module Name: demux - Behavioral
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

entity demux is
    generic (N: POSITIVE :=8);
    port (
        input       : in std_logic_vector(N-1 downto 0);
        sel         : in std_logic_vector(1 downto 0);
        output_1    : out std_logic_vector(N-1 downto 0);
        output_2    : out std_logic_vector(N-1 downto 0);
        output_3    : out std_logic_vector(N-1 downto 0);
        output_4    : out std_logic_vector(N-1 downto 0)
    );
end demux;

architecture Behavioral of demux is

begin

    output_1 <= input when sel = "00" else (others=>'0');
    output_2 <= input when sel = "01" else (others=>'0');
    output_3 <= input when sel = "10" else (others=>'0');
    output_4 <= input when sel = "11" else (others=>'0');

end Behavioral;
