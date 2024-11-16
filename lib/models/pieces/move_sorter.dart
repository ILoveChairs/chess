
import 'package:chess/models/interfaces.dart';

/// 
int moveSorter(Move m1, Move m2) {
  return 
    m1.destinationSquare.x.compareTo(m2.destinationSquare.x) * 2 +
    m1.destinationSquare.y.compareTo(m2.destinationSquare.y);
}
