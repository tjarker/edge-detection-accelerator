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

signal DXa: signed(9 downto 0);
signal DXb: signed(9 downto 0);
signal DXc: signed(9 downto 0);
signal DXaext: signed(10 downto 0);
signal DXbext: signed(10 downto 0);
signal DXcext: signed(10 downto 0);
signal DYa: signed(9 downto 0);
signal DYb: signed(9 downto 0);
signal DYc: signed(9 downto 0);
signal DYaext: signed(10 downto 0);
signal DYbext: signed(10 downto 0);
signal DYcext: signed(10 downto 0);
signal DX: signed(10 downto 0);
signal DY: signed(10 downto 0);
signal DXext: signed(11 downto 0);
signal DYext: signed(11 downto 0);
signal DXinv: signed(10 downto 0);
signal DYinv: signed(10 downto 0);
signal Dxabs: signed(10 downto 0);
signal Dyabs: signed(10 downto 0);
signal Dnabs: signed(11 downto 0);
begin

    -- dummy connection
    DXa <= signed("00" & neighborhood(0,2)) - signed("00" & neighborhood(0,0)); 
    DXb <= signed("00" & neighborhood(1,2)) - signed("00" & neighborhood(1,0));
    DXc <= signed("00" & neighborhood(2,2)) - signed("00" & neighborhood(2,0));
    
    
    DYa <= signed("00" & neighborhood(0,0)) - signed("00" & neighborhood(2,0)); 
    DYb <= signed("00" & neighborhood(0,1)) - signed("00" & neighborhood(2,1));
    DYc <= signed("00" & neighborhood(0,2)) - signed("00" & neighborhood(2,2));
    
    Dxaext <= Dxa(9) & Dxa(9 downto 0);
    Dxbext <= Dxb(9) & Dxb(9 downto 0);
    Dxcext <= Dxc(9) & Dxc(9 downto 0);
    
    DYaext <= DYa(9) & DYa(9 downto 0);
    DYbext <= DYb(9) & DYb(9 downto 0);
    DYcext <= DYc(9) & DYc(9 downto 0);
    
    DX <= DXaext + (DXbext(9 downto 0) & '0') + DXcext;
    DY <= DYaext + (DYbext(9 downto 0) & '0') + DYcext;
    
    DXinv <= not(DX) + "0000000001";
    DYinv <= not(DY) + "0000000001";

    with DX(10) select
         Dxabs <= DXinv when '1',
                  Dx when others;
    with DY(10) select
         Dyabs <= DYinv when '1',
                  DY when others;

     Dxext <= Dxabs(10) & Dxabs(10 downto 0);
     DYext <= DYabs(10) & DYabs(10 downto 0);
     Dnabs <= DXext + DYext;
    pixel <= std_logic_vector(Dnabs(10 downto 3));
    
end architecture;