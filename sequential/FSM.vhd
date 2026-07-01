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
      Dout   : out std_logic_vector(3 downto 0)  
    );  
end FSM;

architecture Behavioral of FSM is

type state_t is (S0, S1);
signal state : state_t;
--signal NextState : state_t;
constant Value0 : std_logic_vector(3 downto 0) := x"A";
constant Value1 : std_logic_vector(3 downto 0) := x"5";

begin

process(Clk) is
begin
   if rising_edge(Clk) then
       if Rst = '1' then
           State <= S0;
           Dout  <= Value0;
       else
         case State is
            when S0 =>   if Sel = x"A" then
                                       State <= S1;
                                       Dout <= Value0;
                                    end if;
            when S1 =>   if Sel = x"5" then
                                       State <= S0;
		                               Dout <= Value1;
                                    end if;
            when others =>  Dout <= Value0;
                                       State <= S0;
         end case;
      end if;
   end if;
end process;

--------------------------------------------------------------------

--process(Clk) is
--begin
--   if rising_edge(Clk) then
--       if Rst = '1' then
--           State <= S0;
--       else
--           State <= NextState;
--       end if;
--   end if;
--end process;

--process(State, Sel) is
--begin
--    NextState <= State;
--         case State is
--            when S0 =>      if Sel = x"A" then
--                                NextState <= S1; 
--                                Dout <= Value0;
--                            end if;
--            when S1 =>      if Sel = x"5" then
--                                NextState <= S0;
--                                Dout <= Value1;
--		                    end if;
--            when others =>  Dout <= Value0;
--                                NextState <= S0;
--         end case;
--end process;

--------------------------------------------------------------------

--process(Clk) is
--begin
--    if rising_edge(Clk) then
--        if Rst = '1' then
--            State <= S0;
--            Dout  <= Value0;
 
--        else
--            State <= NextState;
 
--            case State is
 
--                when S0 =>
--                    Dout <= Value0;
 
--                when S1 =>
--                    Dout <= Value1;
 
--            end case;
--        end if;
--    end if;
--end process;
 
--process(State, Sel) is
--begin
--    NextState <= State;
 
--    case State is
 
--        when S0 =>
--            if Sel = x"A" then
--                NextState <= S1;
--            end if;
 
--        when S1 =>
--            if Sel = x"5" then
--                NextState <= S0;
--            end if;
 
--    end case;
--end process;


end Behavioral;
