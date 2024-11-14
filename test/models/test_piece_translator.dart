
import 'package:chess/models/models.dart';
import 'failure.dart';


void testPTStringToPiece() {
  final translatorInstance = TraditionalTranslator();
  const square = Square(x: 3, y: 4);
  validTest(() {
    assert(
      translatorInstance.stringToPiece(
        'b', square,
      ) == const Bishop(square: square, color: PieceColor.black),
      'Bishop failed.',
    );
    assert(
      translatorInstance.stringToPiece(
        'B', square,
      ) == const Bishop(square: square, color: PieceColor.white),
      'Bishop failed.',
    );
  },
    name: 'testPTStringToPiece-1',
  );
  validTest(() {
    assert(
      translatorInstance.stringToPiece(
        'n', square,
      ) == const Knight(square: square, color: PieceColor.black),
      'Knight failed.',
    );
    assert(
      translatorInstance.stringToPiece(
        'N', square,
      ) == const Knight(square: square, color: PieceColor.white),
      'Knight failed.',
    );
  },
    name: 'testPTStringToPiece-2',
  );
  validTest(() {
    assert(
      translatorInstance.stringToPiece(
        'p', square,
      ) == const Pawn(square: square, color: PieceColor.black),
      'Pawn failed.',
    );
    assert(
      translatorInstance.stringToPiece(
        'P', square,
      ) == const Pawn(square: square, color: PieceColor.white),
      'Pawn failed.',
    );
  },
    name: 'testPTStringToPiece-3',
  );
  validTest(() {
    assert(
      translatorInstance.stringToPiece(
        'q', square,
      ) == const Queen(square: square, color: PieceColor.black),
      'Queen failed.',
    );
    assert(
      translatorInstance.stringToPiece(
        'Q', square,
      ) == const Queen(square: square, color: PieceColor.white),
      'Queen failed.',
    );
  },
    name: 'testPTStringToPiece-4',
  );
  validTest(() {
    assert(
      translatorInstance.stringToPiece(
        'r', square,
      ) == const Rook(square: square, color: PieceColor.black),
      'Rook failed.',
    );
    assert(
      translatorInstance.stringToPiece(
        'R', square,
      ) == const Rook(square: square, color: PieceColor.white),
      'Rook failed.',
    );
  },
    name: 'testPTStringToPiece-5',
  );
  validTest(() {
    assert(
      translatorInstance.stringToPiece(
        'k', square,
      ) == const King(square: square, color: PieceColor.black),
      'King failed.',
    );
    assert(
      translatorInstance.stringToPiece(
        'K', square,
      ) == const King(square: square, color: PieceColor.white),
      'King failed.',
    );
  },
    name: 'testPTStringToPiece-6',
  );
}


void testPTPieceToString() {
  final translatorInstance = TraditionalTranslator();
  const square = Square(x: 4, y: 3);
  validTest(() {
    assert(
      translatorInstance.pieceToString(
        const Bishop(color: PieceColor.black, square: square),
      ) == 'b',
      'Bishop failed.',
    );
    assert(
      translatorInstance.pieceToString(
        const Bishop(color: PieceColor.white, square: square),
      ) == 'B',
      'Bishop failed.',
    );
  },
    name: 'testPTPieceToString-1',
  );
  validTest(() {
    assert(
      translatorInstance.pieceToString(
        const Knight(color: PieceColor.black, square: square),
      ) == 'n',
      'Knight failed.',
    );
    assert(
      translatorInstance.pieceToString(
        const Knight(color: PieceColor.white, square: square),
      ) == 'N',
      'Knight failed.',
    );
  },
    name: 'testPTPieceToString-2',
  );
  validTest(() {
    assert(
      translatorInstance.pieceToString(
        const Pawn(color: PieceColor.black, square: square),
      ) == 'p',
      'Pawn failed.',
    );
    assert(
      translatorInstance.pieceToString(
        const Pawn(color: PieceColor.white, square: square),
      ) == 'P',
      'Pawn failed.',
    );
  },
    name: 'testPTPieceToString-3',
  );
  validTest(() {
    assert(
      translatorInstance.pieceToString(
        const Queen(color: PieceColor.black, square: square),
      ) == 'q',
      'Queen failed.',
    );
    assert(
      translatorInstance.pieceToString(
        const Queen(color: PieceColor.white, square: square),
      ) == 'Q',
      'Queen failed.',
    );
  },
    name: 'testPTPieceToString-4',
  );
  validTest(() {
    assert(
      translatorInstance.pieceToString(
        const Rook(color: PieceColor.black, square: square),
      ) == 'r',
      'Rook failed.',
    );
    assert(
      translatorInstance.pieceToString(
        const Rook(color: PieceColor.white, square: square),
      ) == 'R',
      'Rook failed.',
    );
  },
    name: 'testPTPieceToString-5',
  );
  validTest(() {
    assert(
      translatorInstance.pieceToString(
        const King(color: PieceColor.black, square: square),
      ) == 'k',
      'King failed.',
    );
    assert(
      translatorInstance.pieceToString(
        const King(color: PieceColor.white, square: square),
      ) == 'K',
      'King failed.',
    );
  },
    name: 'testPTPieceToString-6',
  );
}


void testPieceTranslator() {
  testPTStringToPiece();
  testPTPieceToString();
}


void main() {
  testPieceTranslator();
}
