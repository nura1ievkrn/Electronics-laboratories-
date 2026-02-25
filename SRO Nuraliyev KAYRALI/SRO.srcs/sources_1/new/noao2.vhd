----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.02.2026 03:45:45
-- Design Name: 
-- Module Name: noao2 - Behavioral
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

entity noao2 is
Port (
       A : in  STD_LOGIC;
       B : in  STD_LOGIC;
       C : in  STD_LOGIC;
       D : in  STD_LOGIC;
       Y : out STD_LOGIC
   );
end noao2;

architecture structural of noao2 is
   signal or1_out  : STD_LOGIC;
   signal or2_out  : STD_LOGIC;
   signal and_out  : STD_LOGIC;

   component or_gate
       Port (
           A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Y : out STD_LOGIC
       );
   end component;

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
    -- A OR B
 U_OR1 : or_gate
     port map ( A, B, or1_out );

 -- C OR D
 U_OR2 : or_gate
     port map ( C, D, or2_out );

 -- (A OR B) AND (C OR D)
 U_AND : and_gate
     port map ( or1_out, or2_out, and_out );

 -- Инверсия
 U_NOT : not_gate
     port map ( and_out, Y );

end structural;
