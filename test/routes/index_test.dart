import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import '../../routes/index.dart' as route;

class _MockRequestContext extends Mock implements RequestContext {
  @override
  Request get request => Request(HttpMethod.post.value, request.uri);
}

void main() async {
  group('POST /', () async {
    test('responds with a 200.', () async {
      final context = _MockRequestContext();
      final response = await route.onRequest(context);
      final statusCode = response.statusCode;
      expect(statusCode, equals(HttpStatus.ok));
    });
  });
}
