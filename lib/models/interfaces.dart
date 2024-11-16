
/// The dimentions for a board. Attributes should be > 0.
class BoardDimentions {
  /// The dimentions for a board. Attributes should be > 0.
  const BoardDimentions({
    required this.width,
    required this.height,
  }):
    assert(width > 0, 'Width of board <= 0'),
    assert(height > 0, 'Length of board <= 0');

  /// Width of the board. Usually 8.
  final int width;
  /// Height of the board. Usually 8.
  final int height;
}


/// A square is a position (hopefully) inside the board.
class Square {
  /// A square is a position (hopefully) inside the board.
  const Square({
    required this.x,
    required this.y,
  });

  /// Position in the x axis of the square, normally a letter but simplified
  /// to an int.
  final int x;
  /// Position in the x axis of the square.
  final int y;
}


/// A move is when a piece moves from A to B.
class Move {
  /// A move is when a piece moves from A to B.
  const Move({
    required this.destinationSquare,
    required this.piece,
  });

  /// The square the piece wants to end at.
  final Square destinationSquare;
  /// The piece in question. Also has starting square.
  final Piece piece;
}


/// Enum for the color of a piece.
/// Can be either black or white.
enum PieceColor {
  /// A black piece.
  black,
  /// A white piece.
  white,
}


/// A chess piece.
abstract interface class Piece {
  /// Current position of the piece.
  abstract final Square square;

  /// Color of the piece.
  abstract final PieceColor color;

  /// Value of the piece. Refer to traditional chess value of pieces.
  /// 
  /// This is used by the CPU.
  /// 
  /// The king should have value 0 and be an exception in the CPU.
  abstract final int value;

  /// A mehtod that is called by board which should output the moves that the
  /// piece can make.
  /// 
  /// It should take into account the current square and other pieces if it is
  /// a piece that can be stopped by other pieces.
  /// 
  /// Squares in which an enemy piece is in are included, squares in which a
  /// friendly piece is in are excluded. The current square is also excluded.
  List<Move> calculatePossibleMoves(BoardInterface board);
}


/// Interface for the board to implement.
/// Mostly made for testing.
/// 
/// Instead of working with a table, we get it's dimentions and
/// operate by pieces instead, which should be easier.
/// 
/// Should throw error if there is not one king for each color.
abstract interface class BoardInterface {
  /// List of pieces that the board has.
  abstract final List<Piece?> pieces;

  /// Dimentions of board.
  /// Default should be 8x8.
  abstract final BoardDimentions dimentions;

  /// Checks whether there is only one king for each color.
  void checkIfBoardIsValid();

  /// Get the content of a square.
  /// If it's empty return null,
  /// else return a piece.
  Piece? getSquareContent(Square square);

  /// Retuns whether a square is inside the board.
  bool isSquareInside(Square square);

  /// Gets all the moves possible for a specific color.
  List<Move> getAllPossibleMoves(PieceColor color);

  /// Determines if a player has no moves (tie).
  /// Is not for both players for if it hepls the cpu.
  bool isTie(PieceColor color);

  /// Determines if a piece is attacking the provided player's king.
  bool isChecked(PieceColor color);

  /// Determines if theres no moves that can stop the provided player's king
  /// from being captured next turn.
  bool isCheckmated(PieceColor color);
}


/// Translator of chess notation to objects and vice versa.
/// 
/// Used to recieve and send json data while having objects to work with.
abstract interface class PieceTranslator {
  /// Converts a char (or string!) representing a chess piece in traditional
  /// notation to an instance of a Piece object.
  Piece stringToPiece(String str, Square square);

  /// Converts a Piece instance to a char (or string!) to be returned via json.
  String pieceToString(Piece piece);
}


/// Not a hardware's CPU, a simple AI that produces predictible-ish results
/// based on input.
/// 
/// I did not want to call it AI as it may imply that there is machine learning
/// involved, which is definitely not the case.
abstract interface class CPU {
  /// Current board.
  abstract final BoardInterface board;

  /// Color to generate the move for.
  abstract final PieceColor color;

  /// Internal-ish method that gathers the best moves up to 5.
  /// 
  /// If there is not 5 equally good moves, it will return less.
  List<Move> getBestMoves(BoardInterface board);

  /// Calculates which move the CPU wants to make and returns a board with the
  /// move already done.
  BoardInterface calculateTurn();
}
