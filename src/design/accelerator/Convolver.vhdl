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



begin

    -- dummy connection
    pixel <= not neighborhood(1,1);


end architecture;