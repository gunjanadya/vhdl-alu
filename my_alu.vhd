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
use IEEE.NUMERIC_STD.ALL;
use IEEE.std_logic_unsigned.all;


entity my_alu is
  Port ( 
    clk          : in std_logic;
    opcode, A, B : in std_logic_vector (3 downto 0);
    Y            : out std_logic_vector (3 downto 0)
  );
end my_alu;

architecture Behavioral of my_alu is

begin

process (clk)
begin
    if rising_edge(clk) then
        case opcode is
            when "0000" => Y <= std_logic_vector(unsigned (A) + unsigned (B));
            when "0001" => Y <= std_logic_vector(unsigned (A) - unsigned (B));
            when "0010" => Y <= std_logic_vector(unsigned (A) + "0001");
            when "0011" => Y <= std_logic_vector(unsigned (A) - "0001");
            when "0100" => Y <= std_logic_vector("10000" - unsigned (A));
            when "0101" =>
                if A > B then
                    Y <= "0001";
                else
                    Y <= "0000";
                end if;
            when "0110" => Y <= A(2 downto 0) & '0';
            when "0111" => Y <= '1' & A(3 downto 1);
            when "1000" => Y <= std_logic_vector (shift_right(unsigned(A), 1));
            when "1001" => Y <= NOT A;
            when "1010" => Y <= A AND B;
            when "1011" => Y <= A OR B;
            when "1100" => Y <= A XOR B;
            when "1101" => Y <= A XNOR B;
            when "1110" => Y <= A NAND B;
            when "1111" => Y <= A NOR B;
            when others => Y <= "0000";
        end case;
    end if;
end process;

end Behavioral;
