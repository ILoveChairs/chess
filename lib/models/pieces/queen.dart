
import 'package:chess/models/interfaces.dart';


/// 
class Queen implements Piece {
  @override
  List<Move> calculatePossibleMoves(BoardInterface board) {
    // TODO: implement calculatePossibleMoves
    throw UnimplementedError();
  }

  @override
  // TODO: implement color
  PieceColor get color => throw UnimplementedError();

  @override
  // TODO: implement square
  Square get square => throw UnimplementedError();

  @override
  // TODO: implement value
  int get value => throw UnimplementedError();
}
