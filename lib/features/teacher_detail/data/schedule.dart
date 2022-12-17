/// id : "8f018197-9dd4-4369-a590-8c6423154801"
/// tutorId : "4d54d3d7-d2a9-42e5-97a2-5ed38af5789a"
/// startTime : "17:00"
/// endTime : "17:25"
/// startTimestamp : 1671210000000
/// endTimestamp : 1671211500000
/// createdAt : "2022-12-15T06:17:31.385Z"
/// isBooked : true
/// scheduleDetails : [{"startPeriodTimestamp":1671210000000,"endPeriodTimestamp":1671211500000,"id":"91ce966c-0d4f-439e-a632-b2c58f003ccc","scheduleId":"8f018197-9dd4-4369-a590-8c6423154801","startPeriod":"17:00","endPeriod":"17:25","createdAt":"2022-12-15T06:17:31.389Z","updatedAt":"2022-12-15T06:17:31.389Z","bookingInfo":[{"createdAtTimeStamp":1671108423572,"updatedAtTimeStamp":1671108423657,"id":"66581f19-c529-48d0-8d9a-50d53a772675","isDeleted":false,"createdAt":"2022-12-15T12:47:03.572Z","scheduleDetailId":"91ce966c-0d4f-439e-a632-b2c58f003ccc","updatedAt":"2022-12-15T12:47:03.657Z","cancelReasonId":null,"userId":"296925c9-d08c-4392-8549-083da1fbc5ee"}],"isBooked":true}]

class Schedule {
  Schedule({
      String? id, 
      String? tutorId, 
      String? startTime, 
      String? endTime, 
      int? startTimestamp, 
      int? endTimestamp, 
      String? createdAt, 
      bool? isBooked, 
      List<ScheduleDetails>? scheduleDetails,}){
    _id = id;
    _tutorId = tutorId;
    _startTime = startTime;
    _endTime = endTime;
    _startTimestamp = startTimestamp;
    _endTimestamp = endTimestamp;
    _createdAt = createdAt;
    _isBooked = isBooked;
    _scheduleDetails = scheduleDetails;
}

