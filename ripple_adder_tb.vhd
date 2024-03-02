----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2024 09:20:54 PM
-- Design Name: 
-- Module Name: ripple_adder_tb - Behavioral
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

entity ripple_adder_tb is
--  Port ( );
end ripple_adder_tb;

architecture Behavioral of ripple_adder_tb is


signal A_tb, B_tb, S_tb : std_logic_vector (3 downto 0);
signal C0_tb, C4_tb     : std_logic;

component ripple_adder is
  Port ( 
  A, B : in std_logic_vector(3 downto 0);
  C0   : in std_logic;
  C4   : out std_logic;
  S    : out std_logic_vector(3 downto 0)
  );
end component;

begin

test_proc : process
begin

A_tb  <= "0011";
B_tb  <= "1001";
C0_tb <= '0';

wait for 100 ns;

A_tb  <= "0111";
B_tb  <= "0001";
C0_tb <= '0';

wait for 100 ns;

A_tb  <= "0101";
B_tb  <= "0101";
C0_tb <= '1';

wait for 100 ns;

end process test_proc;

dut: ripple_adder
    port map(
        A => A_tb,
        B => B_tb,
        C0 => C0_tb,
        C4 => C4_tb,
        S => S_tb
    );

end Behavioral;
