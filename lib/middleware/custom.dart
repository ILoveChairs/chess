
import 'package:dart_frog/dart_frog.dart';


/// 
Handler custom(Handler handler) {
  return (context) async {


    final response = await handler(context);
    return response;
  };
}
