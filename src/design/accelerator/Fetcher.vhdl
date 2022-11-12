library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;


entity Fetcher is
    port(
        clock: in std_logic;
        reset: in std_logic;

        start: in std_logic;
        done: out std_logic;

        stall: out std_logic;

        request: out bit_t;
        address: out halfword_t;
        read_data: in word_t;

        cache_x: out unsigned(8 downto 0);
        cache_y: out unsigned(1 downto 0);
        cache_write: out bit_t;
        cache_data: out word_t
    );
end entity;

architecture Behavioral of Fetcher is



begin




end architecture;