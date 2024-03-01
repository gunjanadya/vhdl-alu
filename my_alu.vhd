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
    clk, ld_a, ld_b, ld_o, rst : in std_logic;
    ld_val  : in std_logic_vector (3 downto 0);
    Y : out std_logic_vector (3 downto 0)
  );
end my_alu;

architecture Behavioral of my_alu is

signal A_val, B_val, op_val : std_logic_vector (3 downto 0);

begin

process (clk)
begin
    if rising_edge(clk) then
        if ld_a = '1' then
            A_val <= ld_val;
        end if;
        if ld_b = '1' then 
            B_val <= ld_val;
        end if;
        if ld_o = '1' then 
            op_val <= ld_val;
        end if;
        if rst = '1' then
            A_val  <= (others => '0');
            B_val  <= (others => '0');
            op_val <= (others => '0');
        end if;
        
        case op_val is
            when "0000" => Y <= std_logic_vector(unsigned (A_val) + unsigned (B_val));
            when "0001" => Y <= std_logic_vector(unsigned (A_val) - unsigned (B_val));
            when "0010" => Y <= std_logic_vector(unsigned (A_val) + "0001");
            when "0011" => Y <= std_logic_vector(unsigned (A_val) - "0001");
            when "0100" => Y <= std_logic_vector("1000" - unsigned (A_val));
            when "0101" =>
                if A_val > B_val then
                    Y <= "0001";
                else
                    Y <= "0000";
                end if;
            when "0110" => Y <= A_val(2 downto 0) & '0';
            when "0111" => Y <= '1' & A_val(3 downto 1);
            when "1000" => Y <= std_logic_vector (shift_right(unsigned(A_val), 1));
            when "1001" => Y <= NOT A_val;
            when "1010" => Y <= A_val AND B_val;
            when "1011" => Y <= A_val OR B_val;
            when "1100" => Y <= A_val XOR B_val;
            when "1101" => Y <= A_val XNOR B_val;
            when "1110" => Y <= A_val NAND B_val;
            when "1111" => Y <= A_val NOR B_val;
            when others => Y <= "0000";
        end case;
        
    end if;
end process;

end Behavioral;
