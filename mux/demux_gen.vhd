----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2023 09:55:44
-- Design Name: 
-- Module Name: demux_gen - Behavioral
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

entity demux_gen is
    generic (N: POSITIVE :=8;
             M: POSITIVE :=4
    );
    port (
        input       : in std_logic_vector(N-1 downto 0);
        sel         : in std_logic_vector(M-1 downto 0);
        output      : out std_logic_vector(2**M*N-1 downto 0)
    );
end demux_gen;

architecture Behavioral of demux_gen is

begin

demux_generate: for i in 0 to 2**M-1 generate
    output((i+1)*N-1 downto i*N) <= input when sel = std_logic_vector(to_unsigned(i,M)) else (others=>'0');
end generate;

end Behavioral;
