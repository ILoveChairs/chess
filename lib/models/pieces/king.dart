
import 'package:chess/models/interfaces.dart';


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
    // TODO: implement calculatePossibleMoves
    throw UnimplementedError();
  }
}
