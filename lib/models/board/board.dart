
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/piece_translator/piece_translator.dart';
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
  bool isSquareInside(Square square) {
    return
      square.x <= dimentions.width && square.x >= 1 &&
      square.y <= dimentions.height && square.y >= 1;
  }

  @override
  bool isSquareAttacked({
    required Square square,
    required PieceColor color,
    bool isKing = false,
  }) {
    for (final piece in pieces) {
      if (piece.color != color) { continue; }
      if (piece is King && isKing) {
        if (
          piece.allSquaresReachable(this)
            .map((sq) => Move(destinationSquare: sq, piece: piece))
            .any((move) => move.destinationSquare == square)
        ) {
          return true;
        }
      } else if (piece is Pawn) {
        if (
          piece.getDiagoinals()
            .map((sq) => Move(destinationSquare: sq, piece: piece))
            .any((move) => move.destinationSquare == square)
        ) {
          return true;
        }
      } else if (piece.calculatePossibleMoves(this).any(
        (move) => move.destinationSquare == square,
      )) {
        return true;
      }
    }
    return false;
  }

  @override
  Piece? getSquareContent(Square square) {
    if (!isSquareInside(square)) {
      return null;
    }
    for (final piece in pieces) {
      if (piece.square == square) {
        return piece;
      }
    }
    return null;
  }

  @override
  void checkIfBoardIsValid() {
    // Emptiness
    assert(pieces.length >= 2, "Board can't be empty");
    // Kings
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
    // Out of table
    assert(
      !pieces.any((piece) =>
        piece.square.x < 1 || piece.square.x > dimentions.width ||
        piece.square.y < 1 || piece.square.y > dimentions.height,
      ),
      'A piece is out of the board',
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
    final enemyMoves = getAllPossibleMoves(getOppositeColor(color));
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

  @override
  String toString() {
    final output = <List<String>>[];

    // populate with ' '
    for (var i = 0; i < dimentions.width; i++) {
      output.add([]);
      for (var j = 0; j < dimentions.height; j++) {
        output[i].add(' ');
      }
    }

    final translator = TraditionalTranslator();

    // populate squares with pieces
    for (final piece in pieces) {
      output[piece.square.x + 1][piece.square.y + 1] = 
        translator.pieceToString(piece);
    }

    return output.toString();
  }

  @override
  List<Object?> get props => [dimentions, pieces];

  @override
  bool? get stringify => false;
}
