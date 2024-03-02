----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/01/2024 09:38:54 PM
-- Design Name: 
-- Module Name: my_alu_tb - Behavioral
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
-- arithmetic functions with Signed or Unsigned architecture
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity my_alu_tb is
--  Port ( );
end my_alu_tb;

architecture Behavioral of my_alu_tb is

component my_alu is
  Port ( 
    clk, ld_a, ld_b, ld_o, rst : in std_logic;
    ld_val                     : in std_logic_vector (3 downto 0);
    Y                          : out std_logic_vector (3 downto 0)
  );
end component;

signal clk_tb, ld_a_tb, ld_b_tb, ld_o_tb, rst_tb : std_logic := '0';
signal ld_val_tb, Y_tb, opcode : std_logic_vector(3 downto 0) := "0000";

begin

    clk_gen_proc: process
    begin

        wait for 4 ns;
        clk_tb <= '1';
        
        wait for 4 ns;
        clk_tb <= '0';

    end process clk_gen_proc;
    
    test_proc: process
    begin

        -- initialize A, B vals 
        ld_a_tb <= '1';
        ld_val_tb <= "0101";
        wait for 10 ns;
        ld_a_tb <= '0';
        
        ld_b_tb <= '1';
        ld_val_tb <= "1000";
        wait for 10 ns;
        ld_b_tb <= '0';
        
        -- initialize opcode val
        ld_o_tb <= '1';
        ld_val_tb <= std_logic_vector(unsigned(opcode) + "0001");
        wait for 10 ns;
        ld_o_tb <= '0';
        opcode <= ld_val_tb;
        
        
        
    end process test_proc;
dut: my_alu
port map(
    clk => clk_tb,
    ld_a => ld_a_tb,
    ld_b => ld_b_tb,
    ld_o => ld_o_tb,
    ld_val => ld_val_tb,
    rst => rst_tb,
    Y => Y_tb
);

end Behavioral;
