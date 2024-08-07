----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 12:54:46 PM
-- Design Name: 
-- Module Name: adder - Behavioral
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

entity adder is
 Port ( 
    A, B, Cin : in std_logic;
    S, Cout   : out std_logic
 );
end adder;

architecture Behavioral of adder is

--signal AXORB : std_logic;
--signal AANDB : std_logic;

begin

--AXORB <= A XOR B;
--AANDB <= A AND B;

S <= (A XOR B) XOR Cin;
Cout <= ((A XOR B) AND Cin) OR (A AND B);

end Behavioral;
