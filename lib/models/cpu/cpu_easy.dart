
import 'dart:math' show Random;
import 'package:chess/models/cpu/advantage_calc/advantage_calc.dart';
import 'package:chess/models/interfaces.dart';
import 'package:chess/models/models.dart';

/// 
class CpuEasy implements CPU {
  /// 
  const CpuEasy({
    required this.board,
    required this.color,
  });

  @override
  final BoardInterface board;

  @override
  final PieceColor color;

  @override
  BoardInterface calculateTurn() {
    final bestMoves = getBestMoves();
    final randomNum = Random().nextDouble();
    final chosenMove = _chooseBestMove(bestMoves, randomNum);
    return board.applyMove(chosenMove);
  }

  @override
  List<Move> getBestMoves() {
    return _getBestMoves(board, color);
  }


  @override
  List<Object?> get props => [color, board];

  @override
  bool? get stringify => false;
}


/// Does a simple distribution of probability where
/// the first element has 50% chance of being selected,
/// and each next one has half the chance of the previous,
/// except the last one that has the same chance as the previous.
/// 
/// If empty it throws an error, and if length == 1 it returns the first value.
/// 
/// ---
/// 
/// Example with 5 elements:
/// 1. 50%
/// 2. 25%
/// 3. 12,5%
/// 4. 6,25%
/// 5. 6,25%
Move _chooseBestMove(List<Move> moves, double randomNum) {
  if (moves.isEmpty) { throw Exception('_chooseBestMove empty'); }
  if (moves.length == 1) { return moves.first; }
  var chance = 1.0;
  var sum = 0.0;
  for (var i = 0; i < moves.length; i++) {
    // Chance calc
    if (i != moves.length - 1) {
      chance = chance / 2;
    }
    // Sum and nextSum
    final nextSum = sum + chance;
    // Check with randomNum
    if (randomNum >= sum && randomNum <= nextSum) {
      return moves[i];
    }
    sum = nextSum;
  }
  // In case of failure return first.
  return moves.first;
}


/// 
List<Move> _getBestMoves(BoardInterface board, PieceColor color) {
  final moves = board.getAllPossibleMoves(color);
  late final  List<Move> selected;
  // If checked oblige to move the king
  if (board.isChecked(color)) {
    if (board.isCheckmated(color)) throw Exception('Checkmated');
    selected = [];
    for (final move in moves) {
      if (
        !board.applyMove(move).isChecked(color)
      ) {
        selected.add(move);
      }
    }
  // If not checked
  } else {
    // ! Unoptimized, calculates advantages more times that necessary
    if (color == PieceColor.white) {
      selected = List<Move>.from(moves)
        ..sort((move1, move2) =>
          calculateAllAdvantages(board.applyMove(move1)).round().compareTo(
            calculateAllAdvantages(board.applyMove(move2)).round(),
          ),
        );
    } else {
      // reversed
      selected = List<Move>.from(moves)
        ..sort((move1, move2) =>
          calculateAllAdvantages(board.applyMove(move2)).round().compareTo(
            calculateAllAdvantages(board.applyMove(move1)).round(),
          ),
        );
    }
  }
  return selected;
}
