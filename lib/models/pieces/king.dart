
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/move_sorter.dart';
import 'package:chess/models/pieces/simple_move_setter.dart';
import 'package:equatable/equatable.dart';


/// 
class King extends Equatable implements Piece {
  /// 
  const King({
    required this.square,
    required this.color,
    this.value = 0,
  });

  @override
  final PieceColor color;

  @override
  final Square square;

  @override
  final int value;

  /// All squares that the king can attack.
  /// Does not check if the square is inside the board.
  List<Square> allSquaresReachable(BoardInterface board) {
    return [
      Square(x: square.x + 1, y: square.y + 1),
      Square(x: square.x + 1, y: square.y),
      Square(x: square.x + 1, y: square.y - 1),
      Square(x: square.x, y: square.y + 1),
      Square(x: square.x, y: square.y - 1),
      Square(x: square.x - 1, y: square.y + 1),
      Square(x: square.x - 1, y: square.y),
      Square(x: square.x - 1, y: square.y - 1),
    ];
  }

  @override
  List<Move> calculatePossibleMoves(BoardInterface board) {
    final moves = <Move>[];
    final possibleSquares = allSquaresReachable(board);
    for (final possibleSquare in possibleSquares) {
      if (!board.isSquareInside(possibleSquare)) {continue;}
      if (board.isSquareAttacked(
        square: possibleSquare,
        color: getOppositeColor(color),
        isKing: true,
      )) {
        continue;
      }
      simpleMoveSetter(
        currentSquare: possibleSquare,
        moves: moves,
        piece: this,
        board: board,
      );
    }
    return moves..sort(moveSorter);
  }

  @override
  String toString() {
    return 'K($square, $color)';
  }

  @override
  List<Object?> get props => [color, square];
}
