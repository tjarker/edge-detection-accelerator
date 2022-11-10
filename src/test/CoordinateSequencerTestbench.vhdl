library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use work.types.all;

entity CoordinateSequencerTestBench is end entity;

architecture Testbench of CoordinateSequencerTestbench is

    component CoordinateSequencer is
        port(
            clock: in std_logic;
            reset: in std_logic;
    
            start: in std_logic;
            stall: in std_logic;
    
            x: out unsigned(8 downto 0);
            y: out unsigned(8 downto 0);
            valid: out std_logic
        );
    end component;


    signal clock, reset, start, stall, valid: std_logic;
    signal x, y: unsigned(8 downto 0);
    
begin
    
    dut: CoordinateSequencer port map(clock, reset, start, stall, x, y, valid);

    process begin
        clock <= '0'; wait for 5 ns;
        clock <= '1'; wait for 5 ns;
    end process;

    process begin
        reset <= '1';
        start <= '0'; stall <= '0';

        wait for 10 ns;

        reset <= '0';
        wait for 30 ns;

        start <= '1'; wait for 10 ns;
        
        start <= '0'; wait for 100 ns;

        stall <= '1';

        for i in 0 to 10 loop
            assert x = 10 severity failure;
            assert y = 0 severity failure;
            wait for 10 ns;
        end loop;

        stall <= '0';


        reset <= '1'; wait for 10 ns; reset <= '0';

        assert valid = '0' severity failure;

        start <= '1'; wait for 10 ns; start <= '0';

        for j in 0 to 287 loop
            for i in 0 to 351 loop
                assert x = i severity failure;
                assert y = j severity failure;
                assert valid = '1' severity failure;
                wait for 10 ns;
            end loop;
        end loop;

        assert valid = '0' severity failure;
        
        wait for 10 ns;
        
        assert x = 0 severity failure;
        assert y = 0 severity failure;

        std.env.stop(0);
    end process;
    
end architecture;