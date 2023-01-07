/// bookingId : "05a23bda-85b3-4ecd-a1e4-fb4d8b7e18cf"
/// lessonStatusId : 1
/// book : ""
/// unit : ""
/// lesson : ""
/// page : null
/// lessonProgress : ""
/// behaviorRating : 5
/// behaviorComment : ""
/// listeningRating : 4
/// listeningComment : ""
/// speakingRating : 5
/// speakingComment : ""
/// vocabularyRating : 4
/// vocabularyComment : ""
/// homeworkComment : "home w"
/// overallComment : "overall ne"
/// lessonStatus : {"id":1,"status":"Completed","createdAt":"2022-09-18T09:32:47.934Z","updatedAt":"2022-09-18T09:32:47.934Z"}

class ClassReview {
  ClassReview({
      String? bookingId, 
      int? lessonStatusId, 
      String? book, 
      String? unit, 
      String? lesson, 
      dynamic page, 
      String? lessonProgress, 
      int? behaviorRating, 
      String? behaviorComment, 
      int? listeningRating, 
      String? listeningComment, 
      int? speakingRating, 
      String? speakingComment, 
      int? vocabularyRating, 
      String? vocabularyComment, 
      String? homeworkComment, 
      String? overallComment, 
      LessonStatus? lessonStatus,}){
    _bookingId = bookingId;
    _lessonStatusId = lessonStatusId;
    _book = book;
    _unit = unit;
    _lesson = lesson;
    _page = page;
    _lessonProgress = lessonProgress;
    _behaviorRating = behaviorRating;
    _behaviorComment = behaviorComment;
    _listeningRating = listeningRating;
    _listeningComment = listeningComment;
    _speakingRating = speakingRating;
    _speakingComment = speakingComment;
    _vocabularyRating = vocabularyRating;
    _vocabularyComment = vocabularyComment;
    _homeworkComment = homeworkComment;
    _overallComment = overallComment;
    _lessonStatus = lessonStatus;
}

  ClassReview.fromJson(dynamic json) {
    _bookingId = json['bookingId'];
    _lessonStatusId = json['lessonStatusId'];
    _book = json['book'];
    _unit = json['unit'];
    _lesson = json['lesson'];
    _page = json['page'];
    _lessonProgress = json['lessonProgress'];
    _behaviorRating = json['behaviorRating'];
    _behaviorComment = json['behaviorComment'];
    _listeningRating = json['listeningRating'];
    _listeningComment = json['listeningComment'];
    _speakingRating = json['speakingRating'];
    _speakingComment = json['speakingComment'];
    _vocabularyRating = json['vocabularyRating'];
    _vocabularyComment = json['vocabularyComment'];
    _homeworkComment = json['homeworkComment'];
    _overallComment = json['overallComment'];
    _lessonStatus = json['lessonStatus'] != null ? LessonStatus.fromJson(json['lessonStatus']) : null;
  }
  String? _bookingId;
  int? _lessonStatusId;
  String? _book;
  String? _unit;
  String? _lesson;
  dynamic _page;
  String? _lessonProgress;
  int? _behaviorRating;
  String? _behaviorComment;
  int? _listeningRating;
  String? _listeningComment;
  int? _speakingRating;
  String? _speakingComment;
  int? _vocabularyRating;
  String? _vocabularyComment;
  String? _homeworkComment;
  String? _overallComment;
  LessonStatus? _lessonStatus;

  String? get bookingId => _bookingId;
  int? get lessonStatusId => _lessonStatusId;
  String? get book => _book;
  String? get unit => _unit;
  String? get lesson => _lesson;
  dynamic get page => _page;
  String? get lessonProgress => _lessonProgress;
  int? get behaviorRating => _behaviorRating;
  String? get behaviorComment => _behaviorComment;
  int? get listeningRating => _listeningRating;
  String? get listeningComment => _listeningComment;
  int? get speakingRating => _speakingRating;
  String? get speakingComment => _speakingComment;
  int? get vocabularyRating => _vocabularyRating;
  String? get vocabularyComment => _vocabularyComment;
  String? get homeworkComment => _homeworkComment;
  String? get overallComment => _overallComment;
  LessonStatus? get lessonStatus => _lessonStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bookingId'] = _bookingId;
    map['lessonStatusId'] = _lessonStatusId;
    map['book'] = _book;
    map['unit'] = _unit;
    map['lesson'] = _lesson;
    map['page'] = _page;
    map['lessonProgress'] = _lessonProgress;
    map['behaviorRating'] = _behaviorRating;
    map['behaviorComment'] = _behaviorComment;
    map['listeningRating'] = _listeningRating;
    map['listeningComment'] = _listeningComment;
    map['speakingRating'] = _speakingRating;
    map['speakingComment'] = _speakingComment;
    map['vocabularyRating'] = _vocabularyRating;
    map['vocabularyComment'] = _vocabularyComment;
    map['homeworkComment'] = _homeworkComment;
    map['overallComment'] = _overallComment;
    if (_lessonStatus != null) {
      map['lessonStatus'] = _lessonStatus?.toJson();
    }
    return map;
  }

}

/// id : 1
/// status : "Completed"
/// createdAt : "2022-09-18T09:32:47.934Z"
/// updatedAt : "2022-09-18T09:32:47.934Z"

class LessonStatus {
  LessonStatus({
      int? id, 
      String? status, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _status = status;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  LessonStatus.fromJson(dynamic json) {
    _id = json['id'];
    _status = json['status'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
  }
  int? _id;
  String? _status;
  String? _createdAt;
  String? _updatedAt;

  int? get id => _id;
  String? get status => _status;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['status'] = _status;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    return map;
  }

}