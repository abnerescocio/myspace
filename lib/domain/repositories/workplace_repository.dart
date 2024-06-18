import 'package:myspace/domain/models/workplace.dart';

abstract class WorkplaceRepository {
  Future<List<Workplace>> getWorkplaces();
}
