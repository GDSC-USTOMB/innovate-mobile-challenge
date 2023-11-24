class Note {
  final String? id;
  final String title;
  final String content;

  Note({
    this.id,
    required this.title,
    required this.content,
  });

  Note copyWith({
    String? id,
    String? title,
    String? content,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
    );
  }

  Map<String, String> toMap() {
    assert(id != null);
    return {
      'id': id!,
      'title': title,
      'content': content,
    };
  }

  static Note fromMap(Map<String, Object?> map) {
    return Note(
      id: map['id'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
    );
  }
}
