----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 19.02.2026 07:48:06
-- Design Name: 
-- Module Name: nao22 - Behavioral
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
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity nao22 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Y : out STD_LOGIC);
end nao22;

architecture Behavioral of nao22 is
component and_gate
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end component;

component or_gate
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end component;

component not_gate
    Port (
        A : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end component;

    signal and1_out : STD_LOGIC;
    signal and2_out : STD_LOGIC;
    signal or_out   : STD_LOGIC;
begin
U_AND1 : and_gate
    port map (
        A => A,
        B => B,
        Y => and1_out
    );

U_AND2 : and_gate
    port map (
        A => C,
        B => D,
        Y => and2_out
    );

U_OR : or_gate
    port map (
        A => and1_out,
        B => and2_out,
        Y => or_out
    );

U_NOT : not_gate
    port map (
        A => or_out,
        Y => Y
    );

end Behavioral;
