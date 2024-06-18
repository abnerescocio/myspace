import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:myspace/domain/repositories/workplace_repository.dart';
import 'package:myspace/domain/models/workplace.dart';

final class WorkplaceRepositoryImpl implements WorkplaceRepository {
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<List<Workplace>> getWorkplaces() async {
    final querySnapshot = await firestore.collection('workspaces').get();
    return querySnapshot.docs
        .map((doc) => Workplace.fromMap(doc.data(), doc.id))
        .toList();
  }
}
