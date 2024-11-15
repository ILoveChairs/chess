
import 'package:chess/models/models.dart';
import 'failure.dart';


const testBoard = Board(
  pieces: [
    King(square: Square(x: 8, y: 3), color: PieceColor.black),
    King(square: Square(x: 8, y: 5), color: PieceColor.white),
  ],
  dimentions: BoardDimentions(
    width: 8,
    height: 8,
  ),
);


/// Tests the bishop move generation
void bishopTest() {
  // Get all possible squares from b2
  validTest(() {
    const bishop = Bishop(square: Square(x: 2, y: 2), color: PieceColor.white);
    final board = testBoard.copyWith([bishop]);

    final moves = bishop.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 1, y: 1),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 3, y: 3),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 4, y: 4),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 5, y: 5),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 6, y: 6),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 7, y: 7),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 8, y: 8),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 1, y: 3),
      ),
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 3, y: 1),
      ),
    ], 'Bishop failed to generate correct moves',);
  },
    name: 'bishopTest-1',
  );

  // Check if it is blocked by a friendly piece
  validTest(() {
    const bishop = Bishop(
      square: Square(x: 1, y: 1),
      color: PieceColor.white,
    );
    const blockingFriendlyPawn = Pawn(
      square: Square(x: 2, y: 2),
      color: PieceColor.white,
    );
    final board = testBoard.copyWith([bishop, blockingFriendlyPawn]);

    final moves = bishop.calculatePossibleMoves(board);
    assert(moves == <Move>[], 'Friendly piece did not block bishop',);
  },
    name: 'bishopTest-3',
  );

  // Check if it is blocked by an enemy piece and if it is able to capture it
  validTest(() {
    const bishop = Bishop(
      square: Square(x: 1, y: 1),
      color: PieceColor.white,
    );
    const blockingEnemyPawn = Pawn(
      square: Square(x: 2, y: 2),
      color: PieceColor.black,
    );
    final board = testBoard.copyWith([bishop, blockingEnemyPawn]);

    final moves = bishop.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: bishop,
        destinationSquare: Square(x: 2, y: 2),
      ),
    ], 'Enemy piece did not block bishop',);
  },
    name: 'bishopTest-2',
  );
}


void knightTest() {
  // Get all possible squares from b2
  validTest(() {
    const knight = Knight(square: Square(x: 2, y: 2), color: PieceColor.white);
    final board = testBoard.copyWith([knight]);

    final moves = knight.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: knight,
        destinationSquare: Square(x: 4, y: 1),
      ),
      const Move(
        piece: knight,
        destinationSquare: Square(x: 4, y: 3),
      ),
      const Move(
        piece: knight,
        destinationSquare: Square(x: 1, y: 4),
      ),
      const Move(
        piece: knight,
        destinationSquare: Square(x: 3, y: 4),
      ),
    ], 'Knight failed to generate correct moves',);
  },
    name: 'knightTest-1',
  );
}


void pawnTest() {
  // Get all possible squares from a non-starting square
  validTest(() {
    const pawn = Pawn(square: Square(x: 5, y: 5), color: PieceColor.white);
    final board = testBoard.copyWith([pawn]);

    final moves = pawn.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 5, y: 6),
      ),
    ], 'Pawn failed to generate correct moves in non-starting square',);
  },
    name: 'pawnTest-1',
  );

  // Get all possible squares from a starting square from a white pawn
  validTest(() {
    const pawn = Pawn(square: Square(x: 6, y: 2), color: PieceColor.white);
    final board = testBoard.copyWith([pawn]);

    final moves = pawn.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 6, y: 3),
      ),
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 6, y: 4),
      ),
    ], 'White pawn failed to generate correct moves in starting square',);
  },
    name: 'pawnTest-2',
  );

  // Get all possible squares from a starting square from a black pawn
  validTest(() {
    const pawn = Pawn(square: Square(x: 8, y: 7), color: PieceColor.black);
    final board = testBoard.copyWith([pawn]);

    final moves = pawn.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 8, y: 6),
      ),
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 8, y: 5),
      ),
    ], 'Black pawn failed to generate correct moves in starting square',);
  },
    name: 'pawnTest-2',
  );

  // Check if blocked by enemy piece
  validTest(() {
    const pawn = Pawn(square: Square(x: 6, y: 2), color: PieceColor.white);
    const enemyPawn = Pawn(square: Square(x: 6, y: 4), color: PieceColor.black);
    final board = testBoard.copyWith([pawn, enemyPawn]);

    final moves = pawn.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 6, y: 3),
      ),
    ], 'Pawn failed to be blocked by enemy pawn',);
  },
    name: 'pawnTest-3',
  );

  // Check if is able to attack enemy pieces
  validTest(() {
    const pawn = Pawn(square: Square(x: 3, y: 3), color: PieceColor.white);
    const ePawn1 = Pawn(square: Square(x: 4, y: 4), color: PieceColor.black);
    const ePawn2 = Pawn(square: Square(x: 2, y: 4), color: PieceColor.black);
    final board = testBoard.copyWith([pawn, ePawn1, ePawn2,]);

    final moves = pawn.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 3, y: 4),
      ),
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 2, y: 4),
      ),
      const Move(
        piece: pawn,
        destinationSquare: Square(x: 4, y: 4),
      ),
    ], 'Pawn failed to generate attacking moves',);
  },
    name: 'pawnTest-4',
  );
}


