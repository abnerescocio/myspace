import 'package:myspace/domain/models/workplace.dart';
import 'package:myspace/domain/repositories/analytics_repository.dart';
import 'package:myspace/domain/repositories/error_repository.dart';
import 'package:myspace/domain/repositories/workplace_repository.dart';

part 'get_workplaces_usecase_result.dart';

final class GetWorkplacesUseCase {
  static const String name = "get_workplaces";

  final WorkplaceRepository _workplaceRepository;
  final AnalyticsRepository _analyticsRepository;
  final ErrorRepository _errorRepository;

  GetWorkplacesUseCase(
    this._workplaceRepository,
    this._analyticsRepository,
    this._errorRepository,
  );

  Stream<GetWorkplacesUsecaseResult> call() async* {
    try {
      yield LoadingGetWorkplaces(value: true);
      await _analyticsRepository.onEvent(name);

      final workplaces = await _workplaceRepository.getWorkplaces();
      yield SuccessGetWorkplaces(workplaces: workplaces);
    } catch (e, stacktrace) {
      await _errorRepository.onError(e, stacktrace, from: name);
      yield ErrorGetWorkplaces();
    } finally {
      yield LoadingGetWorkplaces(value: false);
    }
  }
}
