
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/pieces/move_sorter.dart';
import 'package:chess/models/pieces/stoppable_move_setter.dart';
import 'package:equatable/equatable.dart';


/// 
class Bishop extends Equatable implements Piece {
  /// 
  const Bishop({
    required this.square,
    required this.color,
    this.value = 3,
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
    addBishopMoves(moves: moves, board: board, piece: this);
    return moves..sort(moveSorter);
  }

  @override
  String toString() {
    return 'B($square, $color)';
  }

  @override
  List<Object?> get props => [color, square];
}


/// Adds to 'moves' bishop moveset
void addBishopMoves({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  addBishopBottoms(moves: moves, piece: piece, board: board);
  addBishopTops(moves: moves, piece: piece, board: board);
}


/// Adds to 'moves' bottom diagonal moves
void addBishopBottoms({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  addBishopBottomLeftDiagonal(moves: moves, piece: piece, board: board);
  addBishopBottomRightDiagonal(moves: moves, piece: piece, board: board);
}


/// Adds to 'moves' bottom left diagonal moves
void addBishopBottomLeftDiagonal({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  var changingX = piece.square.x - 1;
  var changingY = piece.square.y - 1;
  while (
    changingX >= 1 &&
    changingY >= 1
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: changingX, y: changingY),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
    changingX--;
    changingY--;
  }
}


/// Adds to 'moves' bottom right diagonal moves
void addBishopBottomRightDiagonal({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  var changingX = piece.square.x + 1;
  var changingY = piece.square.y - 1;
  while (
    changingX <= board.dimentions.width &&
    changingY >= 1
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: changingX, y: changingY),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
    changingX++;
    changingY--;
  }
}


/// Adds to 'moves' top diagonal moves
void addBishopTops({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  addBishopTopLeftDiagonal(moves: moves, piece: piece, board: board);
  addBishopTopRightDiagonal(moves: moves, piece: piece, board: board);
}

/// Adds to 'moves' top left diagonal moves
void addBishopTopLeftDiagonal({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  var changingX = piece.square.x - 1;
  var changingY = piece.square.y + 1;
  while (
    changingX >= 1 &&
    changingY <= board.dimentions.height
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: changingX, y: changingY),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
    changingX--;
    changingY++;
  }
}

/// Adds to 'moves' top right diagonal moves
void addBishopTopRightDiagonal({
  required List<Move> moves,
  required Piece piece,
  required BoardInterface board,
}) {
  var changingX = piece.square.x + 1;
  var changingY = piece.square.y + 1;
  while (
    changingX <= board.dimentions.width &&
    changingY <= board.dimentions.height
  ) {
    if (stoppableMoveSetter(
      currentSquare: Square(x: changingX, y: changingY),
      moves: moves,
      piece: piece,
      board: board,
    )) {break;}
    changingX++;
    changingY++;
  }
}
