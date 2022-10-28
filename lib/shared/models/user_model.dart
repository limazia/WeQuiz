import 'dart:convert';

class UserModel {
  final int score;

  UserModel({
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
