
import 'package:chess/models/interfaces.dart';


/// 
class Rook implements Piece {
  /// 
  const Rook({
    required this.square,
    required this.color,
    this.value = 5,
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
