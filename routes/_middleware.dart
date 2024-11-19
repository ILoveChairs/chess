
import 'package:chess/middleware/middleware.dart';
import 'package:dart_frog/dart_frog.dart';

Future<Handler> middleware(Handler handler) async {
  return handler
    .use(requestLogger())
    .use(cors);
}
