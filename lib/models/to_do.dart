class ToDo {
  int id;
  String value;
  String date;

  ToDo({
    required this.id,
    required this.value,
    required this.date,
  });

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'],
      value: map['title'],
      date: map['date'] ?? DateTime.now().toString(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': value,
      'date': date,
    };
  }
}
