
import 'package:chess/models/interfaces.dart';


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
    // TODO: implement calculatePossibleMoves
    throw UnimplementedError();
  }
}
