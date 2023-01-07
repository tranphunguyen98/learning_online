import 'package:learning_online/features/history/data/class_review.dart';
import 'package:learning_online/features/history/data/feedback.dart';

import '../../schedule/data/history_schedule.dart';

class History {
  History({
      String? message, 
      Data? data,}){
    _message = message;
    _data = data;
}

  History.fromJson(dynamic json) {
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  String? _message;
  Data? _data;

  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      int? count, 
      List<MyHistory>? rows,}){
    _count = count;
    _rows = rows;
}

  Data.fromJson(dynamic json) {
    _count = json['count'];
    if (json['rows'] != null) {
      _rows = [];
      json['rows'].forEach((v) {
        _rows?.add(MyHistory.fromJson(v));
      });
    }
  }
  int? _count;
  List<MyHistory>? _rows;

  int? get count => _count;
  List<MyHistory>? get rows => _rows;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_rows != null) {
      map['rows'] = _rows?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// createdAtTimeStamp : 1673043995562
/// updatedAtTimeStamp : 1673043995632
/// id : "498dfd39-0ecc-489f-a8ef-5a7848fba1b5"
/// userId : "f569c202-7bbf-4620-af77-ecc1419a6b28"
/// scheduleDetailId : "606b1f5f-83f4-417a-bd8f-91746d50dcfb"
/// tutorMeetingLink : "/call/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250ZXh0Ijp7InVzZXIiOnsiZW1haWwiOiJ0ZWFjaGVyQGxldHR1dG9yLmNvbSIsIm5hbWUiOiJLZWVnYW4ifX0sInJvb20iOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgtNGQ1NGQzZDctZDJhOS00MmU1LTk3YTItNWVkMzhhZjU3ODlhIiwicm9vbU5hbWUiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgtNGQ1NGQzZDctZDJhOS00MmU1LTk3YTItNWVkMzhhZjU3ODlhIiwidXNlckNhbGwiOnsiaWQiOiJmNTY5YzIwMi03YmJmLTQ2MjAtYWY3Ny1lY2MxNDE5YTZiMjgiLCJlbWFpbCI6InN0dWRlbnRAbGV0dHV0b3IuY29tIiwibmFtZSI6IlN0dWRlbnRBIiwiYXZhdGFyIjoiaHR0cHM6Ly9zYW5kYm94LmFwaS5sZXR0dXRvci5jb20vYXZhdGFyL2Y1NjljMjAyLTdiYmYtNDYyMC1hZjc3LWVjYzE0MTlhNmIyOGF2YXRhcjE2NzMwMDk0Mjk4MjEucG5nIiwiY291bnRyeSI6IlZOIiwicGhvbmUiOiI4NDI0OTk5OTY1MDgiLCJsYW5ndWFnZSI6IkFsYmFuaWFuIiwiYmlydGhkYXkiOiIyMDIzLTAxLTAzIiwiaXNBY3RpdmF0ZWQiOnRydWUsInJlcXVpcmVOb3RlIjpudWxsLCJsZXZlbCI6IkhJR0hFUl9CRUdJTk5FUiIsImlzUGhvbmVBY3RpdmF0ZWQiOnRydWUsInRpbWV6b25lIjo3LCJzdHVkeVNjaGVkdWxlIjoibm8gdGVzc1xuIiwiY2FuU2VuZE1lc3NhZ2UiOmZhbHNlfSwidXNlckJlQ2FsbGVkIjp7ImlkIjoiNGQ1NGQzZDctZDJhOS00MmU1LTk3YTItNWVkMzhhZjU3ODlhIiwiZW1haWwiOiJ0ZWFjaGVyQGxldHR1dG9yLmNvbSIsIm5hbWUiOiJLZWVnYW4iLCJhdmF0YXIiOiJodHRwczovL2FwaS5hcHAubGV0dHV0b3IuY29tL2F2YXRhci80ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWFhdmF0YXIxNjI3OTEzMDE1ODUwLjAwIiwiY291bnRyeSI6IlZOIiwicGhvbmUiOiI4NDM1NjAzMDg3NiIsImxhbmd1YWdlIjoiVWtyYWluaWFuIiwiYmlydGhkYXkiOiIxOTk5LTA2LTA3IiwiaXNBY3RpdmF0ZWQiOnRydWUsInR1dG9ySW5mbyI6eyJpZCI6IjZjYTVjMDkyLTc2ZWEtNGU3Mi05YzZlLTA1ZTIyMzlhYTMzYiIsInVzZXJJZCI6IjRkNTRkM2Q3LWQyYTktNDJlNS05N2EyLTVlZDM4YWY1Nzg5YSIsInZpZGVvIjoiaHR0cHM6Ly9hcGkuYXBwLmxldHR1dG9yLmNvbS92aWRlby80ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWF2aWRlbzE2Mjc5MTMwMTU4NzEubXA0IiwiYmlvIjoiSSBhbSBwYXNzaW9uYXRlIGFib3V0IHJ1bm5pbmcgYW5kIGZpdG5lc3MsIEkgb2Z0ZW4gY29tcGV0ZSBpbiB0cmFpbC9tb3VudGFpbiBydW5uaW5nIGV2ZW50cyBhbmQgSSBsb3ZlIHB1c2hpbmcgbXlzZWxmLiBJIGFtIHRyYWluaW5nIHRvIG9uZSBkYXkgdGFrZSBwYXJ0IGluIHVsdHJhLWVuZHVyYW5jZSBldmVudHMuIEkgYWxzbyBlbmpveSB3YXRjaGluZyBydWdieSBvbiB0aGUgd2Vla2VuZHMsIHJlYWRpbmcgYW5kIHdhdGNoaW5nIHBvZGNhc3RzIG9uIFlvdXR1YmUuIE15IG1vc3QgbWVtb3JhYmxlIGxpZmUgZXhwZXJpZW5jZSB3b3VsZCBiZSBsaXZpbmcgaW4gYW5kIHRyYXZlbGluZyBhcm91bmQgU291dGhlYXN0IEFzaWEuIiwiZWR1Y2F0aW9uIjoiQkEiLCJleHBlcmllbmNlIjoiSSBoYXZlIG1vcmUgdGhhbiAxMCB5ZWFycyBvZiB0ZWFjaGluZyBlbmdsaXNoIGV4cGVyaWVuY2UiLCJwcm9mZXNzaW9uIjoiRW5nbGlzaCB0ZWFjaGVyIiwiYWNjZW50IjpudWxsLCJ0YXJnZXRTdHVkZW50IjoiQWR2YW5jZWQiLCJpbnRlcmVzdHMiOiIgSSBsb3ZlZCB0aGUgd2VhdGhlciwgdGhlIHNjZW5lcnkgYW5kIHRoZSBsYWlkLWJhY2sgbGlmZXN0eWxlIG9mIHRoZSBsb2NhbHMuIiwibGFuZ3VhZ2VzIjoiZW4iLCJzcGVjaWFsdGllcyI6ImJ1c2luZXNzLWVuZ2xpc2gsY29udmVyc2F0aW9uYWwtZW5nbGlzaCxlbmdsaXNoLWZvci1raWRzLGllbHRzLHRvZWljIiwicmVzdW1lIjpudWxsLCJyYXRpbmciOjQuMTg0MjEwNTI2MzE1Nzg5LCJpc0FjdGl2YXRlZCI6dHJ1ZSwiaXNOYXRpdmUiOm51bGwsImNyZWF0ZWRBdCI6IjIwMjEtMDgtMDJUMTQ6MDM6MzYuMzIwWiIsInVwZGF0ZWRBdCI6IjIwMjMtMDEtMDZUMTg6NTY6NDYuNTQxWiJ9LCJyZXF1aXJlTm90ZSI6bnVsbCwibGV2ZWwiOiJVUFBFUl9JTlRFUk1FRElBVEUiLCJpc1Bob25lQWN0aXZhdGVkIjpudWxsLCJ0aW1lem9uZSI6Nywic3R1ZHlTY2hlZHVsZSI6bnVsbCwiY2FuU2VuZE1lc3NhZ2UiOmZhbHNlfSwiaXNUdXRvciI6dHJ1ZSwic3RhcnRUaW1lIjoxNjczMDUzMjAwMDAwLCJlbmRTZXNzaW9uIjoxNjczMDU0NzAwMDAwLCJ0aW1lSW5Sb29tIjoxODAwLCJib29raW5nSWQiOiI0OThkZmQzOS0wZWNjLTQ4OWYtYThlZi01YTc4NDhmYmExYjUiLCJpYXQiOjE2NzMwNDM5OTUsImV4cCI6MTY3MzA2OTA5OSwiYXVkIjoibGl2ZXR1dG9yIiwiaXNzIjoibGl2ZXR1dG9yIiwic3ViIjoiaHR0cHM6Ly9tZWV0LnR1dG9yaW5nLmxldHN0dWR5LmlvIn0.UNG2FcqQtt3prg9c-agrhiVTO2MpDgaStf32pZiGM3w"
/// studentMeetingLink : "/call/?token=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb250ZXh0Ijp7InVzZXIiOnsiZW1haWwiOiJzdHVkZW50QGxldHR1dG9yLmNvbSIsIm5hbWUiOiJTdHVkZW50QSJ9fSwicm9vbSI6ImY1NjljMjAyLTdiYmYtNDYyMC1hZjc3LWVjYzE0MTlhNmIyOC00ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWEiLCJyb29tTmFtZSI6ImY1NjljMjAyLTdiYmYtNDYyMC1hZjc3LWVjYzE0MTlhNmIyOC00ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWEiLCJ1c2VyQ2FsbCI6eyJpZCI6ImY1NjljMjAyLTdiYmYtNDYyMC1hZjc3LWVjYzE0MTlhNmIyOCIsImVtYWlsIjoic3R1ZGVudEBsZXR0dXRvci5jb20iLCJuYW1lIjoiU3R1ZGVudEEiLCJhdmF0YXIiOiJodHRwczovL3NhbmRib3guYXBpLmxldHR1dG9yLmNvbS9hdmF0YXIvZjU2OWMyMDItN2JiZi00NjIwLWFmNzctZWNjMTQxOWE2YjI4YXZhdGFyMTY3MzAwOTQyOTgyMS5wbmciLCJjb3VudHJ5IjoiVk4iLCJwaG9uZSI6Ijg0MjQ5OTk5NjUwOCIsImxhbmd1YWdlIjoiQWxiYW5pYW4iLCJiaXJ0aGRheSI6IjIwMjMtMDEtMDMiLCJpc0FjdGl2YXRlZCI6dHJ1ZSwicmVxdWlyZU5vdGUiOm51bGwsImxldmVsIjoiSElHSEVSX0JFR0lOTkVSIiwiaXNQaG9uZUFjdGl2YXRlZCI6dHJ1ZSwidGltZXpvbmUiOjcsInN0dWR5U2NoZWR1bGUiOiJubyB0ZXNzXG4iLCJjYW5TZW5kTWVzc2FnZSI6ZmFsc2V9LCJ1c2VyQmVDYWxsZWQiOnsiaWQiOiI0ZDU0ZDNkNy1kMmE5LTQyZTUtOTdhMi01ZWQzOGFmNTc4OWEiLCJlbWFpbCI6InRlYWNoZXJAbGV0dHV0b3IuY29tIiwibmFtZSI6IktlZWdhbiIsImF2YXRhciI6Imh0dHBzOi8vYXBpLmFwcC5sZXR0dXRvci5jb20vYXZhdGFyLzRkNTRkM2Q3LWQyYTktNDJlNS05N2EyLTVlZDM4YWY1Nzg5YWF2YXRhcjE2Mjc5MTMwMTU4NTAuMDAiLCJjb3VudHJ5IjoiVk4iLCJwaG9uZSI6Ijg0MzU2MDMwODc2IiwibGFuZ3VhZ2UiOiJVa3JhaW5pYW4iLCJiaXJ0aGRheSI6IjE5OTktMDYtMDciLCJpc0FjdGl2YXRlZCI6dHJ1ZSwidHV0b3JJbmZvIjp7ImlkIjoiNmNhNWMwOTItNzZlYS00ZTcyLTljNmUtMDVlMjIzOWFhMzNiIiwidXNlcklkIjoiNGQ1NGQzZDctZDJhOS00MmU1LTk3YTItNWVkMzhhZjU3ODlhIiwidmlkZW8iOiJodHRwczovL2FwaS5hcHAubGV0dHV0b3IuY29tL3ZpZGVvLzRkNTRkM2Q3LWQyYTktNDJlNS05N2EyLTVlZDM4YWY1Nzg5YXZpZGVvMTYyNzkxMzAxNTg3MS5tcDQiLCJiaW8iOiJJIGFtIHBhc3Npb25hdGUgYWJvdXQgcnVubmluZyBhbmQgZml0bmVzcywgSSBvZnRlbiBjb21wZXRlIGluIHRyYWlsL21vdW50YWluIHJ1bm5pbmcgZXZlbnRzIGFuZCBJIGxvdmUgcHVzaGluZyBteXNlbGYuIEkgYW0gdHJhaW5pbmcgdG8gb25lIGRheSB0YWtlIHBhcnQgaW4gdWx0cmEtZW5kdXJhbmNlIGV2ZW50cy4gSSBhbHNvIGVuam95IHdhdGNoaW5nIHJ1Z2J5IG9uIHRoZSB3ZWVrZW5kcywgcmVhZGluZyBhbmQgd2F0Y2hpbmcgcG9kY2FzdHMgb24gWW91dHViZS4gTXkgbW9zdCBtZW1vcmFibGUgbGlmZSBleHBlcmllbmNlIHdvdWxkIGJlIGxpdmluZyBpbiBhbmQgdHJhdmVsaW5nIGFyb3VuZCBTb3V0aGVhc3QgQXNpYS4iLCJlZHVjYXRpb24iOiJCQSIsImV4cGVyaWVuY2UiOiJJIGhhdmUgbW9yZSB0aGFuIDEwIHllYXJzIG9mIHRlYWNoaW5nIGVuZ2xpc2ggZXhwZXJpZW5jZSIsInByb2Zlc3Npb24iOiJFbmdsaXNoIHRlYWNoZXIiLCJhY2NlbnQiOm51bGwsInRhcmdldFN0dWRlbnQiOiJBZHZhbmNlZCIsImludGVyZXN0cyI6IiBJIGxvdmVkIHRoZSB3ZWF0aGVyLCB0aGUgc2NlbmVyeSBhbmQgdGhlIGxhaWQtYmFjayBsaWZlc3R5bGUgb2YgdGhlIGxvY2Fscy4iLCJsYW5ndWFnZXMiOiJlbiIsInNwZWNpYWx0aWVzIjoiYnVzaW5lc3MtZW5nbGlzaCxjb252ZXJzYXRpb25hbC1lbmdsaXNoLGVuZ2xpc2gtZm9yLWtpZHMsaWVsdHMsdG9laWMiLCJyZXN1bWUiOm51bGwsInJhdGluZyI6NC4xODQyMTA1MjYzMTU3ODksImlzQWN0aXZhdGVkIjp0cnVlLCJpc05hdGl2ZSI6bnVsbCwiY3JlYXRlZEF0IjoiMjAyMS0wOC0wMlQxNDowMzozNi4zMjBaIiwidXBkYXRlZEF0IjoiMjAyMy0wMS0wNlQxODo1Njo0Ni41NDFaIn0sInJlcXVpcmVOb3RlIjpudWxsLCJsZXZlbCI6IlVQUEVSX0lOVEVSTUVESUFURSIsImlzUGhvbmVBY3RpdmF0ZWQiOm51bGwsInRpbWV6b25lIjo3LCJzdHVkeVNjaGVkdWxlIjpudWxsLCJjYW5TZW5kTWVzc2FnZSI6ZmFsc2V9LCJpc1R1dG9yIjpmYWxzZSwic3RhcnRUaW1lIjoxNjczMDUzMjAwMDAwLCJlbmRTZXNzaW9uIjoxNjczMDU0NzAwMDAwLCJ0aW1lSW5Sb29tIjoxODAwLCJib29raW5nSWQiOiI0OThkZmQzOS0wZWNjLTQ4OWYtYThlZi01YTc4NDhmYmExYjUiLCJpYXQiOjE2NzMwNDM5OTUsImV4cCI6MTY3MzA2OTA5OSwiYXVkIjoibGl2ZXR1dG9yIiwiaXNzIjoibGl2ZXR1dG9yIiwic3ViIjoiaHR0cHM6Ly9tZWV0LnR1dG9yaW5nLmxldHN0dWR5LmlvIn0.ARnGVNDtcov4_uHwOrq-sG6Jpl1Qje8sfQkvJ8_kwcw"
/// studentRequest : null
/// tutorReview : null
/// scoreByTutor : null
/// createdAt : "2023-01-06T22:26:35.562Z"
/// updatedAt : "2023-01-06T22:26:35.632Z"
/// recordUrl : null
/// cancelReasonId : null
/// lessonPlanId : null
/// cancelNote : null
/// calendarId : null
/// isDeleted : false
/// scheduleDetailInfo : {"startPeriodTimestamp":1673053200000,"endPeriodTimestamp":1673054700000,"id":"606b1f5f-83f4-417a-bd8f-91746d50dcfb","scheduleId":"b37aec72-5cbf-472b-9226-3add56b907cc","startPeriod":"01:00","endPeriod":"01:25","createdAt":"2023-01-05T09:47:44.176Z","updatedAt":"2023-01-05T09:47:44.176Z","scheduleInfo":{"date":"2023-01-07","startTimestamp":1673053200000,"endTimestamp":1673054700000,"id":"b37aec72-5cbf-472b-9226-3add56b907cc","tutorId":"4d54d3d7-d2a9-42e5-97a2-5ed38af5789a","startTime":"01:00","endTime":"01:25","isDeleted":false,"createdAt":"2023-01-05T09:47:44.169Z","updatedAt":"2023-01-05T09:47:44.169Z","tutorInfo":{"id":"4d54d3d7-d2a9-42e5-97a2-5ed38af5789a","level":"UPPER_INTERMEDIATE","email":"teacher@lettutor.com","google":null,"facebook":null,"apple":null,"avatar":"https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00","name":"Keegan","country":"VN","phone":"84356030876","language":"Ukrainian","birthday":"1999-06-07","requestPassword":true,"isActivated":true,"isPhoneActivated":null,"requireNote":null,"timezone":7,"phoneAuth":null,"isPhoneAuthActivated":false,"studySchedule":null,"canSendMessage":false,"isPublicRecord":false,"caredByStaffId":null,"createdAt":"2021-08-02T13:59:37.290Z","updatedAt":"2022-12-31T15:11:53.646Z","deletedAt":null,"studentGroupId":null}}}
/// classReview : null
/// showRecordUrl : false
/// studentMaterials : []
/// feedbacks : []

class MyHistory {
  MyHistory({
      int? createdAtTimeStamp, 
      int? updatedAtTimeStamp, 
      String? id, 
      String? userId, 
      String? scheduleDetailId, 
      String? tutorMeetingLink, 
      String? studentMeetingLink, 
      dynamic studentRequest, 
      dynamic tutorReview, 
      dynamic scoreByTutor, 
      String? createdAt, 
      String? updatedAt, 
      dynamic recordUrl, 
      dynamic cancelReasonId, 
      dynamic lessonPlanId, 
      dynamic cancelNote, 
      dynamic calendarId, 
      bool? isDeleted, 
      ScheduleDetailInfo? scheduleDetailInfo, 
      dynamic classReview, 
      bool? showRecordUrl, 
      List<dynamic>? studentMaterials, 
      List<Feedback>? feedbacks,}){
    _createdAtTimeStamp = createdAtTimeStamp;
    _updatedAtTimeStamp = updatedAtTimeStamp;
    _id = id;
    _userId = userId;
    _scheduleDetailId = scheduleDetailId;
    _tutorMeetingLink = tutorMeetingLink;
    _studentMeetingLink = studentMeetingLink;
    _studentRequest = studentRequest;
    _tutorReview = tutorReview;
    _scoreByTutor = scoreByTutor;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _recordUrl = recordUrl;
    _cancelReasonId = cancelReasonId;
    _lessonPlanId = lessonPlanId;
    _cancelNote = cancelNote;
    _calendarId = calendarId;
    _isDeleted = isDeleted;
    _scheduleDetailInfo = scheduleDetailInfo;
    _classReview = classReview;
    _showRecordUrl = showRecordUrl;
    _studentMaterials = studentMaterials;
    _feedbacks = feedbacks;
}

  MyHistory.fromJson(dynamic json) {
    _createdAtTimeStamp = json['createdAtTimeStamp'];
    _updatedAtTimeStamp = json['updatedAtTimeStamp'];
    _id = json['id'];
    _userId = json['userId'];
    _scheduleDetailId = json['scheduleDetailId'];
    _tutorMeetingLink = json['tutorMeetingLink'];
    _studentMeetingLink = json['studentMeetingLink'];
    _studentRequest = json['studentRequest'];
    _tutorReview = json['tutorReview'];
    _scoreByTutor = json['scoreByTutor'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _recordUrl = json['recordUrl'];
    _cancelReasonId = json['cancelReasonId'];
    _lessonPlanId = json['lessonPlanId'];
    _cancelNote = json['cancelNote'];
    _calendarId = json['calendarId'];
    _isDeleted = json['isDeleted'];
    _scheduleDetailInfo = json['scheduleDetailInfo'] != null ? ScheduleDetailInfo.fromJson(json['scheduleDetailInfo']) : null;
    _classReview = json['classReview'] != null ? ClassReview.fromJson(json['classReview']) : null;
    _showRecordUrl = json['showRecordUrl'];
    if (json['studentMaterials'] != null) {
      _studentMaterials = [];
      json['studentMaterials'].forEach((v) {
        // _studentMaterials?.add(Dynamic.fromJson(v));
      });
    }
    if (json['feedbacks'] != null) {
      _feedbacks = [];
      json['feedbacks'].forEach((v) {
        _feedbacks?.add(Feedback.fromJson(v));
      });
    }
  }
  int? _createdAtTimeStamp;
  int? _updatedAtTimeStamp;
  String? _id;
  String? _userId;
  String? _scheduleDetailId;
  String? _tutorMeetingLink;
  String? _studentMeetingLink;
  dynamic _studentRequest;
  dynamic _tutorReview;
  dynamic _scoreByTutor;
  String? _createdAt;
  String? _updatedAt;
  dynamic _recordUrl;
  dynamic _cancelReasonId;
  dynamic _lessonPlanId;
  dynamic _cancelNote;
  dynamic _calendarId;
  bool? _isDeleted;
  ScheduleDetailInfo? _scheduleDetailInfo;
  dynamic _classReview;
  bool? _showRecordUrl;
  List<dynamic>? _studentMaterials;
  List<Feedback>? _feedbacks;

  int? get createdAtTimeStamp => _createdAtTimeStamp;
  int? get updatedAtTimeStamp => _updatedAtTimeStamp;
  String? get id => _id;
  String? get userId => _userId;
  String? get scheduleDetailId => _scheduleDetailId;
  String? get tutorMeetingLink => _tutorMeetingLink;
  String? get studentMeetingLink => _studentMeetingLink;
  String? get studentRequest => _studentRequest;
  dynamic get tutorReview => _tutorReview;
  dynamic get scoreByTutor => _scoreByTutor;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  dynamic get recordUrl => _recordUrl;
  dynamic get cancelReasonId => _cancelReasonId;
  dynamic get lessonPlanId => _lessonPlanId;
  dynamic get cancelNote => _cancelNote;
  dynamic get calendarId => _calendarId;
  bool? get isDeleted => _isDeleted;
  ScheduleDetailInfo? get scheduleDetailInfo => _scheduleDetailInfo;
  ClassReview? get classReview => _classReview;
  bool? get showRecordUrl => _showRecordUrl;
  List<dynamic>? get studentMaterials => _studentMaterials;
  List<Feedback>? get feedbacks => _feedbacks;

  String get classReviewText {
    if(classReview != null) {
      return '''
Lesson status: ${classReview!.lessonStatus?.status ?? ''}
Behavior: ${'⭐' * (classReview!.behaviorRating ?? 0)}
Listening: ${'⭐' * (classReview!.listeningRating ?? 0)}
Speaking: ${'⭐' * (classReview!.speakingRating ?? 0)}
Vocabulary: ${'⭐' * (classReview!.vocabularyRating ?? 0)}
Homework: ${classReview!.homeworkComment ?? ''}
Overall comment: ${classReview!.overallComment ?? ''}''';
    } else {

      return 'Gia sư chưa có đánh giá';
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['createdAtTimeStamp'] = _createdAtTimeStamp;
    map['updatedAtTimeStamp'] = _updatedAtTimeStamp;
    map['id'] = _id;
    map['userId'] = _userId;
    map['scheduleDetailId'] = _scheduleDetailId;
    map['tutorMeetingLink'] = _tutorMeetingLink;
    map['studentMeetingLink'] = _studentMeetingLink;
    map['studentRequest'] = _studentRequest;
    map['tutorReview'] = _tutorReview;
    map['scoreByTutor'] = _scoreByTutor;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    map['recordUrl'] = _recordUrl;
    map['cancelReasonId'] = _cancelReasonId;
    map['lessonPlanId'] = _lessonPlanId;
    map['cancelNote'] = _cancelNote;
    map['calendarId'] = _calendarId;
    map['isDeleted'] = _isDeleted;
    if (_scheduleDetailInfo != null) {
      map['scheduleDetailInfo'] = _scheduleDetailInfo?.toJson();
    }
    map['classReview'] = _classReview;
    map['showRecordUrl'] = _showRecordUrl;
    if (_studentMaterials != null) {
      map['studentMaterials'] = _studentMaterials?.map((v) => v.toJson()).toList();
    }
    if (_feedbacks != null) {
      map['feedbacks'] = _feedbacks?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// startPeriodTimestamp : 1673053200000
/// endPeriodTimestamp : 1673054700000
/// id : "606b1f5f-83f4-417a-bd8f-91746d50dcfb"
/// scheduleId : "b37aec72-5cbf-472b-9226-3add56b907cc"
/// startPeriod : "01:00"
/// endPeriod : "01:25"
/// createdAt : "2023-01-05T09:47:44.176Z"
/// updatedAt : "2023-01-05T09:47:44.176Z"
/// scheduleInfo : {"date":"2023-01-07","startTimestamp":1673053200000,"endTimestamp":1673054700000,"id":"b37aec72-5cbf-472b-9226-3add56b907cc","tutorId":"4d54d3d7-d2a9-42e5-97a2-5ed38af5789a","startTime":"01:00","endTime":"01:25","isDeleted":false,"createdAt":"2023-01-05T09:47:44.169Z","updatedAt":"2023-01-05T09:47:44.169Z","tutorInfo":{"id":"4d54d3d7-d2a9-42e5-97a2-5ed38af5789a","level":"UPPER_INTERMEDIATE","email":"teacher@lettutor.com","google":null,"facebook":null,"apple":null,"avatar":"https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00","name":"Keegan","country":"VN","phone":"84356030876","language":"Ukrainian","birthday":"1999-06-07","requestPassword":true,"isActivated":true,"isPhoneActivated":null,"requireNote":null,"timezone":7,"phoneAuth":null,"isPhoneAuthActivated":false,"studySchedule":null,"canSendMessage":false,"isPublicRecord":false,"caredByStaffId":null,"createdAt":"2021-08-02T13:59:37.290Z","updatedAt":"2022-12-31T15:11:53.646Z","deletedAt":null,"studentGroupId":null}}

class ScheduleDetailInfo {
  ScheduleDetailInfo({
      int? startPeriodTimestamp, 
      int? endPeriodTimestamp, 
      String? id, 
      String? scheduleId, 
      String? startPeriod, 
      String? endPeriod, 
      String? createdAt, 
      String? updatedAt, 
      ScheduleInfo? scheduleInfo,}){
    _startPeriodTimestamp = startPeriodTimestamp;
    _endPeriodTimestamp = endPeriodTimestamp;
    _id = id;
    _scheduleId = scheduleId;
    _startPeriod = startPeriod;
    _endPeriod = endPeriod;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _scheduleInfo = scheduleInfo;
}

  ScheduleDetailInfo.fromJson(dynamic json) {
    _startPeriodTimestamp = json['startPeriodTimestamp'];
    _endPeriodTimestamp = json['endPeriodTimestamp'];
    _id = json['id'];
    _scheduleId = json['scheduleId'];
    _startPeriod = json['startPeriod'];
    _endPeriod = json['endPeriod'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _scheduleInfo = json['scheduleInfo'] != null ? ScheduleInfo.fromJson(json['scheduleInfo']) : null;
  }
  int? _startPeriodTimestamp;
  int? _endPeriodTimestamp;
  String? _id;
  String? _scheduleId;
  String? _startPeriod;
  String? _endPeriod;
  String? _createdAt;
  String? _updatedAt;
  ScheduleInfo? _scheduleInfo;

  int? get startPeriodTimestamp => _startPeriodTimestamp;
  int? get endPeriodTimestamp => _endPeriodTimestamp;
  String? get id => _id;
  String? get scheduleId => _scheduleId;
  String? get startPeriod => _startPeriod;
  String? get endPeriod => _endPeriod;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  ScheduleInfo? get scheduleInfo => _scheduleInfo;

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
    if (_scheduleInfo != null) {
      map['scheduleInfo'] = _scheduleInfo?.toJson();
    }
    return map;
  }

}

/// date : "2023-01-07"
/// startTimestamp : 1673053200000
/// endTimestamp : 1673054700000
/// id : "b37aec72-5cbf-472b-9226-3add56b907cc"
/// tutorId : "4d54d3d7-d2a9-42e5-97a2-5ed38af5789a"
/// startTime : "01:00"
/// endTime : "01:25"
/// isDeleted : false
/// createdAt : "2023-01-05T09:47:44.169Z"
/// updatedAt : "2023-01-05T09:47:44.169Z"
/// tutorInfo : {"id":"4d54d3d7-d2a9-42e5-97a2-5ed38af5789a","level":"UPPER_INTERMEDIATE","email":"teacher@lettutor.com","google":null,"facebook":null,"apple":null,"avatar":"https://api.app.lettutor.com/avatar/4d54d3d7-d2a9-42e5-97a2-5ed38af5789aavatar1627913015850.00","name":"Keegan","country":"VN","phone":"84356030876","language":"Ukrainian","birthday":"1999-06-07","requestPassword":true,"isActivated":true,"isPhoneActivated":null,"requireNote":null,"timezone":7,"phoneAuth":null,"isPhoneAuthActivated":false,"studySchedule":null,"canSendMessage":false,"isPublicRecord":false,"caredByStaffId":null,"createdAt":"2021-08-02T13:59:37.290Z","updatedAt":"2022-12-31T15:11:53.646Z","deletedAt":null,"studentGroupId":null}

class ScheduleInfo {
  ScheduleInfo({
      String? date, 
      int? startTimestamp, 
      int? endTimestamp, 
      String? id, 
      String? tutorId, 
      String? startTime, 
      String? endTime, 
      bool? isDeleted, 
      String? createdAt, 
      String? updatedAt, 
      TutorInfo? tutorInfo,}){
    _date = date;
    _startTimestamp = startTimestamp;
    _endTimestamp = endTimestamp;
    _id = id;
    _tutorId = tutorId;
    _startTime = startTime;
    _endTime = endTime;
    _isDeleted = isDeleted;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _tutorInfo = tutorInfo;
}

  ScheduleInfo.fromJson(dynamic json) {
    _date = json['date'];
    _startTimestamp = json['startTimestamp'];
    _endTimestamp = json['endTimestamp'];
    _id = json['id'];
    _tutorId = json['tutorId'];
    _startTime = json['startTime'];
    _endTime = json['endTime'];
    _isDeleted = json['isDeleted'];
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _tutorInfo = json['tutorInfo'] != null ? TutorInfo.fromJson(json['tutorInfo']) : null;
  }
  String? _date;
  int? _startTimestamp;
  int? _endTimestamp;
  String? _id;
  String? _tutorId;
  String? _startTime;
  String? _endTime;
  bool? _isDeleted;
  String? _createdAt;
  String? _updatedAt;
  TutorInfo? _tutorInfo;

  String? get date => _date;
  int? get startTimestamp => _startTimestamp;
  int? get endTimestamp => _endTimestamp;
  String? get id => _id;
  String? get tutorId => _tutorId;
  String? get startTime => _startTime;
  String? get endTime => _endTime;
  bool? get isDeleted => _isDeleted;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  TutorInfo? get tutorInfo => _tutorInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['startTimestamp'] = _startTimestamp;
    map['endTimestamp'] = _endTimestamp;
    map['id'] = _id;
    map['tutorId'] = _tutorId;
    map['startTime'] = _startTime;
    map['endTime'] = _endTime;
    map['isDeleted'] = _isDeleted;
    map['createdAt'] = _createdAt;
    map['updatedAt'] = _updatedAt;
    if (_tutorInfo != null) {
      map['tutorInfo'] = _tutorInfo?.toJson();
    }
    return map;
  }

}
