
import 'dart:io';
import 'package:dart_frog/dart_frog.dart';


Future<void> init(InternetAddress ip, int port) async {
}


Future<HttpServer> run(Handler handler, InternetAddress ip, int port) {
  return serve(handler, ip, port, poweredByHeader: null);
}