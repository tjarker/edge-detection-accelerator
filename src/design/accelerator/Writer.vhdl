library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;


entity Writer is
    port(
        clock: in std_logic;
        reset: in std_logic;

        pixel_left: in byte_t;
        pixel_right: in byte_t;
        valid: in std_logic;
    
        done: out std_logic;

        request: out bit_t;
        granted: in bit_t;
        address   : out halfword_t;
        write_data : out word_t
    );
end entity;

architecture Behavioral of Writer is



begin




end architecture;