
import 'package:chess/models/models.dart';

void boardInstancingTest() {
  try {
    Board()
    .checkIfBoardIsValid();
  } catch (e) {
    throw AssertionError('');
  }
}




void main() {
  boardInstancingTest();
}
