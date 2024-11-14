
class TestFailure implements Exception {
  /// Creates a Test exception with the provided [message].
  TestFailure([this.message]);

  /// Message describing the Test exception.
  final Object? message;

  @override
  String toString() {
    if (message != null) {
      return 'Test failed: ${Error.safeToString(message)}';
    }
    return 'Test failed';
  }
}


/// Throws TestFailure if an error is thrown.
void validTest(void Function() f, {String? msg}) {
  try {
    f();
  } catch (e) {
    throw TestFailure(msg);
  }
}


/// Throws TestFailure if the error is not thrown.
void invalidTest<E extends Error>(void Function() f, {String? msg}) {
  try {
    f();
    throw TestFailure(msg);
  } on E {
    // Do nothing
  } catch (e) {
    throw TestFailure(msg);
  }
}
