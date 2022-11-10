
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
          val word = Seq.tabulate(4)(i => pixelValue(column + i, line) << (8*i)).reduce(_ | _)
          dut.write.data.poke(word.U)
          dut.clock.step()
        }
      }
      dut.write.enable.poke(0.B)


      (0 until 352).foreach { column =>
        dut.in.x.poke(column.U)
        dut.in.y.poke(0.U)
        dut.clock.step()
        expectWindow(column, 0, dut.out.window)
      }


      (0 until 352).foreach { column =>
        dut.in.x.poke(column.U)
        dut.in.y.poke(2.U)
        dut.clock.step()
        expectWindow(column, 2, dut.out.window)
      }

    }
  }

  def pixelValue(x: Int, y: Int): BigInt = BigInt((x & 0xF) + ((y & 0x3) << 6))
  def getOffsets(x: Int, y: Int): Seq[(Int,Int)] = Seq(
    if (x == 0 && y == 0) (x, y) else if (x == 0) (x, y - 1) else if (y == 0) (x - 1, y) else (x - 1, y - 1),
    if (y == 0) (x, y) else (x, y - 1),
    if (x == 351 && y == 0) (x, y) else if (x == 351) (x, y - 1) else if (y == 0) (x + 1, y) else (x + 1, y - 1),
    if (x == 0) (x, y) else (x - 1, y),
    (x, y),
    if (x == 351) (x, y) else (x + 1, y),
    if (x == 0) (x, y + 1) else (x - 1, y + 1),
    (x, y + 1),
    if (x == 351) (x, y + 1) else (x + 1, y + 1),
    if (x == 0 && y == 287) (x, y + 1) else if (x == 0) (x, y + 2) else if (y == 287) (x - 1, y + 1) else (x - 1, y + 2),
    if (y == 287) (x, y + 1) else (x, y + 2),
    if (x == 351 && y == 287) (x, y + 1) else if (x == 351) (x, y + 2) else if (y == 287) (x + 1, y + 1) else (x + 1, y + 2)
  )
  def expectWindow(x: Int, y: Int, port: Vec[Vec[UInt]]): Unit = {
    val offsets = getOffsets(x,y)
    port.flatten.zip(offsets).foreach { case (pixel, (wx,wy)) =>
      pixel.expect(pixelValue(wx,wy).U, s"at ($x,$y)($wx,$wy) expected ${pixelValue(wx,wy).toString(16)} but got ${pixel.peek.litValue.toString(16)}")
    }
  }

}
