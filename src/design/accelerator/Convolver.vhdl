library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;

entity Convolver is
    port(
        neighborhood: in neighborhood_t;
        pixel: out byte_t
    );
end entity;

architecture Behavioral of Convolver is

signal DXa: signed(7 downto 0);
signal DXb: signed(7 downto 0);
signal DXc: signed(7 downto 0);
signal DXaext: signed(9 downto 0);
signal DXbext: signed(9 downto 0);
signal DXcext: signed(9 downto 0);
signal DYa: signed(7 downto 0);
signal DYb: signed(7 downto 0);
signal DYc: signed(7 downto 0);
signal DYaext: signed(9 downto 0);
signal DYbext: signed(9 downto 0);
signal DYcext: signed(9 downto 0);
signal DX: signed(9 downto 0);
signal DY: signed(9 downto 0);
signal DXext: signed(10 downto 0);
signal DYext: signed(10 downto 0);
signal DXinv: signed(9 downto 0);
signal DYinv: signed(9 downto 0);
signal Dxabs: signed(9 downto 0);
signal Dyabs: signed(9 downto 0);
signal Dnabs: signed(10 downto 0);
begin

    -- dummy connection
    DXa <= signed(neighborhood(0,2)) - signed(neighborhood(0,0)); 
    DXb <= signed(neighborhood(1,2)) - signed(neighborhood(1,0));
    DXc <= signed(neighborhood(2,2)) - signed(neighborhood(2,0));
    
    
    DYa <= signed(neighborhood(0,0)) - signed(neighborhood(2,0)); 
    DYb <= signed(neighborhood(0,1)) - signed(neighborhood(2,1));
    DYc <= signed(neighborhood(0,2)) - signed(neighborhood(2,2));
    
    Dxaext <= Dxa(7) & Dxa(7) & Dxa(7 downto 0);
    Dxbext <= Dxb(7) & Dxb(7) & Dxb(7 downto 0);
    Dxcext <= Dxc(7) & Dxc(7) & Dxc(7 downto 0);
    
    DYaext <= DYa(7) & DYa(7) & DYa(7 downto 0);
    DYbext <= DYb(7) & DYb(7) & DYb(7 downto 0);
    DYcext <= DYc(7) & DYc(7) & DYc(7 downto 0);
    
    DX <= DXaext + (DXbext sll 1) + DXcext;
    DY <= DYaext + (DYbext sll 1) + DYcext;
    
    DXinv <= not(DX) + "0000000001";
    DYinv <= not(DY) + "0000000001";

    with DX(9) select
         Dxabs <= DXinv when '1',
                  Dx when others;
    with DY(9) select
         Dyabs <= DYinv when '1',
                  DY when others;

     Dxext <= Dxabs(9) & Dxabs(9 downto 0);
     DYext <= DYabs(9) & DYabs(9 downto 0);
     Dnabs <= DXext + DYext;
    pixel <= std_logic_vector(Dnabs(9 downto 2));
    
end architecture;