----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 15.10.2023 14:26:57
-- Design Name: 
-- Module Name: FSM - Behavioral
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

entity FSM is
    port(
      Clk : in std_logic;
      Rst : in std_logic;
      Sel : in std_logic_vector(3 downto 0);
      Dout   : out std_logic 
    );  
end FSM;

architecture Behavioral of FSM is

type state_t is (idle, start, S0_0, S0_1, S0_2, S1_0, S1_1, S1_2, finish);
signal State : state_t;

begin

process(Clk) is
begin
   if rising_edge(Clk) then
       if Rst = '0' then
           State <= idle;
           Dout  <= '0';
       else
         case State is
            when idle    => if Sel = x"0" then
                                State <= start;
                            end if;       
            when start   => if Sel = x"1" then
                                State <= S0_0;
                            elsif Sel = x"8" then    
                                State <= S1_0;
                            elsif Sel /= x"0" then
                                State <= idle;    
                            end if;
            when S0_0    => if Sel = x"3" then
                                State <= S0_1;
                            elsif Sel /= x"1" then
                                State <= idle;    
                            end if;
            when S0_1    => if Sel = x"7" then
                                State <= S0_2;
                            elsif Sel /= x"3" then
                                State <= idle;    
                            end if;
            when S0_2    => if Sel = x"F" then
                                State <= finish;
                            elsif Sel /= x"7" then
                                State <= idle;    
                            end if;  
            when S1_0    => if Sel = x"C" then
                                State <= S1_1;
                            elsif Sel /= x"8" then
                                State <= idle;    
                            end if;
            when S1_1    => if Sel = x"E" then
                                State <= S1_2;
                            elsif Sel /= x"C" then
                                State <= idle;    
                            end if;
            when S1_2    => if Sel = x"F" then
                                State <= finish;
                            elsif Sel /= x"E" then
                                State <= idle;    
                            end if;                                                                                               
            when finish  => Dout <= '1';                      
            when others  => State <= idle;
         end case;
      end if;
   end if;
end process;

end Behavioral;
