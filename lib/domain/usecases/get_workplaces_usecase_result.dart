part of 'get_workplaces_usecase.dart';

sealed class GetWorkplacesUsecaseResult {}

final class LoadingGetWorkplaces extends GetWorkplacesUsecaseResult {
  final bool value;

  LoadingGetWorkplaces({required this.value});
}

final class SuccessGetWorkplaces extends GetWorkplacesUsecaseResult {
  final List<Workplace> workplaces;

  SuccessGetWorkplaces({required this.workplaces});
}

final class ErrorGetWorkplaces extends GetWorkplacesUsecaseResult {}
