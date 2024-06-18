part of 'list_workplace_bloc.dart';

sealed class ListWorkplaceState {}

final class InitialListWorkplace extends ListWorkplaceState {}

final class LoadingListWorkplace extends ListWorkplaceState {}

final class SuccessListWorkplace extends ListWorkplaceState {
  final List<Workplace> workplaces;

  SuccessListWorkplace({required this.workplaces});
}

final class ErrorListWorkplace extends ListWorkplaceState {}
