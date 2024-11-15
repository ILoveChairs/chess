import 'package:chess/models/interfaces.dart';

/// Move
void simpleMoveSetter({
  required Square currentSquare,
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  final currentSquareContent = board.getSquareContent(currentSquare);
  if (currentSquareContent != null) {
    if (currentSquareContent.color != piece.color) {
      moves.add(
        Move(destinationSquare: currentSquare, piece: piece),
      );
    }
  } else {
    moves.add(
      Move(destinationSquare: currentSquare, piece: piece),
    );
  }
}
