
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
    // TODO: implement calculatePossibleMoves
    throw UnimplementedError();
  }
}
