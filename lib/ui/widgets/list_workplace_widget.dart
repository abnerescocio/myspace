import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myspace/data/analytics_repository_impl.dart';
import 'package:myspace/data/error_repository_impl.dart';
import 'package:myspace/data/workplace_repository_impl.dart';
import 'package:myspace/domain/usecases/get_workplaces_usecase.dart';
import 'package:myspace/ui/widgets/bloc/list_workplace_bloc.dart'; // Assumindo que você tenha um modelo chamado Workplace

class ListWorkplaceWidget extends StatelessWidget {
  const ListWorkplaceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ListWorkplaceBloc(
        GetWorkplacesUseCase(
          WorkplaceRepositoryImpl(),
          AnalyticsRepositoryImpl(),
          ErrorRepositoryImpl(),
        ),
      )..add(LoadListWorkplace()),
      child: BlocBuilder<ListWorkplaceBloc, ListWorkplaceState>(
        builder: (context, state) {
          if (state is LoadListWorkplace) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is SuccessListWorkplace) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 600 ? 2 : 1,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                childAspectRatio: 2, // Ajuste conforme necessário
              ),
              itemCount: state.workplaces.length,
              itemBuilder: (context, index) {
                final workplace = state.workplaces[index];
                return Card(
                  child: Column(
                    children: [
                      Image.network(workplace.imageUrl),
                      Text(workplace.name),
                      Text(workplace.description),
                    ],
                  ),
                );
              },
            );
          } else if (state is ErrorListWorkplace) {
            return const Center(child: Text('Failed to load workplaces'));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
