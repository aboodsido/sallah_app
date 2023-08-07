import 'translation.dart';

class Question {
  int? id;
  String? status;
  DateTime? createdAt;
  String? question;
  String? answer;
  List<Translation>? translations;

  Question({
    this.id,
    this.status,
    this.createdAt,
    this.question,
    this.answer,
    this.translations,
  });

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json['id'] as int?,
        status: json['status'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        question: json['question'] as String?,
        answer: json['answer'] as String?,
        translations: (json['translations'] as List<dynamic>?)
            ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'created_at': createdAt?.toIso8601String(),
        'question': question,
        'answer': answer,
        'translations': translations?.map((e) => e.toJson()).toList(),
      };
}
