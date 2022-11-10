library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;


entity CacheWrapper is
    port(
        clock: in std_logic;
        reset: in std_logic;

        write_x: in unsigned(8 downto 0);
        write_y: in unsigned(1 downto 0);
        write_data: in word_t;
        write_enable: in std_logic;

        in_x: in unsigned(8 downto 0);
        in_y: in unsigned(8 downto 0);
        in_valid: in std_logic;

        out_window: out window_t;
        out_valid: out std_logic
    );
end entity;

architecture Behavioral of CacheWrapper is

    component Cache is
        port(
            clock: in std_logic;
            reset: in std_logic;
            write_x: in std_logic_vector(8 downto 0);
            write_y: in std_logic_vector(1 downto 0);
            write_data: in std_logic_vector(31 downto 0);
            write_enable: in std_logic;
            in_x: in std_logic_vector(8 downto 0);
            in_y: in std_logic_vector(8 downto 0);
            in_valid: in std_logic;
            out_window_0_0: out std_logic_vector(7 downto 0);
            out_window_0_1: out std_logic_vector(7 downto 0);
            out_window_0_2: out std_logic_vector(7 downto 0);
            out_window_1_0: out std_logic_vector(7 downto 0);
            out_window_1_1: out std_logic_vector(7 downto 0);
            out_window_1_2: out std_logic_vector(7 downto 0);
            out_window_2_0: out std_logic_vector(7 downto 0);
            out_window_2_1: out std_logic_vector(7 downto 0);
            out_window_2_2: out std_logic_vector(7 downto 0);
            out_window_3_0: out std_logic_vector(7 downto 0);
            out_window_3_1: out std_logic_vector(7 downto 0);
            out_window_3_2: out std_logic_vector(7 downto 0);
            out_valid: out std_logic
        );
    end component;

begin

    c: Cache port map(
        clock => clock,
        reset => reset,

        write_x => std_logic_vector(write_x),
        write_y => std_logic_vector(write_y),
        write_data => write_data,
        write_enable => write_enable,

        in_x => std_logic_vector(in_x),
        in_y => std_logic_vector(in_y),
        in_valid => in_valid,

        out_window_0_0 => out_window(0, 0),
        out_window_0_1 => out_window(0, 1),
        out_window_0_2 => out_window(0, 2),
        out_window_1_0 => out_window(1, 0),
        out_window_1_1 => out_window(1, 1),
        out_window_1_2 => out_window(1, 2),
        out_window_2_0 => out_window(2, 0),
        out_window_2_1 => out_window(2, 1),
        out_window_2_2 => out_window(2, 2),
        out_window_3_0 => out_window(3, 0),
        out_window_3_1 => out_window(3, 1),
        out_window_3_2 => out_window(3, 2),
        out_valid => out_valid
    );


end architecture;