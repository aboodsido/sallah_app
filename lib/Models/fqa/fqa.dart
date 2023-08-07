import 'question.dart';

class Fqa {
  bool? status;
  int? code;
  String? message;
  List<Question>? questions;

  Fqa({this.status, this.code, this.message, this.questions});

  factory Fqa.fromJson(Map<String, dynamic> json) => Fqa(
        status: json['status'] as bool?,
        code: json['code'] as int?,
        message: json['message'] as String?,
        questions: (json['questions'] as List<dynamic>?)
            ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'code': code,
        'message': message,
        'questions': questions?.map((e) => e.toJson()).toList(),
      };
}
