
import 'package:chess/models/models.dart';
import 'package:collection/collection.dart';
import 'failure.dart';

void testBoardSelfCheck() {
  validTest(() {
    const Board(
      pieces: [
        King(square: Square(x: 5, y: 1), color: PieceColor.white),
        King(square: Square(x: 4, y: 8), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
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
      dimentions: BoardDimentions(width: 8, height: 8),
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
      dimentions: BoardDimentions(width: 8, height: 8),
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
      dimentions: BoardDimentions(width: 8, height: 8),
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
      dimentions: BoardDimentions(width: 8, height: 8),
    )
    .checkIfBoardIsValid();
  },
    name: 'testBoardInstancing-5',
  );
}


void testBoardGenericMethods() {
  // getSquareContent
  validTest(() {
    const board = Board(
      pieces: [
        King(square: Square(x: 5, y: 1), color: PieceColor.white),
        King(square: Square(x: 5, y: 8), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      board.getSquareContent(const Square(x: 5, y: 1)) != null,
      'Did not get piece at correct square',
    );
    assert(
      board.getSquareContent(const Square(x: 1, y: 1)) == null,
      'Got phantom piece',
    );
  });
  // getKingOfColor
  validTest(() {
    const board = Board(
      pieces: [
        King(square: Square(x: 5, y: 1), color: PieceColor.white),
        King(square: Square(x: 5, y: 8), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      board.getKingOfColor(PieceColor.white).color == PieceColor.white,
      'Wrong color king',
    );
    assert(
      board.getKingOfColor(PieceColor.black).color == PieceColor.black,
      'Wrong color king',
    );
  });
  // getPiecesOfColor
  validTest(() {
    const whitePieces = [
      Rook(square: Square(x: 1, y: 1), color: PieceColor.white),
      Knight(square: Square(x: 2, y: 1), color: PieceColor.white),
      Bishop(square: Square(x: 3, y: 1), color: PieceColor.white),
      Queen(square: Square(x: 4, y: 1), color: PieceColor.white),
      King(square: Square(x: 5, y: 1), color: PieceColor.white),
      Bishop(square: Square(x: 6, y: 1), color: PieceColor.white),
      Knight(square: Square(x: 7, y: 1), color: PieceColor.white),
      Rook(square: Square(x: 8, y: 1), color: PieceColor.white),
      Pawn(square: Square(x: 1, y: 2), color: PieceColor.white),
      Pawn(square: Square(x: 2, y: 2), color: PieceColor.white),
      Pawn(square: Square(x: 3, y: 2), color: PieceColor.white),
      Pawn(square: Square(x: 4, y: 2), color: PieceColor.white),
      Pawn(square: Square(x: 5, y: 2), color: PieceColor.white),
      Pawn(square: Square(x: 6, y: 2), color: PieceColor.white),
      Pawn(square: Square(x: 7, y: 2), color: PieceColor.white),
      Pawn(square: Square(x: 8, y: 2), color: PieceColor.white),
    ];
    const blackPieces = [
      Rook(square: Square(x: 1, y: 8), color: PieceColor.black),
      Knight(square: Square(x: 2, y: 8), color: PieceColor.black),
      Bishop(square: Square(x: 3, y: 8), color: PieceColor.black),
      Queen(square: Square(x: 4, y: 8), color: PieceColor.black),
      King(square: Square(x: 5, y: 8), color: PieceColor.black),
      Bishop(square: Square(x: 6, y: 8), color: PieceColor.black),
      Knight(square: Square(x: 7, y: 8), color: PieceColor.black),
      Rook(square: Square(x: 8, y: 8), color: PieceColor.black),
      Pawn(square: Square(x: 1, y: 7), color: PieceColor.black),
      Pawn(square: Square(x: 2, y: 7), color: PieceColor.black),
      Pawn(square: Square(x: 3, y: 7), color: PieceColor.black),
      Pawn(square: Square(x: 4, y: 7), color: PieceColor.black),
      Pawn(square: Square(x: 5, y: 7), color: PieceColor.black),
      Pawn(square: Square(x: 6, y: 7), color: PieceColor.black),
      Pawn(square: Square(x: 7, y: 7), color: PieceColor.black),
      Pawn(square: Square(x: 8, y: 7), color: PieceColor.black),
    ];
    const board = Board(
      pieces: [
        ...whitePieces,
        ...blackPieces,
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      const ListEquality<Piece>().equals(
        board.getPiecesOfColor(PieceColor.white).toList(),
        whitePieces,
      ),
      'getPiecesOfColor(white) did not brought expected pieces',
    );
    assert(
      const ListEquality<Piece>().equals(
        board.getPiecesOfColor(PieceColor.black).toList(),
        blackPieces,
      ),
      'getPiecesOfColor(black) did not brought expected pieces',
    );
  });
}


void testBoardStateCalculations() {
  // isChecked
  validTest(() {
    const whitePieces = [
      King(square: Square(x: 5, y: 1), color: PieceColor.white),
    ];
    const blackPieces = [
      King(square: Square(x: 5, y: 8), color: PieceColor.black),
      Rook(square: Square(x: 1, y: 1), color: PieceColor.black),
    ];
    const board = Board(
      pieces: [
        ...whitePieces,
        ...blackPieces,
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      board.isChecked(PieceColor.white) == true,
      'White king check not detected',
    );
    assert(
      board.isChecked(PieceColor.black) == false,
      'Black king check detected when not checked',
    );
  });
  // CheckMate
  validTest(() {
    const whitePieces = [
      King(square: Square(x: 5, y: 1), color: PieceColor.white),
    ];
    const blackPieces = [
      King(square: Square(x: 5, y: 3), color: PieceColor.black),
      Queen(square: Square(x: 5, y: 2), color: PieceColor.black),
    ];
    const board = Board(
      pieces: [
        ...whitePieces,
        ...blackPieces,
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      board.isCheckmated(PieceColor.white) == true,
      'White king checkmate not detected',
    );
    assert(
      board.isChecked(PieceColor.black) == false,
      'Black king checkmate detected when not checked',
    );
  });
  // Tie
  validTest(() {
    const whitePieces = [
      King(square: Square(x: 1, y: 1), color: PieceColor.white),
    ];
    const blackPieces = [
      King(square: Square(x: 5, y: 8), color: PieceColor.black),
      Queen(square: Square(x: 3, y: 2), color: PieceColor.black),
    ];
    const board = Board(
      pieces: [
        ...whitePieces,
        ...blackPieces,
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      board.isCheckmated(PieceColor.white) == true,
      'White king tied not detected',
    );
    assert(
      board.isChecked(PieceColor.black) == false,
      'Black king tied detected when not tied',
    );
  });
  // Ties with insufficient material
  validTest(() {
    const whitePieces = [
      King(square: Square(x: 5, y: 1), color: PieceColor.white),
    ];
    const blackPieces = [
      King(square: Square(x: 5, y: 8), color: PieceColor.black),
    ];
    const board = Board(
      pieces: [
        ...whitePieces,
        ...blackPieces,
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      board.isTie(PieceColor.white) == true,
      'Insufficient material tie not detected',
    );
    assert(
      board.isTie(PieceColor.black) == true,
      'Insufficient material tie not detected',
    );
  });
  validTest(() {
    const whitePieces = [
      King(square: Square(x: 5, y: 1), color: PieceColor.white),
      Bishop(square: Square(x: 4, y: 1), color: PieceColor.white),
    ];
    const blackPieces = [
      King(square: Square(x: 5, y: 8), color: PieceColor.black),
      Bishop(square: Square(x: 4, y: 8), color: PieceColor.white),
    ];
    const board = Board(
      pieces: [
        ...whitePieces,
        ...blackPieces,
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );
    assert(
      board.isTie(PieceColor.white) == true,
      'Insufficient material tie not detected',
    );
    assert(
      board.isTie(PieceColor.black) == true,
      'Insufficient material tie not detected',
    );
  });
}


void testBoard() {
  testBoardSelfCheck();
  testBoardGenericMethods();
  testBoardStateCalculations();
}


void main() {
  testBoard();
}
