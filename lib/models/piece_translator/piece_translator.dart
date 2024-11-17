
import 'package:chess/models/models.dart';


/// Thrown by pieceToString if piece is not recognized.
class PieceNotFound implements Exception {}
/// Thrown by stringToPiece if string is not recognized.
class PieceStringRepresentationNotFound implements Exception {}


/// 
class TraditionalTranslator implements PieceTranslator {
  @override
  String pieceToString(Piece piece) {
    switch (piece.runtimeType) {
      case King:
        return piece.color == PieceColor.white ? 'K' : 'k';
      case Queen:
        return piece.color == PieceColor.white ? 'Q' : 'q';
      case Rook:
        return piece.color == PieceColor.white ? 'R' : 'r';
      case Bishop:
        return piece.color == PieceColor.white ? 'B' : 'b';
      case Knight:
        return piece.color == PieceColor.white ? 'K' : 'k';
      case Pawn:
        return piece.color == PieceColor.white ? 'P' : 'p';
      default:
        throw PieceNotFound();
    }
  }

  @override
  Piece stringToPiece(String str, Square square) {
    switch (str) {
      case 'k':
        return King(square: square, color: PieceColor.black);
      case 'K':
        return King(square: square, color: PieceColor.white);
      case 'q':
        return Queen(square: square, color: PieceColor.black);
      case 'Q':
        return Queen(square: square, color: PieceColor.white);
      case 'r':
        return Rook(square: square, color: PieceColor.black);
      case 'R':
        return Rook(square: square, color: PieceColor.white);
      case 'b':
        return Bishop(square: square, color: PieceColor.black);
      case 'B':
        return Bishop(square: square, color: PieceColor.white);
      case 'n':
        return Knight(square: square, color: PieceColor.black);
      case 'N':
        return Knight(square: square, color: PieceColor.white);
      case 'p':
        return Pawn(square: square, color: PieceColor.black);
      case 'P':
        return Pawn(square: square, color: PieceColor.white);
      default:
        throw PieceStringRepresentationNotFound();
    }
  }
}
