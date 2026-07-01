----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 15:52:15
-- Design Name: 
-- Module Name: counter - Behavioral
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

entity counter is
    generic(
      period : integer := 2**26 - 1
    );  
    port(
      clk : in std_logic;
      rst : in std_logic;
      sw  : in std_logic_vector(1 downto 0);
      O   : out std_logic_vector(3 downto 0)    
    );
end counter;

architecture Behavioral of counter is

COMPONENT ila_0

PORT (
	clk : IN STD_LOGIC;
	probe0 : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
	probe1 : IN STD_LOGIC_VECTOR(3 DOWNTO 0)
);
END COMPONENT  ;

signal clk_couter : integer :=0; 
signal count : unsigned(3 downto 0) :=(others => '0');

begin

process(Clk)
begin 
    if(rising_edge(clk)) then
        if rst = '1' then
            count <= (others=>'0');
            clk_couter <= 0;
        else
            clk_couter <= clk_couter + 1;
            if clk_couter = period then
                clk_couter <= 0;
                case sw is
                    when "00"   =>  count <= count + 1;
                    when "01"   =>  count <= count - 1;
                    when "10"   =>  count <= count + 3;
                    when "11"   =>  count <= count - 3;
                    when others =>  count <= (others=>'0');
                end case;
            end if;    
        end if;    
    end if;       
end process;  

O <= std_logic_vector(count);
 
end Behavioral;
