/// total : 12625

class Total {
  Total({
    int? total,
  }) {
    _total = total;
  }

  Total.fromJson(dynamic json) {
    _total = json['total'];
  }

  int? _total;

  int? get total => _total;

  String get totalText {
    if (total != null && total! > 0) {
      var result = 'Tổng số giờ bạn đã học là';
      final hours = total! ~/ 60;
      if(hours > 0) {
        result += ' $hours giờ';
      }

      final minutes = total! % 60;
      if(minutes > 0) {
        result += ' $minutes phút';
      }

      return result;
    }
    return 'Chào mừng bạn đến với LetTutor!';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['total'] = _total;
    return map;
  }
}
