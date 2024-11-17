
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/move_sorter.dart';
import 'package:chess/models/pieces/stoppable_move_setter.dart';
import 'package:equatable/equatable.dart';


/// 
class Rook extends Equatable implements Piece {
  /// 
  const Rook({
    required this.square,
    required this.color,
    this.value = 5,
  });

  @override
  final PieceColor color;

  @override
  final Square square;

  @override
  final int value;

  @override
  List<Move> calculatePossibleMoves(BoardInterface board) {
    final moves = <Move>[];
    addRookMoves(moves: moves, board: board, piece: this);
    return moves..sort(moveSorter);
  }

  @override
  String toString() {
    return 'R($square, $color)';
  }
  
  @override
  List<Object?> get props => [color, square];
}


/// Adds to 'moves' rook moveset
void addRookMoves({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  addRookHorizontals(moves: moves, piece: piece, board: board);
  addRookVerticals(moves: moves, piece: piece, board: board);
}


/// Adds to 'moves' horizontal line moves
void addRookHorizontals({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  addRookLeftLine(moves: moves, piece: piece, board: board);
  addRookRightLine(moves: moves, piece: piece, board: board);
}


/// Adds to 'moves' left line moves
void addRookLeftLine({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  for (
    var changingX = piece.square.x - 1;
    changingX >= 1;
    changingX--
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: changingX, y: piece.square.y),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
  }
}


/// Adds to 'moves' right line moves
void addRookRightLine({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  for (
    var changingX = piece.square.x + 1;
    changingX <= board.dimentions.width;
    changingX++
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: changingX, y: piece.square.y),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
  }
}


/// Adds to 'moves' vertical line moves
void addRookVerticals({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  addRookTopLine(moves: moves, piece: piece, board: board);
  addRookBottomLine(moves: moves, piece: piece, board: board);
}

/// Adds to 'moves' top line moves
void addRookTopLine({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  for (
    var changingY = piece.square.y + 1;
    changingY <= board.dimentions.height;
    changingY++
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: piece.square.x, y: changingY),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
  }
}

/// Adds to 'moves' bottom line moves
void addRookBottomLine({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  for (
    var changingY = piece.square.y - 1;
    changingY >= 1;
    changingY--
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: piece.square.x, y: changingY),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
  }
}
