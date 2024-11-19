
import 'package:chess/models/cpu/advantage_calc/weights.dart';
import 'package:chess/models/models.dart';

/// 
double positionAdv(
  BoardInterface board,
  {
    required Iterable<Piece> whitePieces,
    required Iterable<Piece> blackPieces,
  }
) {
  var whitePoints = 0.0;
  var blackPoints = 0.0;

  for (final whitePiece in whitePieces) {
    whitePoints += _getPoints(whitePiece);
  }

  for (final blackPiece in blackPieces) {
    blackPoints += _getPoints(blackPiece);
  }

  return (whitePoints - blackPoints) * Weights.position.weight;
}


double _getPoints(Piece piece) {
  return 0;
}
