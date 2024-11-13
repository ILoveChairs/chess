
import 'package:chess/models/interfaces.dart';


/// 
class Board implements BoardInterface {
  @override
  void checkIfBoardIsValid() {
    // TODO: implement checkIfBoardIsValid
  }

  @override
  // TODO: implement dimentions
  BoardDimentions get dimentions => throw UnimplementedError();

  @override
  List<Move> getAllPossibleMoves(PieceColor color) {
    // TODO: implement getAllPossibleMoves
    throw UnimplementedError();
  }

  @override
  Piece? getSquareContent(Square square) {
    // TODO: implement getSquareContent
    throw UnimplementedError();
  }

  @override
  bool isChecked(PieceColor color) {
    // TODO: implement isChecked
    throw UnimplementedError();
  }

  @override
  bool isCheckmated(PieceColor color) {
    // TODO: implement isCheckmated
    throw UnimplementedError();
  }

  @override
  bool isTie(PieceColor color) {
    // TODO: implement isTie
    throw UnimplementedError();
  }

  @override
  // TODO: implement pieces
  List<Piece?> get pieces => throw UnimplementedError();
}
