abstract class ErrorRepository {
  Future<void> onError(
    Object e,
    StackTrace stacktrace, {
    String from,
  });
}
