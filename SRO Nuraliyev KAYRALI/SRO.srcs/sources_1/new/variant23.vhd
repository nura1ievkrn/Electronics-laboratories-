library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity variant_23 is
    Port ( 
        x1, x2, x3, x4 : in  STD_LOGIC;
        y1, y2, y3, y4 : out STD_LOGIC
    );
end variant_23;

architecture Structural of variant_23 is

    -- Сигналы для промежуточных соединений
    signal s_not1, s_not2, s_not3 : std_logic;
    signal s_o2, s_nao22, s_no3, s_no4 : std_logic;
    signal s_na3, s_no3a2, s_nmx2, s_noao2 : std_logic;

    -- Объявление компонентов (структурные блоки проекта)
    component not_gate is port(A : in std_logic; Y : out std_logic); end component;
    component o2 is port(A, B : in std_logic; Y : out std_logic); end component;
    component nao22 is port(A, B, C, D : in std_logic; Y : out std_logic); end component;
    component no3 is port(A, B, C : in std_logic; Y : out std_logic); end component;
    component no4 is port(A, B, C, D : in std_logic; Y : out std_logic); end component;
    component na3 is port(A, B, C : in std_logic; Y : out std_logic); end component;
    component no3a2 is port(A, B, C, D : in std_logic; Y : out std_logic); end component;
    component nmx2 is port(A, B, V : in std_logic; Y : out std_logic); end component;
    component noao2 is port(A, B, C, D : in std_logic; Y : out std_logic); end component;

begin

    -- Инверторы (нот1 от х2, нот2 от х3)
    U_NOT1: not_gate port map (A => x2, Y => s_not1);
    U_NOT2: not_gate port map (A => x3, Y => s_not2);

    -- О2 от А: х4, В: х2
    U_O2: o2 port map (A => x4, B => x2, Y => s_o2);

    -- NA3 от А: х2, В: х4, С: х1
    U_NA3: na3 port map (A => x2, B => x4, C => x1, Y => s_na3);

    -- NO3 от А: х1, В: нот2, С: х4
    U_NO3: no3 port map (A => x1, B => s_not2, C => x4, Y => s_no3);


    -- NMX2 от А: О2, В: нот1, V: х3
    U_NMX2: nmx2 port map (A => s_o2, B => s_not1, V => x3, Y => s_nmx2);

    -- NOAO2 от А: х3, В: NA3, С: х1, Д: О2
    U_NOAO2: noao2 port map (A => x3, B => s_na3, C => x1, D => s_o2, Y => s_noao2);

    -- Блоки с обратными связями
    -- NAO22 от А: х3, В: х1, С: нот1, Д: NOAO2
    U_NAO22: nao22 port map (A => x3, B => x1, C => s_not1, D => s_noao2, Y => s_nao22);

    -- NO4 от А: х4, В: х2, С: nmx2, Д: NOAO2
    U_NO4: no4 port map (A => x4, B => x2, C => s_nmx2, D => s_noao2, Y => s_no4);


    -- NO3A2 от А: NO3, В: NO4, С: х4, Д: NAO22
    U_NO3A2: no3a2 port map (A => s_no3, B => s_no4, C => x4, D => s_nao22, Y => s_no3a2);

    -- Третий инвертор от NO3A2
    U_NOT3: not_gate port map (A => s_no3a2, Y => s_not3);


    y1 <= x2;         -- y1: х2
    y2 <= s_not3;     -- y2: от нот3
    y3 <= s_noao2;    -- y3: от NOAO2
    y4 <= s_nmx2;     -- y4: от NMX2

end Structural;