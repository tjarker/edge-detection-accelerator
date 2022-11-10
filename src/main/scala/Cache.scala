

import Helpers.{IteratorExtension, Seq2dHWExtension, SeqExtension, SeqHWExtension, UIntExtension}
import chisel3._
import chisel3.util.{MuxCase, MuxLookup, UIntToOH}

class Cache extends Module {

  val write = IO(Input(new Bundle {
    val x = UInt(9.W)
    val y = UInt(2.W)
    val data = UInt(32.W)
    val enable = Bool()
  }))
  val in = IO(Input(new Bundle {
    val x = UInt(9.W)
    val y = UInt(9.W)
    val valid = Bool()
  }))
  val out = IO(Output(new Bundle {
    val window = Vec(4, Vec(3, UInt(8.W)))
    val valid = Bool()
  }))

  val mem = Seq.fill(2)(SyncReadMem(44, Vec(4, UInt(32.W))))

  when(write.enable) {
    val bank = write.x(2)
    val line = write.y(1,0)
    val offset = write.x(8,3)
    when(bank) {
      mem(1).write(
        offset,
        VecInit(Seq.fill(4)(write.data)),
        UIntToOH(line).asBools
      )
    } otherwise {
      mem(0).write(
        offset,
        VecInit(Seq.fill(4)(write.data)),
        UIntToOH(line).asBools
      )
    }

  }

  val evenBankIsToTheRight = in.x(2) && (in.x(1) || in.x(0)) // equal to x > 4
  val oddBankIsToTheLeft = in.x(2,0) === 0.U
  val memOut = WireDefault(VecInit(
    mem(0).read(Mux(evenBankIsToTheRight, in.x(8,3) + 1.U, in.x(8,3))) ++ mem(1).read(Mux(oddBankIsToTheLeft, in.x(8,3)-1.U, in.x(8,3)))
    ))

  val shuffleGroups = createShuffleGroups(memOut)
  val shuffledLines = shuffleLines(shuffleGroups, RegNext(in.y(1), 0.B))
  val shuffledLinesBytes = splitWords(shuffledLines)

  val xReg = RegNext(in.x(2,0), 0.U)
  val columnSelects = Seq(xReg - 1.U, xReg, xReg + 1.U)
  val columnSelected = selectColumns(shuffledLinesBytes, columnSelects.map(_(1,0)))

  val window = selectBanks(columnSelected, columnSelects.map(_(2))).to2dVec

  val topEdge = in.y === 0.U
  val bottomEdge = in.y === 287.U
  val leftEdge = in.x === 0.U
  val rightEdge = in.x === 351.U

  val mirror = Seq(
    Seq(
      Seq((topEdge && leftEdge) -> (1, 1), topEdge -> (1, 0), leftEdge -> (0, 1)),
      Seq(topEdge -> (1, 1)),
      Seq((topEdge && rightEdge) -> (1, 1), topEdge -> (1, 2), rightEdge -> (0, 1))
    ),
    Seq(
      Seq(leftEdge -> (1, 1)),
      Seq(),
      Seq(rightEdge -> (1, 1))
    ),
    Seq(
      Seq(leftEdge -> (2, 1)),
      Seq(),
      Seq(rightEdge -> (2, 1))
    ),
    Seq(
      Seq((bottomEdge && leftEdge) -> (2, 1), bottomEdge -> (2, 0), leftEdge -> (3, 1)),
      Seq(bottomEdge -> (2, 1)),
      Seq((bottomEdge && rightEdge) -> (2, 1), bottomEdge -> (2, 2), rightEdge -> (3, 1))
    )
  )

  out.window := applyMirroring(window, mirror).to2dVec
  out.valid := RegNext(in.valid, 0.B)



  def createShuffleGroups(words: Vec[UInt]): Seq[Seq[Seq[UInt]]] = {
    words
    .grouped(4)
    .map { block =>
      Seq(Seq(block(3),block(0)),Seq(block(1),block(2)))
    }
    .toSeq
  }

  def shuffleLines(shuffleGroups: Seq[Seq[Seq[UInt]]], lineOffset: Bool): Seq[Seq[UInt]] = {
    shuffleGroups
      .map { group =>
        val bundles = Seq.tabulate(2) { i =>
          group
            .rotate(i)
            .to2dVec
            .apply(lineOffset)
        }
        bundles(0) ++ bundles(1)
      }
  }

  def splitWords(blocks: Seq[Seq[UInt]]): Seq[Seq[Seq[UInt]]] = blocks.map(_.map(_.getBytes))

  def selectColumns(blocks: Seq[Seq[Seq[UInt]]], columnSelects: Seq[UInt]): Seq[Seq[Seq[UInt]]] = {
    columnSelects.map { columnSelect =>
      blocks.map { block =>
        block
          .transpose
          .to2dVec
          .apply(columnSelect)
      }
    }
  }

  def selectBanks(blocks: Seq[Seq[Seq[UInt]]], bankSelects: Seq[Bool]): Seq[Seq[UInt]] = {
    bankSelects.zip(blocks).map { case (bankSelect, block) =>
      block.to2dVec.apply(bankSelect)
    }.transpose
  }

  def applyMirroring(window: Seq[Seq[UInt]], mirror: Seq[Seq[Seq[(Bool,(Int,Int))]]]): Seq[Seq[UInt]] = {
    (window,mirror).zipped.map { case (row, rowMirror) =>
      (row,rowMirror).zipped.map { case (pixel, patterns) =>
        MuxCase(pixel, patterns.map { case (condition, (i,j)) =>
            condition -> window(i)(j)
          })
      }
    }
  }

}


object Cache extends App {
  emitVerilog(new Cache, args)
}