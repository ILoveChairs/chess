
import 'package:chess/models/interfaces.dart';


/// 
class Board implements BoardInterface {
  /// 
  const Board({
    required this.pieces,
    required this.dimentions,
  });

  @override
  final List<Piece?> pieces;

  @override
  final BoardDimentions dimentions;

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
  void checkIfBoardIsValid() {
    // TODO: implement checkIfBoardIsValid
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

}
