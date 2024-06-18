import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myspace/domain/models/workplace.dart';
import 'package:myspace/domain/usecases/get_workplaces_usecase.dart';

part 'list_workplace_state.dart';
part 'list_workplace_event.dart';

class ListWorkplaceBloc extends Bloc<ListWorkplaceEvent, ListWorkplaceState> {
  final GetWorkplacesUseCase _getWorkplacesUseCase;

  ListWorkplaceBloc(
    this._getWorkplacesUseCase,
  ) : super(InitialListWorkplace()) {
    on<LoadListWorkplace>((event, emit) async {
      await emit.forEach(
        _getWorkplacesUseCase(),
        onData: (data) {
          if (data is LoadingGetWorkplaces && data.value) {
            return LoadingListWorkplace();
          } else if (data is SuccessGetWorkplaces) {
            return SuccessListWorkplace(workplaces: data.workplaces);
          } else if (data is ErrorGetWorkplaces) {
            return ErrorListWorkplace();
          } else {
            return state;
          }
        },
        onError: (_, __) => ErrorListWorkplace(),
      );
    });
  }
}
