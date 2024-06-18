import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:myspace/domain/repositories/error_repository.dart';

final class ErrorRepositoryImpl implements ErrorRepository {
  @override
  Future<void> onError(
    Object e,
    StackTrace stacktrace, {
    String from = "",
  }) async {
    final reason = "from $from";
    await FirebaseCrashlytics.instance.recordError(
      e,
      stacktrace,
      reason: reason,
    );
  }
}
