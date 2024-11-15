
import 'package:chess/models/models.dart';
import 'failure.dart';


void testCPUEasy() {
  validTest(() {
    const CpuEasy(
      board: Board(
        pieces: [
          King(square: Square(x: 5, y: 1), color: PieceColor.white),
          King(square: Square(x: 5, y: 8), color: PieceColor.black),
        ],
        dimentions: BoardDimentions(width: 8, height: 8),
      ),
      color: PieceColor.black,
    );
  });
}


void testCPU() {
  testCPUEasy();
}


void main() {
  testCPU();
}
