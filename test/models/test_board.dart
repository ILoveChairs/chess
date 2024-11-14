
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
    name: 'testBoardInstancing-1',
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
    name: 'testBoardInstancing-2',
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
    name: 'testBoardInstancing-3',
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
    name: 'testBoardInstancing-4',
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
    name: 'testBoardInstancing-5',
  );
}


void testBoard() {
  testBoardInstancing();
}


void main() {
  testBoard();
}
