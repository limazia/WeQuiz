import 'dart:convert';

import 'package:WeQuiz/shared/models/question_model.dart';

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionAnswered;

  QuizModel({
    required this.title,
    required this.questions,
    this.questionAnswered = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionAnswered,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
        title: map['title'],
        questions: List<QuestionModel>.from(
            map['questions']?.map((x) => QuestionModel.fromMap(x))),
        questionAnswered: map['questionAnswered']);
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
