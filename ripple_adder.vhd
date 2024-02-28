----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 01:25:38 PM
-- Design Name: 
-- Module Name: ripple_adder - Behavioral
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

entity ripple_adder is
  Port ( 
  A, B : in std_logic_vector(3 downto 0);
  C0   : in std_logic;
  C4   : out std_logic;
  S    : out std_logic_vector(3 downto 0)
  );
end ripple_adder;

architecture Behavioral of ripple_adder is

component adder is 
port(
    A, B, Cin  : in std_logic;
    S, Cout    : out std_logic
);
end component;

signal c1 : std_logic;
signal c2 : std_logic;
signal c3 : std_logic;

begin

U0: adder
    port map (
        A => A(0),
        B => B(0),
        Cin => C0,
        Cout => c1,
        S => S(0)
    );
U1: adder
    port map (
        A => A(1),
        B => B(1),
        Cin => C1,
        Cout => c2,
        S => S(1)
    );
U2: adder
    port map (
        A => A(2),
        B => B(2),
        Cin => C2,
        Cout => c3,
        S => S(2)
    );
U3: adder
    port map (
        A => A(3),
        B => B(3),
        Cin => C3,
        Cout => c4,
        S => S(3)
    );

end Behavioral;
