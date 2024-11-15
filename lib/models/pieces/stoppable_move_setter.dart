
import 'package:chess/models/interfaces.dart';

/// This is a piece of code inside a loop that repeated itself a lot and was
/// too much hassle to extract in it's entirety.
/// 
/// Adds to 'moves' the current square if possible.
/// 
/// As it should be called inside a loop if it should break returns true.
bool stoppableMoveSetter({
  required Square currentSquare,
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  final currentSquareContent = board.getSquareContent(currentSquare);
  if (currentSquareContent != null) {
    if (currentSquareContent.color == piece.color) {
      return true;
    } else {
      moves.add(
        Move(destinationSquare: currentSquare, piece: piece),
      );
      return true;
    }
  } else {
    moves.add(
      Move(destinationSquare: currentSquare, piece: piece),
    );
    return false;
  }
}
