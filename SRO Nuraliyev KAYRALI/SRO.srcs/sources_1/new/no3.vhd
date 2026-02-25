----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2026 03:31:24
-- Design Name: 
-- Module Name: no3 - Behavioral
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

entity no3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Y : out STD_LOGIC);
end no3;

architecture structural of no3 is
    signal or1_out : STD_LOGIC;
   signal or2_out : STD_LOGIC;

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

    -- (A OR B) OR C
    U_OR2 : or_gate
        port map (
            A => or1_out,
            B => C,
            Y => or2_out
        );

    -- Èíâåğñèÿ
    U_NOT : not_gate
        port map (
            A => or2_out,
            Y => Y
        );

end structural;
