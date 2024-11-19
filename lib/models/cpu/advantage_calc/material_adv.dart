
import 'package:chess/models/models.dart';


/// 
double materialAdv(
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

  return whitePoints - blackPoints;
}


double _getPoints(Piece piece) {
  switch (piece.runtimeType) {
    case King:
      return 0;
    case Queen:
      return 9;
    case Rook:
      return 5;
    case Bishop:
      return 3;
    case Knight:
      return 3;
    case Pawn:
      return 1;
    default:
      return 0;
  }
}
