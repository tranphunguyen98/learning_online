/// id : "fb116bab-06c3-4694-82a1-4706ecbc6430"
/// bookingId : "caa1414d-0e73-44fe-9dc9-c5db7f1a12a4"
/// firstId : "f569c202-7bbf-4620-af77-ecc1419a6b28"
/// secondId : "f569c202-7bbf-4620-af77-ecc1419a6b28"
/// rating : 4
/// content : "abc"
/// createdAt : "2023-01-07T03:26:39.513Z"
/// updatedAt : "2023-01-07T03:26:39.513Z"

class Feedback {
  Feedback({
      String? id, 
      String? bookingId, 
      String? firstId, 
      String? secondId, 
      int? rating, 
      String? content, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _bookingId = bookingId;
    _firstId = firstId;
    _secondId = secondId;
    _rating = rating;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  Feedback.fromJson(dynamic json) {
    final ratingData = json['rating'];
    _id = json['id'];
    _bookingId = json['bookingId'];
    _firstId = json['firstId'];
    _secondId = json['secondId'];
    _rating = ratingData is double ? ratingData.toInt() : ratingData;
    _content = json['content'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  String? _id;
  String? _bookingId;
  String? _firstId;
  String? _secondId;
  int? _rating;
  String? _content;
  String? _createdAt;
  String? _updatedAt;

  String? get id => _id;
  String? get bookingId => _bookingId;
  String? get firstId => _firstId;
  String? get secondId => _secondId;
  int? get rating => _rating;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['bookingId'] = _bookingId;
    map['firstId'] = _firstId;
    map['secondId'] = _secondId;
    map['rating'] = _rating;
    map['content'] = _content;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}