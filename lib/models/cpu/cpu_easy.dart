
import 'package:chess/models/interfaces.dart';

/// 
class CpuEasy implements CPU {
  @override
  // TODO: implement board
  BoardInterface get board => throw UnimplementedError();

  @override
  BoardInterface calculateTurn() {
    // TODO: implement calculateTurn
    throw UnimplementedError();
  }

  @override
  // TODO: implement color
  PieceColor get color => throw UnimplementedError();

  @override
  List<Move> getBestMoves(BoardInterface board) {
    // TODO: implement getBestMoves
    throw UnimplementedError();
  }

}
