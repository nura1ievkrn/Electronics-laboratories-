----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2026 03:37:56
-- Design Name: 
-- Module Name: nmx2 - Behavioral
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

entity nmx2 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           V : in STD_LOGIC;
           Y : out STD_LOGIC);
end nmx2;

architecture structural of nmx2 is
signal nV      : STD_LOGIC;
signal and1_out : STD_LOGIC;
signal and2_out : STD_LOGIC;

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

begin
    -- NOT V
    U_NOT : not_gate
        port map (
            A => V,
            Y => nV
        );

    -- A AND (NOT V)
    U_AND1 : and_gate
        port map (
            A => A,
            B => nV,
            Y => and1_out
        );

    -- B AND V
    U_AND2 : and_gate
        port map (
            A => B,
            B => V,
            Y => and2_out
        );

    -- OR
    U_OR : or_gate
        port map (
            A => and1_out,
            B => and2_out,
            Y => Y
        );


end structural;
