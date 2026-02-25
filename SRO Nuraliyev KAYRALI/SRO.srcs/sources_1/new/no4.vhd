----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2026 03:34:09
-- Design Name: 
-- Module Name: no4 - Behavioral
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

entity no4 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           D : in STD_LOGIC;
           Y : out STD_LOGIC);
end no4;

architecture structural of no4 is
    signal or1_out : STD_LOGIC;
   signal or2_out : STD_LOGIC;
   signal or3_out : STD_LOGIC;

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
    -- A OR B
    U_OR1 : or_gate
        port map (
            A => A,
            B => B,
            Y => or1_out
        );

    -- C OR D
    U_OR2 : or_gate
        port map (
            A => C,
            B => D,
            Y => or2_out
        );

    -- (A OR B) OR (C OR D)
    U_OR3 : or_gate
        port map (
            A => or1_out,
            B => or2_out,
            Y => or3_out
        );

    -- Èíâåğñèÿ
    U_NOT : not_gate
        port map (
            A => or3_out,
            Y => Y
        );

end structural;
