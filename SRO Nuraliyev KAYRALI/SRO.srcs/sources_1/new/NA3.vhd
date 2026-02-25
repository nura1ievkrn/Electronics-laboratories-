----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2026 03:15:37
-- Design Name: 
-- Module Name: NA3 - Behavioral
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

entity na3 is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           C : in STD_LOGIC;
           Y : out STD_LOGIC);
end NA3;

architecture structural of na3 is
    signal and1_out : STD_LOGIC;
   signal and2_out : STD_LOGIC;

   component and_gate
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
    -- A AND B
    U_AND1 : and_gate
        port map (
            A => A,
            B => B,
            Y => and1_out
        );

    -- (A AND B) AND C
    U_AND2 : and_gate
        port map (
            A => and1_out,
            B => C,
            Y => and2_out
        );

    -- Èíâåğñèÿ
    U_NOT : not_gate
        port map (
            A => and2_out,
            Y => Y
        );

end structural;
