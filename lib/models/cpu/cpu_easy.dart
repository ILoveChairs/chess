
import 'package:chess/models/interfaces.dart';

/// 
class CpuEasy implements CPU {
  /// 
  const CpuEasy({
    required this.board,
    required this.color,
  });

  @override
  final BoardInterface board;

  @override
  final PieceColor color;

  @override
  BoardInterface calculateTurn() {
    // TODO: implement calculateTurn
    throw UnimplementedError();
  }

  @override
  List<Move> getBestMoves(BoardInterface board) {
    // TODO: implement getBestMoves
    throw UnimplementedError();
  }


  @override
  List<Object?> get props => [color, board];

  @override
  bool? get stringify => false;
}
