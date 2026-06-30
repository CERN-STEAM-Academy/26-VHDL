----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 12.10.2023 09:23:53
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top_demux is
    port (
        input   : in std_logic_vector(3 downto 0);
        sel         : in std_logic_vector(1 downto 0);
        output_1    : out std_logic_vector(3 downto 0);
        output_2    : out std_logic_vector(3 downto 0);
        output_3    : out std_logic_vector(3 downto 0);
        output_4    : out std_logic_vector(3 downto 0) 
    );    
end top_demux;

architecture Behavioral of top_demux is

component demux is
    generic (N: POSITIVE :=8);
    port (
        input       : in std_logic_vector(N-1 downto 0);
        sel         : in std_logic_vector(1 downto 0);
        output_1    : out std_logic_vector(N-1 downto 0);
        output_2    : out std_logic_vector(N-1 downto 0);
        output_3    : out std_logic_vector(N-1 downto 0);
        output_4    : out std_logic_vector(N-1 downto 0)
    );
end component;

begin

demux_inst: demux
    generic map ( 
        N => 4
    )
    port map (
        input       => input,
        sel         => sel,
        output_1    => output_1,
        output_2    => output_2,
        output_3    => output_3,
        output_4    => output_4
    );   

end Behavioral;
