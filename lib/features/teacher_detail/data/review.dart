/// id : "bc8bf0ce-d8f1-48c2-9b7e-5ee4cb51a53e"
/// bookingId : "e776a9b9-0280-4aba-95a6-fcbfc83a00e1"
/// firstId : "f569c202-7bbf-4620-af77-ecc1419a6b28"
/// secondId : "4d54d3d7-d2a9-42e5-97a2-5ed38af5789a"
/// rating : 4
/// content : "qua tuyet voi"
/// createdAt : "2022-12-15T14:45:13.464Z"
/// updatedAt : "2022-12-15T14:45:13.464Z"
/// firstInfo : {"name":"Ronaldo","avatar":"https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1671186538055.png"}

class Review {
  Review({
      String? id, 
      String? bookingId, 
      String? firstId, 
      String? secondId, 
      int? rating, 
      String? content, 
      String? createdAt, 
      String? updatedAt, 
      FirstInfo? firstInfo,}){
    _id = id;
    _bookingId = bookingId;
    _firstId = firstId;
    _secondId = secondId;
    _rating = rating;
    _content = content;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _firstInfo = firstInfo;
}

  Review.fromJson(dynamic json) {
    _id = json['id'];
    _bookingId = json['bookingId'];
    _firstId = json['firstId'];
    _secondId = json['secondId'];
    _rating = json['rating'];
    _content = json['content'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _firstInfo = json['firstInfo'] != null ? FirstInfo.fromJson(json['firstInfo']) : null;
  }
  String? _id;
  String? _bookingId;
  String? _firstId;
  String? _secondId;
  int? _rating;
  String? _content;
  String? _createdAt;
  String? _updatedAt;
  FirstInfo? _firstInfo;

  String? get id => _id;
  String? get bookingId => _bookingId;
  String? get firstId => _firstId;
  String? get secondId => _secondId;
  int? get rating => _rating;
  String? get content => _content;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  FirstInfo? get firstInfo => _firstInfo;

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
    if (_firstInfo != null) {
      map['firstInfo'] = _firstInfo?.toJson();
    }
    return map;
  }

}

/// name : "Ronaldo"
/// avatar : "https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1671186538055.png"

class FirstInfo {
  FirstInfo({
      String? name, 
      String? avatar,}){
    _name = name;
    _avatar = avatar;
}

  FirstInfo.fromJson(dynamic json) {
    _name = json['name'];
    _avatar = json['avatar'];
  }
  String? _name;
  String? _avatar;

  String? get name => _name;
  String? get avatar => _avatar;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['avatar'] = _avatar;
    return map;
  }

}