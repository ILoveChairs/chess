
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/bishop.dart';
import 'package:chess/models/pieces/rook.dart';


/// 
class Queen implements Piece {
  /// 
  const Queen({
    required this.square,
    required this.color,
    this.value = 9,
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
    addRookMoves(moves: moves, board: board, piece: this);
    addBishopMoves(moves: moves, board: board, piece: this);
    return moves;
  }
}
