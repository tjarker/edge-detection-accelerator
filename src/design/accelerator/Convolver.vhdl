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
signal DYa: signed(7 downto 0);
signal DYb: signed(7 downto 0);
signal DYc: signed(7 downto 0);
signal DX: signed(7 downto 0);
signal DY: signed(7 downto 0);

begin

    -- dummy connection
    DXa <= signed(neighborhood(0,2)) - signed(neighborhood(0,0)); 
    DXb <= signed(neighborhood(1,2)) - signed(neighborhood(1,0));
    DXc <= signed(neighborhood(2,2)) - signed(neighborhood(2,0));
    
    DYa <= signed(neighborhood(0,0)) - signed(neighborhood(2,0)); 
    DYb <= signed(neighborhood(0,1)) - signed(neighborhood(2,1));
    DYc <= signed(neighborhood(0,2)) - signed(neighborhood(2,2));
    
    DX <= DXa + (DXb sll 2) + DXc;
    DY <= DYa + (DYb sll 2) + DYc;
    pixel <= std_logic_vector(abs(DX) + abs(DY));


end architecture;