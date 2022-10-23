// Schedule scheduleFromJson(String str) => Schedule.fromJson(json.decode(str));
//
// String scheduleToJson(Schedule data) => json.encode(data.toJson());

class Schedule {
  Schedule({
    required this.message,
    required this.scheduleOfTutor,
  });

  final String message;
  final List<ScheduleOfTutor> scheduleOfTutor;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
        message: json["message"],
        scheduleOfTutor: List<ScheduleOfTutor>.from(
            json["scheduleOfTutor"].map((x) => ScheduleOfTutor.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "scheduleOfTutor": List<dynamic>.from(scheduleOfTutor.map((x) => x.toJson())),
      };
}

class ScheduleOfTutor {
  ScheduleOfTutor({
    required this.id,
    required this.tutorId,
    required this.startTime,
    required this.endTime,
    required this.startTimestamp,
    required this.endTimestamp,
    required this.createdAt,
    required this.isBooked,
    required this.scheduleDetails,
  });

  final String id;
  final String tutorId;
  final String startTime;
  final String endTime;
  final int startTimestamp;
  final int endTimestamp;
  final DateTime createdAt;
  final bool isBooked;
  final List<ScheduleDetail> scheduleDetails;

  String get startAndEndTime => '$startTime - $endTime';

  factory ScheduleOfTutor.fromJson(Map<String, dynamic> json) => ScheduleOfTutor(
        id: json["id"],
        tutorId: json["tutorId"],
        startTime: json["startTime"],
        endTime: json["endTime"],
        startTimestamp: json["startTimestamp"],
        endTimestamp: json["endTimestamp"],
        createdAt: DateTime.parse(json["createdAt"]),
        isBooked: json["isBooked"],
        scheduleDetails: List<ScheduleDetail>.from(
            json["scheduleDetails"].map((x) => ScheduleDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tutorId": tutorId,
        "startTime": startTime,
        "endTime": endTime,
        "startTimestamp": startTimestamp,
        "endTimestamp": endTimestamp,
        "createdAt": createdAt.toIso8601String(),
        "isBooked": isBooked,
        "scheduleDetails": List<dynamic>.from(scheduleDetails.map((x) => x.toJson())),
      };
}

class ScheduleDetail {
  ScheduleDetail({
    required this.startPeriodTimestamp,
    required this.endPeriodTimestamp,
    required this.id,
    required this.scheduleId,
    required this.startPeriod,
    required this.endPeriod,
    required this.createdAt,
    required this.updatedAt,
    required this.bookingInfo,
    required this.isBooked,
  });

  final int startPeriodTimestamp;
  final int endPeriodTimestamp;
  final String id;
  final String scheduleId;
  final String startPeriod;
  final String endPeriod;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<BookingInfo> bookingInfo;
  final bool isBooked;

  factory ScheduleDetail.fromJson(Map<String, dynamic> json) => ScheduleDetail(
        startPeriodTimestamp: json["startPeriodTimestamp"],
        endPeriodTimestamp: json["endPeriodTimestamp"],
        id: json["id"],
        scheduleId: json["scheduleId"],
        startPeriod: json["startPeriod"],
        endPeriod: json["endPeriod"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        bookingInfo:
            List<BookingInfo>.from(json["bookingInfo"].map((x) => BookingInfo.fromJson(x))),
        isBooked: json["isBooked"],
      );

  Map<String, dynamic> toJson() => {
        "startPeriodTimestamp": startPeriodTimestamp,
        "endPeriodTimestamp": endPeriodTimestamp,
        "id": id,
        "scheduleId": scheduleId,
        "startPeriod": startPeriod,
        "endPeriod": endPeriod,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "bookingInfo": List<dynamic>.from(bookingInfo.map((x) => x.toJson())),
        "isBooked": isBooked,
      };
}

class BookingInfo {
  BookingInfo({
    required this.createdAtTimeStamp,
    required this.updatedAtTimeStamp,
    required this.id,
    required this.isDeleted,
    required this.createdAt,
    required this.scheduleDetailId,
    required this.updatedAt,
    required this.cancelReasonId,
    required this.userId,
  });

  final int createdAtTimeStamp;
  final int updatedAtTimeStamp;
  final String id;
  final bool isDeleted;
  final DateTime createdAt;
  final String scheduleDetailId;
  final DateTime updatedAt;
  final int cancelReasonId;
  final String userId;

  factory BookingInfo.fromJson(Map<String, dynamic> json) => BookingInfo(
        createdAtTimeStamp: json["createdAtTimeStamp"],
        updatedAtTimeStamp: json["updatedAtTimeStamp"],
        id: json["id"],
        isDeleted: json["isDeleted"],
        createdAt: DateTime.parse(json["createdAt"]),
        scheduleDetailId: json["scheduleDetailId"],
        updatedAt: DateTime.parse(json["updatedAt"]),
        cancelReasonId: json["cancelReasonId"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "createdAtTimeStamp": createdAtTimeStamp,
        "updatedAtTimeStamp": updatedAtTimeStamp,
        "id": id,
        "isDeleted": isDeleted,
        "createdAt": createdAt.toIso8601String(),
        "scheduleDetailId": scheduleDetailId,
        "updatedAt": updatedAt.toIso8601String(),
        "cancelReasonId": cancelReasonId,
        "userId": userId,
      };
}
