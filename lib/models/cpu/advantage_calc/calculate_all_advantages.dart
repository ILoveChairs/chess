/// To facilitate the adding we expose a facade that adds all the advantages.
library;

import 'package:chess/models/cpu/advantage_calc/attack_adv.dart';
import 'package:chess/models/cpu/advantage_calc/material_adv.dart';
import 'package:chess/models/cpu/advantage_calc/position_adv.dart';
import 'package:chess/models/cpu/advantage_calc/promotion_adv.dart';
import 'package:chess/models/cpu/advantage_calc/security_adv.dart';
import 'package:chess/models/interfaces.dart';


/// ### calculateAllAdvantages(board)
/// 
/// Calculates all advantages.
/// 
/// ---
/// 
/// ### Return values
/// 
/// Returns 0 if the position is equal.
/// 
/// Returns (+) positive if the position is advantageous for white.
/// 
/// Returns (-) negative if the position is advantageous for black.
double calculateAllAdvantages(BoardInterface board) {
  final whitePieces = board.getPiecesOfColor(PieceColor.white);
  final blackPieces = board.getPiecesOfColor(PieceColor.black);
  return
    attackAdv(board, whitePieces: whitePieces, blackPieces: blackPieces, ) +
    materialAdv(board, whitePieces: whitePieces, blackPieces: blackPieces, ) +
    positionAdv(board, whitePieces: whitePieces, blackPieces: blackPieces, ) +
    promotionAdv(board, whitePieces: whitePieces, blackPieces: blackPieces,) +
    securityAdv(board, whitePieces: whitePieces, blackPieces: blackPieces, );
}
