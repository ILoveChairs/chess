
import 'package:chess/models/models.dart';
import 'package:dart_frog/dart_frog.dart';


Future<Response> onRequest(RequestContext context) async {
  final responseBoard = <List<String>>[];
  try {
    final json = await context.request.json();
    if (json is! Map) {
      throw Exception('json is not map');
    }
    final colorString = json['color'];
    if (!(
      colorString is String &&
      (colorString.toLowerCase() == 'black' ||
      colorString.toLowerCase() == 'white')
    )) {
      throw Exception('color is incorrect');
    }
    final color = colorString.toLowerCase() == 'white' ?
      PieceColor.white : PieceColor.black;
    final stringBoard = json['board'];
    final requestBoard = <List<String>>[];
    if (stringBoard is! List) {throw Exception('board is not a list');}
    for (var x = 0; x < stringBoard.length; x++) {
      if (stringBoard[x] is! List) {
        throw Exception('element from list is not list');
      }
      final sublist = stringBoard[x] as List;
      requestBoard.add([]);
      for (var y = 0; y < sublist.length; y++) {
        if (sublist[y] is! String) {
          throw Exception('element from sublist is not a string');
        }
        final str = sublist[y] as String;
        requestBoard[x].add(str);
      }
    }
    final translator = TraditionalTranslator();
    final pieces = <Piece>[];
    for (var x = 0; x < requestBoard.length; x++) {
      final column = requestBoard[x];
      for (var y = 0; y < column.length; y++) {
        final stringSquare = column[y];
        if (!(stringSquare == ' ' || stringSquare.isEmpty)) {
          pieces.add(
            translator.stringToPiece(stringSquare, Square(x: x + 1, y: y + 1)),
          );
        }
      }
    }
    final board = Board(
      pieces: pieces,
      dimentions: const BoardDimentions(
        width: 8,
        height: 8,
      ),
    );
    try {
      final cpu = CpuEasy(board: board, color: color);
      final generatedBoard = cpu.calculateTurn();
      for (var x = 0; x < generatedBoard.dimentions.width; x++) {
        responseBoard.add([]);
        for (var y = 0; y < generatedBoard.dimentions.height; y++) {
          final piece = generatedBoard.getSquareContent(
            Square(x: x + 1, y: y + 1),
          );
          if (piece == null) {
            responseBoard[x].add(' ');
          } else {
            responseBoard[x].add(
              translator.pieceToString(piece),
            );
          }
        }
      }
    } catch (e) {
      return Response.json(
        statusCode: 501,
        body: {
          'error': e.toString(),
        },
      );
    }
  } catch (e) {
    return Response.json(
      statusCode: 400,
      body: {
        'error': e.toString(),
      },
    );
  }
  return Response.json(
    body: {'board': responseBoard},
  );
}
