import 'dart:convert';

class UserModel {
  final String name;
  final String photo;
  final int score;

  UserModel({
    required this.name,
    required this.photo,
    this.score = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'photo': photo,
      'score': score,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      photo: map['photo'],
      score: map['score'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
