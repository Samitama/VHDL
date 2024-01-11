----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11.11.2023 21:01:31
-- Design Name: 
-- Module Name: testbench - Behavioral
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

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
    signal sw_in : std_logic_vector(1 downto 0);
    signal led_out : std_logic_vector(4 downto 0);
begin
    uut: entity work.gates(arch)
        port map(
            SW => sw_in,
            LED => led_out
            );
            
     process
     begin
        sw_in(0) <= '0';
        sw_in(1) <= '0';
        wait for 200 ns;
        
        sw_in(0) <= '0';
        sw_in(1) <= '1';
        wait for 200 ns;
        
        sw_in(0) <= '1';
        sw_in(1) <= '0';
        wait for 200 ns;
        
        sw_in(0) <= '1';
        sw_in(1) <= '1';
        wait for 200 ns;
        
        assert false
            report "Simulation Completed"
        severity failure;
        end process; 
end Behavioral;
