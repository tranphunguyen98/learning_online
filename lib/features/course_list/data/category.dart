import 'package:learning_online/features/course_list/data/course.dart';

/// id : "968e7e18-10c0-4742-9ec6-6f5c71c517f5"
/// title : "For studying abroad"
/// description : null
/// key : "ABROAD"
/// displayOrder : null
/// createdAt : "2021-09-05T13:06:10.836Z"
/// updatedAt : "2021-09-05T13:06:10.836Z"

class Category {
  Category({
    String? id,
    String? title,
    dynamic description,
    String? key,
    dynamic displayOrder,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _title = title;
    _description = description;
    _key = key;
    _displayOrder = displayOrder;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    courses = [];
  }

  Category.fromJson(dynamic json) {
    _id = json['id'];
    _title = json['title'];
    _description = json['description'];
    _key = json['key'];
    _displayOrder = json['displayOrder'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }

  String? _id;
  String? _title;
  dynamic _description;
  String? _key;
  dynamic _displayOrder;
  String? _createdAt;
  String? _updatedAt;
  List<Course>? courses;

  String? get id => _id;

  String? get title => _title;

  dynamic get description => _description;

  String? get key => _key;

  dynamic get displayOrder => _displayOrder;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['title'] = _title;
    map['description'] = _description;
    map['key'] = _key;
    map['displayOrder'] = _displayOrder;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }
}
