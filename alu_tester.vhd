----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 04:43:42 PM
-- Design Name: 
-- Module Name: alu_tester - Behavioral
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

entity alu_tester is
  Port ( 
      btn : in  std_logic_vector(3 downto 0);
      clk : in  std_logic;
      sw  : in  std_logic_vector(3 downto 0);
      led : out std_logic_vector(3 downto 0)
  );
end alu_tester;

architecture Behavioral of alu_tester is
    component debouncer is
        port(
          btn  : in std_logic;
          clk  : in std_logic;
          dbnc : out std_logic := '0'
        );
    end component;
    
    component my_alu is
      Port ( 
        clk, ld_a, ld_b, ld_o, rst : in std_logic;
        ld_val                     : in std_logic_vector (3 downto 0);
        Y                          : out std_logic_vector (3 downto 0)
      );
    end component;
    
    signal dbnc1  : std_logic;
    signal dbnc2  : std_logic;
    signal dbnc3  : std_logic;
    signal dbnc0  : std_logic;
    
begin

        U1: debouncer 
        port map (
            btn  => btn(0),
            clk  => clk,
            dbnc => dbnc0
        );
        U2: debouncer 
        port map (
            btn  => btn(1),
            clk  => clk,
            dbnc => dbnc1
        );
        U3: debouncer 
        port map (
            btn  => btn(2),
            clk  => clk,
            dbnc => dbnc2
        );
        U4: debouncer 
        port map (
            btn  => btn(3),
            clk  => clk,
            dbnc => dbnc3
        );
        
        U5: my_alu
        port map(
        clk    => clk,
        ld_a   => dbnc1,
        ld_b   => dbnc0,
        ld_o   => dbnc2,
        rst    => dbnc3,
        ld_val => sw,
        Y      => led
        
        
        );
        

end Behavioral;
