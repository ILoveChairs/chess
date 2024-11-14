

import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/bishop.dart';
import 'package:chess/models/pieces/king.dart';
import 'package:chess/models/pieces/knight.dart';
import 'package:chess/models/pieces/pawn.dart';
import 'package:chess/models/pieces/queen.dart';
import 'package:chess/models/pieces/rook.dart';


/// 
class PieceFactory {
  /// 
  static Piece fabricateByPiece(
    Type pieceType,
    Square square,
    PieceColor color,
  ) {
    switch (pieceType) {
      case King:
        return King(square: square, color: color);
      case Queen:
        return King(square: square, color: color);
      case Rook:
        return King(square: square, color: color);
      case Knight:
        return King(square: square, color: color);
      case Bishop:
        return King(square: square, color: color);
      case Pawn:
        return King(square: square, color: color);
      default:
        throw ArgumentError(
          'Piece factory type argument not recognized',
          'pieceType',
        );
    }
  }
}
