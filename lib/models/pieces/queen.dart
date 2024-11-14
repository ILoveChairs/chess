
import 'package:chess/models/interfaces.dart';


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
    // TODO: implement calculatePossibleMoves
    throw UnimplementedError();
  }
}
