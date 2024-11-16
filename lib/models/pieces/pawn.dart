
import 'package:chess/models/interfaces.dart';


/// 
class Pawn implements Piece {
  /// 
  const Pawn({
    required this.square,
    required this.color,
    this.value = 1,
  });

  @override
  final PieceColor color;

  @override
  final Square square;

  @override
  final int value;

  @override
  List<Move> calculatePossibleMoves(BoardInterface board) {
    final moves = <Move>[];
    // White
    if (color == PieceColor.white) {
      // Forward
      final square1 = Square(x: square.x, y: square.y + 1);
      final square1Content = board.getSquareContent(square1);
      if (square1Content == null) {
        moves.add(Move(destinationSquare: square1, piece: this));
        final square2 = Square(x: square.x, y: square.y + 2);
        final square2Content = board.getSquareContent(square2);
        if (square2Content == null || square2Content.color != color) {
          moves.add(Move(destinationSquare: square2, piece: this));
        }
      } else if (square1Content.color != color) {
        moves.add(Move(destinationSquare: square1, piece: this));
      }
      // Diagonal if enemy piece
      addDiagonalsIfEnemyPiece(
        square: Square(x: square.x, y: square.y + 1),
        moves: moves,
        piece: this,
        board: board,
      );
    // Black
    } else {
      // Forward
      final square1 = Square(x: square.x, y: square.y - 1);
      final square1Content = board.getSquareContent(square1);
      if (square1Content == null) {
        moves.add(Move(destinationSquare: square1, piece: this));
        final square2 = Square(x: square.x, y: square.y - 2);
        final square2Content = board.getSquareContent(square2);
        if (square2Content == null || square2Content.color != color) {
          moves.add(Move(destinationSquare: square2, piece: this));
        }
      } else if (square1Content.color != color) {
        moves.add(Move(destinationSquare: square1, piece: this));
      }
      // Diagonal if enemy piece
      addDiagonalsIfEnemyPiece(
        square: Square(x: square.x, y: square.y - 1),
        moves: moves,
        piece: this,
        board: board,
      );
    }
    return moves;
  }
}


/// 
void addDiagonalsIfEnemyPiece({
  required Square square,
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  final square1 = Square(x: square.x - 1, y: square.y);
  final square2 = Square(x: square.x + 1, y: square.y);
  final square1Content = board.getSquareContent(square1);
  final square2Content = board.getSquareContent(square2);
  if (square1Content != null && square1Content.color != piece.color) {
    moves.add(Move(destinationSquare: square1, piece: piece));
  }
  if (square2Content != null && square2Content.color != piece.color) {
    moves.add(Move(destinationSquare: square2, piece: piece));
  }
}
