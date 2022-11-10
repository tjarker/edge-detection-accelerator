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

        addr   : out halfword_t;        -- Address bus for data.
        dataW  : out word_t;            -- The data bus.
        en     : out bit_t;             -- Request signal for data.
        we     : out bit_t             -- Read/Write signal for data.
    );
end entity;

architecture Behavioral of Writer is



begin




end architecture;