
import 'package:chess/models/models.dart';
import 'failure.dart';

void testBoardInstancing() {
  validTest(() {
    const Board(
      pieces: [
        King(square: Square(x: 5, y: 1), color: PieceColor.white),
        King(square: Square(x: 4, y: 8), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, length: 8),
    )
    .checkIfBoardIsValid();
  },
    msg: 'testBoardInstancing-1 Valid test case threw error',
  );

  invalidTest<AssertionError>(() {
    const Board(
      pieces: [
        King(square: Square(x: 5, y: 1), color: PieceColor.white),
      ],
      dimentions: BoardDimentions(width: 8, length: 8),
    )
    .checkIfBoardIsValid();
  },
    msg: 'testBoardInstancing-2 Invalid test case did not threw expected error',
  );

  invalidTest<AssertionError>(() {
    const Board(
      pieces: [
        King(square: Square(x: 4, y: 8), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, length: 8),
    )
    .checkIfBoardIsValid();
  },
    msg: 'testBoardInstancing-3 Invalid test case did not threw expected error',
  );

  invalidTest<AssertionError>(() {
    const Board(
      pieces: [
        King(square: Square(x: 5, y: 1), color: PieceColor.white),
        King(square: Square(x: 4, y: 8), color: PieceColor.black),
        Pawn(square: Square(x: 2, y: 9), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, length: 8),
    )
    .checkIfBoardIsValid();
  },
    msg: 'testBoardInstancing-4 Invalid test case did not threw expected error',
  );

  invalidTest<AssertionError>(() {
    const Board(
      pieces: [
        King(square: Square(x: 5, y: 1), color: PieceColor.white),
        King(square: Square(x: 4, y: 8), color: PieceColor.black),
        Pawn(square: Square(x: 0, y: 4), color: PieceColor.white),
      ],
      dimentions: BoardDimentions(width: 8, length: 8),
    )
    .checkIfBoardIsValid();
  },
    msg: 'testBoardInstancing-5 Invalid test case did not threw expected error',
  );
}


void testBoard() {
  testBoardInstancing();
}


void main() {
  testBoard();
}
