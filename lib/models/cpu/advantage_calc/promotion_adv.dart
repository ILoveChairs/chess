
import 'package:chess/models/cpu/advantage_calc/weights.dart';
import 'package:chess/models/models.dart';


/// 
double promotionAdv(
  BoardInterface board,
  {
    required Iterable<Piece> whitePieces,
    required Iterable<Piece> blackPieces,
  }
) {
  var whitePoints = 0.0;
  var blackPoints = 0.0;

  whitePieces.where((piece) => piece.runtimeType is Pawn)
    .forEach((whitePiece) {
      if (whitePiece.square.y >= 5) {
        whitePoints += whitePiece.square.y - 4;
      }
    },);

  blackPieces.where((piece) => piece.runtimeType is Pawn)
    .forEach((blackPiece) {
      if (blackPiece.square.y <= 4) {
        blackPoints += 5 - blackPiece.square.y;
      }
    },);

  return (whitePoints - blackPoints) * Weights.promotion.weight;
}
