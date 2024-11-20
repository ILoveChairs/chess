
import 'package:dart_frog/dart_frog.dart';


/// 
Handler filter(Handler handler) {
  return (context) async {
    final request = context.request;
    if (request.method != HttpMethod.post) {
      return Response(statusCode: 405);
    }

    final response = await handler(context);
    return response;
  };
}
