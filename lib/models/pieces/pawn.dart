
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/move_sorter.dart';
import 'package:equatable/equatable.dart';


/// 
class Pawn extends Equatable implements Piece {
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
        if (square.y == 2) {
          if (square2Content == null) {
            moves.add(Move(destinationSquare: square2, piece: this));
          }
        }
      }
      // Diagonal if enemy piece
      addDiagonalsIfEnemyPiece(
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
        if (square.y == board.dimentions.height - 1) {
          if (square2Content == null) {
            moves.add(Move(destinationSquare: square2, piece: this));
          }
        }
      }
      // Diagonal if enemy piece
      addDiagonalsIfEnemyPiece(
        moves: moves,
        piece: this,
        board: board,
      );
    }
    return moves..sort(moveSorter);
  }

  /// Returns squares diagonally in front of the pawn
  List<Square> getDiagoinals() {
    final yMod = color == PieceColor.white ? 1 : -1;
    return [
      Square(x: square.x - 1, y: square.y + yMod),
      Square(x: square.x + 1, y: square.y + yMod),
    ];
  }

  @override
  String toString() {
    return 'P($square, $color)';
  }

  @override
  List<Object?> get props => [color, square];
}


/// Diagonal piece adder
void addDiagonalsIfEnemyPiece({
  required List<Move> moves,
  required Pawn piece,
  required BoardInterface board,
}) {
  final diagonals = piece.getDiagoinals();
  final square1 = diagonals[0];
  final square2 = diagonals[1];
  final square1Content = board.getSquareContent(square1);
  final square2Content = board.getSquareContent(square2);
  if (square1Content != null && square1Content.color != piece.color) {
    moves.add(Move(destinationSquare: square1, piece: piece));
  }
  if (square2Content != null && square2Content.color != piece.color) {
    moves.add(Move(destinationSquare: square2, piece: piece));
  }
}
