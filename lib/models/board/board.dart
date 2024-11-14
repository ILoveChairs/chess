
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/pieces.dart';


/// 
class Board implements BoardInterface {
  /// 
  const Board({
    required this.pieces,
    required this.dimentions,
  });

  @override
  final List<Piece> pieces;

  @override
  final BoardDimentions dimentions;

  ///
  Iterable<Piece> getPiecesOfColor(PieceColor color) {
    return pieces.where((piece) => piece.color == color);
  }

  /// 
  King getKingOfColor(PieceColor color) {
    return pieces.firstWhere(
      (piece) => piece is King && piece.color == color,
    ) as King;
  }

  @override
  List<Move> getAllPossibleMoves(PieceColor color) {
    final moves = <Move>[];
    final coloredPieces = getPiecesOfColor(color);
    for (final piece in coloredPieces) {
      moves.addAll(piece.calculatePossibleMoves(this));
    }
    return moves;
  }

  @override
  Piece? getSquareContent(Square square) {
    for (final piece in pieces) {
      if (piece.square == square) {
        return piece;
      }
    }
    return null;
  }

  @override
  void checkIfBoardIsValid() {
    assert(pieces.length < 2, "Board can't be empty");
    final kings = <King>[];
    for (final piece in pieces) {
      if (piece is King) {
        kings.add(piece);
      }
    }
    assert(kings.length == 2, 'King amount is not 2');
    assert(
      kings.any(
        (king) => king.color == PieceColor.black,
      ),
      'Black king not found',
    );
    assert(
      kings.any(
        (king) => king.color == PieceColor.white,
      ),
      'White king not found',
    );
  }

  /// 
  Board applyMove(Move move) {
    final newPieces = List<Piece>.from(pieces);
    final destinationPiece = getSquareContent(move.destinationSquare);
    if (destinationPiece != null) {
      newPieces.remove(destinationPiece);
    }
    final newPiece = PieceFactory.fabricateByPiece(
      move.piece.runtimeType,
      move.destinationSquare,
      move.piece.color,
    );
    newPieces
      ..remove(move.piece)
      ..add(newPiece);
    return Board(pieces: newPieces, dimentions: dimentions);
  }

  @override
  bool isChecked(PieceColor color) {
    final king = getKingOfColor(color);
    final enemyColor = color == PieceColor.black ?
      PieceColor.black: PieceColor.white;
    final enemyMoves = getAllPossibleMoves(enemyColor);
    return enemyMoves.any(
      (move) => move.destinationSquare == king.square,
    );
  }

  @override
  bool isCheckmated(PieceColor color) {
    if (!isChecked(color)) {
      return false;
    }

    final moves = getAllPossibleMoves(color);
    for (final move in moves) {
      if (!applyMove(move).isChecked(color)) {
        return true;
      }
    }
    return false;
  }

  @override
  bool isTie(PieceColor color, {bool checkWasChecked = false}) {
    final moves = getAllPossibleMoves(color);
    if (!checkWasChecked) {
      if (isChecked(color)) {
        return false;
      }
    }
    return moves.isEmpty;
  }

  /// 
  Board copyWith(List<Piece> newPieces) {
    return Board(
      pieces: [...pieces, ...newPieces],
      dimentions: dimentions,
    );
  }
}
