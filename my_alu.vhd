----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 02/28/2024 04:43:42 PM
-- Design Name: 
-- Module Name: my_alu - Behavioral
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

entity my_alu is
  Port ( 
    opcode, A, B : in std_logic_vector (3 downto 0);
    Y            : out std_logic_vector (3 downto 0)
  );
end my_alu;

architecture Behavioral of my_alu is

begin

case opcode is
when "0000" => 
    Y <= logic((unsigned A) + (unsigned B)(3 downto 0));
when "0001" =>
    Y <= logic((unsigned A) - (unsigned B)(3 downto 0));
when "0010" =>
    Y <= logic((unsigned A) + (unsigned "0001")(3 downto 0));
when "0011" =>
    Y <= logic((unsigned A) - (unsigned "0001")(3 downto 0));
when "0100" =>
    Y <= logic((unsigned "10000") - (unsigned A)(3 downto 0));
when "0101" =>
    Y <= "000" && A > B;
when "0110" =>

when "0111" =>

when "1000" =>

when "1001" =>

when "1010" =>

when "1011" =>

when "1100" =>

when "1101" =>

when "1110" =>

when "1111" =>

end case;

end Behavioral;
