----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.08.2023 16:03:45
-- Design Name: 
-- Module Name: comb_func_2 - Behavioral
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

entity comb_func_2 is
    port (a : in    std_logic;
          b : in    std_logic;
          c : in    std_logic;
          z : out   std_logic
    );
end comb_func_2;

architecture Behavioral of comb_func_2 is

    component and_port is
        port (x : in    std_logic;
              y : in    std_logic;
              z : out   std_logic
        );
    end component;
    
    component or_port is
        port (x : in    std_logic;
              y : in    std_logic;
              z : out   std_logic
        );
    end component;
    
    component not_port is
        port (x : in    std_logic;
              z : out   std_logic
        );
    end component;
    
    signal p, q, r : std_logic;
        
begin

    port_1: not_port
        port map (x => a,
                  z => p
        );

    port_2: and_port
        port map (x => p,
                  y => b,
                  z => q
        );
        
    port_3: and_port
        port map (x => a,
                  y => c,
                  z => r
        );    
        
    port_4: or_port
        port map (x => q,
                  y => r,
                  z => z
        );    
        
end Behavioral;
