
simulate:
	ghdl -a --std=08 -fsynopsys src/design/types.vhd src/design/accelerator/acc.vhd src/design/util/clock.vhd src/design/memory/memory2.vhd src/test/test2.vhd
	ghdl -e --std=08 -fsynopsys testbench
	ghdl -r --std=08 -fsynopsys testbench

clean:
	rm *.o testbench *.cf src/images/*_result.pgm

cache: src/design/accelerator/Cache.v

src/design/accelerator/Cache.v: src/main/scala/Cache.scala
	sbt 'runMain Cache --target-dir src/design/accelerator'
	rm src/design/accelerator/*.anno.json src/design/accelerator/*.fir