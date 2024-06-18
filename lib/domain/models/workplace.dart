final class Workplace {
  final String id;
  final String name;
  final String location;
  final String role;
  final String imageUrl;
  final DateTime startDate;
  final DateTime endDate;
  final String description;

  Workplace({
    required this.id,
    required this.name,
    required this.location,
    required this.role,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'location': location,
      'role': role,
      'imageUrl': imageUrl,
      'startDate': startDate.toIso8601String(),
      'endDate': endDate.toIso8601String(),
      'description': description,
    };
  }

  factory Workplace.fromMap(Map<String, dynamic> map, String documentId) {
    return Workplace(
      id: documentId,
      name: map['name'] ?? '',
      location: map['location'] ?? '',
      role: map['role'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      startDate:
          DateTime.parse(map['startDate'] ?? DateTime.now().toIso8601String()),
      endDate:
          DateTime.parse(map['endDate'] ?? DateTime.now().toIso8601String()),
      description: map['description'] ?? '',
    );
  }
}
