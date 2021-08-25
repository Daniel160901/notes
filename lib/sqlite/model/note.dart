class Note {
  final String id;
  final String name;
  final String description;

  Note({required this.id, required this.name, required this.description});

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'description': this.description,
      'id': this.id,
    };
  }
}
