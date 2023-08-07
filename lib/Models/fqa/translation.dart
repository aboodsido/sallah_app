class Translation {
  int? id;
  int? questionId;
  String? locale;
  String? question;
  String? answer;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  Translation({
    this.id,
    this.questionId,
    this.locale,
    this.question,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  factory Translation.fromJson(Map<String, dynamic> json) => Translation(
        id: json['id'] as int?,
        questionId: json['question_id'] as int?,
        locale: json['locale'] as String?,
        question: json['question'] as String?,
        answer: json['answer'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        deletedAt: json['deleted_at'] as dynamic,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'question_id': questionId,
        'locale': locale,
        'question': question,
        'answer': answer,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'deleted_at': deletedAt,
      };
}
