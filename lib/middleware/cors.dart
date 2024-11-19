
import 'package:dart_frog/dart_frog.dart';
import 'package:shelf_cors_headers/shelf_cors_headers.dart' as shelf;


/// 
final cors = fromShelfMiddleware(
  shelf.corsHeaders(
    headers: {
      shelf.ACCESS_CONTROL_ALLOW_METHODS: 'POST',
      shelf.ACCESS_CONTROL_ALLOW_ORIGIN: '*',
    },
  ),
);