void queenTest() {
  // Get all possible squares from b2
  validTest(() {
    const queen = Queen(square: Square(x: 2, y: 2), color: PieceColor.white);
    final board = testBoard.copyWith([queen]);

    final moves = queen.calculatePossibleMoves(board);
    assert(moves == [
      // bishop
      const Move(
        piece: queen,
        destinationSquare: Square(x: 1, y: 1),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 3, y: 3),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 4, y: 4),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 5, y: 5),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 6, y: 6),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 7, y: 7),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 8, y: 8),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 1, y: 3),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 3, y: 1),
      ),
      // rook
      const Move(
        piece: queen,
        destinationSquare: Square(x: 2, y: 1),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 2, y: 3),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 2, y: 4),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 2, y: 5),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 2, y: 6),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 2, y: 7),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 2, y: 8),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 1, y: 2),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 3, y: 2),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 4, y: 2),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 5, y: 2),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 6, y: 2),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 7, y: 2),
      ),
      const Move(
        piece: queen,
        destinationSquare: Square(x: 8, y: 2),
      ),
    ], 'Queen failed to generate correct moves',);
  },
    name: 'queenTest-1',
  );
}


void rookTest() {
  validTest(() {
    const rook = Rook(square: Square(x: 2, y: 2), color: PieceColor.white);
    final board = testBoard.copyWith([rook]);

    final moves = rook.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: rook,
        destinationSquare: Square(x: 2, y: 1),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 2, y: 3),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 2, y: 4),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 2, y: 5),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 2, y: 6),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 2, y: 7),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 2, y: 8),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 1, y: 2),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 3, y: 2),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 4, y: 2),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 5, y: 2),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 6, y: 2),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 7, y: 2),
      ),
      const Move(
        piece: rook,
        destinationSquare: Square(x: 8, y: 2),
      ),
    ], 'Rook failed to generate correct moves',);
  },
    name: 'rookTest-1',
  );
}


void kingTest() {
  // Get all possible squares from a1
  validTest(() {
    const king = King(square: Square(x: 1, y: 1), color: PieceColor.white);
    const board = Board(
      pieces: [
        king,
        King(square: Square(x: 8, y: 8), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );

    final moves = king.calculatePossibleMoves(board);
    assert(moves == [
      const Move(
        piece: king,
        destinationSquare: Square(x: 1, y: 2),
      ),
      const Move(
        piece: king,
        destinationSquare: Square(x: 2, y: 2),
      ),
      const Move(
        piece: king,
        destinationSquare: Square(x: 2, y: 1),
      ),
    ], 'King failed to generate correct moves',);
  },
    name: 'kingTest-1',
  );

  // Check if can't move to attacked square
  // Gets all king's possible moves attacked by different pieces
  validTest(() {
    const king = King(square: Square(x: 5, y: 5), color: PieceColor.white);
    const board = Board(
      pieces: [
        king,
        King(square: Square(x: 3, y: 3), color: PieceColor.black),
        Queen(square: Square(x: 1, y: 3), color: PieceColor.black),
        Rook(square: Square(x: 6, y: 1), color: PieceColor.black),
        Bishop(square: Square(x: 3, y: 2), color: PieceColor.black),
        Pawn(square: Square(x: 3, y: 4), color: PieceColor.black),
        Knight(square: Square(x: 6, y: 8), color: PieceColor.black),
      ],
      dimentions: BoardDimentions(width: 8, height: 8),
    );

    final moves = king.calculatePossibleMoves(board);
    assert(moves == <Move>[], 'King could move to attacked square',);
  },
    name: 'kingTest-2',
  );
}


void testPieces() {
  bishopTest();
  knightTest();
  pawnTest();
  queenTest();
  rookTest();
  kingTest();
}


void main() {
  testPieces();
}
