import 'dart:math';

class TeacherModel {
  final String id;
  final String userId;
  final double? star;
  final List<String> fields;
  final String name;
  final String nation;
  final String education;
  final String experience;
  final String hobby;
  final String career;
  final String description;
  final String avatar;
  final List<String> languages;
  final bool isFavorite;

  TeacherModel({
    required this.id,
    required this.star,
    required this.fields,
    required this.name,
    required this.description,
    required this.avatar,
    required this.isFavorite,
    required this.nation,
    required this.education,
    required this.experience,
    required this.hobby,
    required this.career,
    required this.languages,
    required this.userId,
  });

  TeacherModel copyWith({
    String? id,
    double? star,
    List<String>? fields,
    String? name,
    String? nation,
    String? education,
    String? experience,
    String? hobby,
    String? career,
    String? description,
    String? avatar,
    List<String>? languages,
    bool? isFavorite,
    String? userId,
  }) {
    return TeacherModel(
      id: id ?? this.id,
      star: star ?? this.star,
      fields: fields ?? this.fields,
      name: name ?? this.name,
      nation: nation ?? this.nation,
      education: education ?? this.education,
      experience: experience ?? this.experience,
      hobby: hobby ?? this.hobby,
      career: career ?? this.career,
      description: description ?? this.description,
      avatar: avatar ?? this.avatar,
      languages: languages ?? this.languages,
      isFavorite: isFavorite ?? this.isFavorite,
      userId: userId ?? this.userId,
    );
  }
}
