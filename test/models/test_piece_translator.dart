
import 'failure.dart';


void testPTStringToPiece() {
  validTest(() {
    
  });
}


void testPTPieceToString() {
  validTest(() {
    
  });
}


void testPieceTranslator() {
  testPTStringToPiece();
  testPTPieceToString();
}


void main() {
  testPieceTranslator();
}
