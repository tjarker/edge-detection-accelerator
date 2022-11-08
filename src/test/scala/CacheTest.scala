
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec

class CacheTest extends AnyFlatSpec with ChiselScalatestTester {

  "Memory" should "work" in {
    test(new Cache).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>

      dut.in.x.poke(0.U)
      dut.in.y.poke(0.U)

      (0 until 4).foreach { line =>
        (0 until 352 by 4).foreach { column =>
          dut.write.x.poke(column.U)
          dut.write.y.poke(line.U)
          dut.write.enable.poke(1.B)
          val word = Seq.tabulate(4)(i => (BigInt(((column+i) & 0xFF)) << (8*i)) | (line << (8*i+4))).reduce(_ | _)
          dut.write.data.poke(word.U)
          dut.clock.step()
        }
      }

      (0 until 4).foreach { line =>
        (0 until 352).foreach { column =>
          dut.in.x.poke(column.U)
          dut.in.y.poke(line.U)
          dut.clock.step()
        }
      }

      dut.in.x.poke(5.U)
      dut.in.y.poke(2.U)

      dut.clock.step(100)

      (4 until 8).foreach { line =>
        (0 until 352 by 4).foreach { column =>
          dut.write.x.poke(column.U)
          dut.write.y.poke(line.U)
          dut.write.enable.poke(1.B)
          val word = Seq.tabulate(4)(i => (BigInt(((column + i) & 0xFF)) << (8 * i)) | (line << (8 * i + 4))).reduce(_ | _)
          dut.write.data.poke(word.U)
          dut.clock.step()
        }
      }

    }
  }

}