  Schedule.fromJson(dynamic json) {
    _id = json['id'];
    _tutorId = json['tutorId'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _startTimestamp = json['startTimestamp'];
    _endTimestamp = json['endTimestamp'];
    _createdAt = json['createdAt'];
    _isBooked = json['isBooked'];
    if (json['scheduleDetails'] != null) {
      _scheduleDetails = [];
      json['scheduleDetails'].forEach((v) {
        _scheduleDetails?.add(ScheduleDetails.fromJson(v));
      });
    }
  }
  String? _id;
  String? _tutorId;
  String? _startTime;
  String? _endTime;
  int? _startTimestamp;
  int? _endTimestamp;
  String? _createdAt;
  bool? _isBooked;
  List<ScheduleDetails>? _scheduleDetails;

  String? get id => _id;
  String? get tutorId => _tutorId;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  int? get startTimestamp => _startTimestamp;
  int? get endTimestamp => _endTimestamp;
  String? get createdAt => _createdAt;
  bool? get isBooked => _isBooked;
  List<ScheduleDetails>? get scheduleDetails => _scheduleDetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['tutorId'] = _tutorId;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['startTimestamp'] = _startTimestamp;
    map['endTimestamp'] = _endTimestamp;
    map['createdAt'] = _createdAt;
    map['isBooked'] = _isBooked;
    if (_scheduleDetails != null) {
      map['scheduleDetails'] = _scheduleDetails?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// startPeriodTimestamp : 1671210000000
/// endPeriodTimestamp : 1671211500000
/// id : "91ce966c-0d4f-439e-a632-b2c58f003ccc"
/// scheduleId : "8f018197-9dd4-4369-a590-8c6423154801"
/// startPeriod : "17:00"
/// endPeriod : "17:25"
/// createdAt : "2022-12-15T06:17:31.389Z"
/// updatedAt : "2022-12-15T06:17:31.389Z"
/// bookingInfo : [{"createdAtTimeStamp":1671108423572,"updatedAtTimeStamp":1671108423657,"id":"66581f19-c529-48d0-8d9a-50d53a772675","isDeleted":false,"createdAt":"2022-12-15T12:47:03.572Z","scheduleDetailId":"91ce966c-0d4f-439e-a632-b2c58f003ccc","updatedAt":"2022-12-15T12:47:03.657Z","cancelReasonId":null,"userId":"296925c9-d08c-4392-8549-083da1fbc5ee"}]
/// isBooked : true

class ScheduleDetails {
  ScheduleDetails({
      int? startPeriodTimestamp, 
      int? endPeriodTimestamp, 
      String? id, 
      String? scheduleId, 
      String? startPeriod, 
      String? endPeriod, 
      String? createdAt, 
      String? updatedAt, 
      List<BookingInfo>? bookingInfo, 
      bool? isBooked,}){
    _startPeriodTimestamp = startPeriodTimestamp;
    _endPeriodTimestamp = endPeriodTimestamp;
    _id = id;
    _scheduleId = scheduleId;
    _startPeriod = startPeriod;
    _endPeriod = endPeriod;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _bookingInfo = bookingInfo;
    _isBooked = isBooked;
}

  ScheduleDetails.fromJson(dynamic json) {
    _startPeriodTimestamp = json['startPeriodTimestamp'];
    _endPeriodTimestamp = json['endPeriodTimestamp'];
    _id = json['id'];
    _scheduleId = json['scheduleId'];
    _startPeriod = json['startPeriod'];
    _endPeriod = json['endPeriod'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    if (json['bookingInfo'] != null) {
      _bookingInfo = [];
      json['bookingInfo'].forEach((v) {
        _bookingInfo?.add(BookingInfo.fromJson(v));
      });
    }
    _isBooked = json['isBooked'];
  }
  int? _startPeriodTimestamp;
  int? _endPeriodTimestamp;
  String? _id;
  String? _scheduleId;
  String? _startPeriod;
  String? _endPeriod;
  String? _createdAt;
  String? _updatedAt;
  List<BookingInfo>? _bookingInfo;
  bool? _isBooked;

  int? get startPeriodTimestamp => _startPeriodTimestamp;
  int? get endPeriodTimestamp => _endPeriodTimestamp;
  String? get id => _id;
  String? get scheduleId => _scheduleId;
  String? get startPeriod => _startPeriod;
  String? get endPeriod => _endPeriod;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  List<BookingInfo>? get bookingInfo => _bookingInfo;
  bool? get isBooked => _isBooked;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['startPeriodTimestamp'] = _startPeriodTimestamp;
    map['endPeriodTimestamp'] = _endPeriodTimestamp;
    map['id'] = _id;
    map['scheduleId'] = _scheduleId;
    map['startPeriod'] = _startPeriod;
    map['endPeriod'] = _endPeriod;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_bookingInfo != null) {
      map['bookingInfo'] = _bookingInfo?.map((v) => v.toJson()).toList();
    }
    map['isBooked'] = _isBooked;
    return map;
  }

}

/// createdAtTimeStamp : 1671108423572
/// updatedAtTimeStamp : 1671108423657
/// id : "66581f19-c529-48d0-8d9a-50d53a772675"
/// isDeleted : false
/// createdAt : "2022-12-15T12:47:03.572Z"
/// scheduleDetailId : "91ce966c-0d4f-439e-a632-b2c58f003ccc"
/// updatedAt : "2022-12-15T12:47:03.657Z"
/// cancelReasonId : null
/// userId : "296925c9-d08c-4392-8549-083da1fbc5ee"

class BookingInfo {
  BookingInfo({
      int? createdAtTimeStamp, 
      int? updatedAtTimeStamp, 
      String? id, 
      bool? isDeleted, 
      String? createdAt, 
      String? scheduleDetailId, 
      String? updatedAt, 
      String? cancelReasonId,
      String? userId,}){
    _createdAtTimeStamp = createdAtTimeStamp;
    _updatedAtTimeStamp = updatedAtTimeStamp;
    _id = id;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _scheduleDetailId = scheduleDetailId;
    _updatedAt = updatedAt;
    _cancelReasonId = cancelReasonId;
    _userId = userId;
}

  BookingInfo.fromJson(dynamic json) {
    _createdAtTimeStamp = json['createdAtTimeStamp'];
    _updatedAtTimeStamp = json['updatedAtTimeStamp'];
    _id = json['id'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _scheduleDetailId = json['scheduleDetailId'];
    _updatedAt = json['updatedAt'];
    _cancelReasonId = json['cancelReasonId'];
    _userId = json['userId'];
  }
  int? _createdAtTimeStamp;
  int? _updatedAtTimeStamp;
  String? _id;
  bool? _isDeleted;
  String? _createdAt;
  String? _scheduleDetailId;
  String? _updatedAt;
  String? _cancelReasonId;
  String? _userId;

  int? get createdAtTimeStamp => _createdAtTimeStamp;
  int? get updatedAtTimeStamp => _updatedAtTimeStamp;
  String? get id => _id;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get scheduleDetailId => _scheduleDetailId;
  String? get updatedAt => _updatedAt;
  String? get cancelReasonId => _cancelReasonId;
  String? get userId => _userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAtTimeStamp'] = _createdAtTimeStamp;
    map['updatedAtTimeStamp'] = _updatedAtTimeStamp;
    map['id'] = _id;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['scheduleDetailId'] = _scheduleDetailId;
    map['updatedAt'] = _updatedAt;
    map['cancelReasonId'] = _cancelReasonId;
    map['userId'] = _userId;
    return map;
  }

}