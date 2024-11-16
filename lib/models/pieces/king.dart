
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/simple_move_setter.dart';


/// 
class King implements Piece {
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

  @override
  List<Move> calculatePossibleMoves(BoardInterface board) {
    final moves = <Move>[];
    final possibleSquares = [
      Square(x: square.x + 1, y: square.y + 1),
      Square(x: square.x + 1, y: square.y),
      Square(x: square.x + 1, y: square.y - 1),
      Square(x: square.x, y: square.y + 1),
      Square(x: square.x, y: square.y - 1),
      Square(x: square.x - 1, y: square.y + 1),
      Square(x: square.x - 1, y: square.y),
      Square(x: square.x - 1, y: square.y - 1),
    ];
    for (final possibleSquare in possibleSquares) {
      if (board.isSquareInside(possibleSquare)) {continue;}
      simpleMoveSetter(
        currentSquare: possibleSquare,
        moves: moves,
        piece: this,
        board: board,
      );
    }
    return moves;
  }

  @override
  String toString() {
    return 'K($square, $color)';
  }
}
