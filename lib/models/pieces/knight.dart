
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/simple_move_setter.dart';


/// 
class Knight implements Piece {
  /// 
  const Knight({
    required this.square,
    required this.color,
    this.value = 3,
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
      // top
      Square(x: square.x + 1, y: square.y + 2),
      Square(x: square.x - 1, y: square.y + 2),
      // left
      Square(x: square.x - 2, y: square.y + 1),
      Square(x: square.x - 2, y: square.y - 1),
      // bottom
      Square(x: square.x + 1, y: square.y - 2),
      Square(x: square.x - 1, y: square.y - 2),
      // right
      Square(x: square.x + 2, y: square.y + 1),
      Square(x: square.x + 2, y: square.y - 1),
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
}
