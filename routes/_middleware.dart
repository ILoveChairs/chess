
import 'package:chess/middleware/middleware.dart';
import 'package:dart_frog/dart_frog.dart';

Handler middleware(Handler handler) {
  return handler
    .use(requestLogger())
    .use(cors)
    .use(filter);
}
