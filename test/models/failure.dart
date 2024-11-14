
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
void validTest(void Function() f, {String? name}) {
  try {
    f();
  } catch (e) {
    throw TestFailure('$name: Valid test case threw "$e" error');
  }
}


/// Throws TestFailure if the error is not thrown.
void invalidTest<E extends Error>(void Function() f, {String? name}) {
  try {
    f();
    throw TestFailure('$name: Invalid test case did not threw expected error');
  } on E {
    // Do nothing
  } catch (e) {
    throw TestFailure('$name: Uncatched "$e" error');
  }
}
