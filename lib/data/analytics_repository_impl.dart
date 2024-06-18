import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:myspace/domain/repositories/analytics_repository.dart';

final class AnalyticsRepositoryImpl implements AnalyticsRepository {
  @override
  Future<void> onEvent(String name) async {
    await FirebaseAnalytics.instance.logEvent(name: name);
  }
}
