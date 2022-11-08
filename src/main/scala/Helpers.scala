import chisel3.{Data, UInt, Vec, VecInit}

object Helpers {
  implicit class SeqHWExtension[T <: Data](x: Seq[T]) {
    def toVec: Vec[T] = VecInit(x)
  }
  implicit class Seq2dHWExtension[T <: Data](x: Seq[Seq[T]]) {
    def to2dVec: Vec[Vec[T]] = VecInit(x.map(VecInit(_)))
  }
  implicit class SeqExtension[T](x: Seq[T]) {
    def rotate(i: Int): Seq[T] = if (i == 0) x else (x.tail :+ x.head).rotate(i - 1)
  }


  implicit class IteratorExtension[T <: Data](x: Iterator[T]) {
    def toVec: Vec[T] = x.toSeq.toVec
  }
  implicit class UIntExtension(x: UInt) {
    def getBytes: Vec[UInt] = x.asBools.grouped(8).map(bits => VecInit(bits).asUInt).toSeq.toVec
  }




}