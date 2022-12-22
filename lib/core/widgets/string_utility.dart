import 'package:intl/intl.dart';

class StringUtility {
  static const String _vietnamese = "aAeEoOuUiIdDyY";
  static final List<RegExp> _vietnameseRegex = <RegExp>[
    RegExp(r'à|á|ạ|ả|ã|â|ầ|ấ|ậ|ẩ|ẫ|ă|ằ|ắ|ặ|ẳ|ẵ'),
    RegExp(r'À|Á|Ạ|Ả|Ã|Â|Ầ|Ấ|Ậ|Ẩ|Ẫ|Ă|Ằ|Ắ|Ặ|Ẳ|Ẵ'),
    RegExp(r'è|é|ẹ|ẻ|ẽ|ê|ề|ế|ệ|ể|ễ'),
    RegExp(r'È|É|Ẹ|Ẻ|Ẽ|Ê|Ề|Ế|Ệ|Ể|Ễ'),
    RegExp(r'ò|ó|ọ|ỏ|õ|ô|ồ|ố|ộ|ổ|ỗ|ơ|ờ|ớ|ợ|ở|ỡ'),
    RegExp(r'Ò|Ó|Ọ|Ỏ|Õ|Ô|Ồ|Ố|Ộ|Ổ|Ỗ|Ơ|Ờ|Ớ|Ợ|Ở|Ỡ'),
    RegExp(r'ù|ú|ụ|ủ|ũ|ư|ừ|ứ|ự|ử|ữ'),
    RegExp(r'Ù|Ú|Ụ|Ủ|Ũ|Ư|Ừ|Ứ|Ự|Ử|Ữ'),
    RegExp(r'ì|í|ị|ỉ|ĩ'),
    RegExp(r'Ì|Í|Ị|Ỉ|Ĩ'),
    RegExp(r'đ'),
    RegExp(r'Đ'),
    RegExp(r'ỳ|ý|ỵ|ỷ|ỹ'),
    RegExp(r'Ỳ|Ý|Ỵ|Ỷ|Ỹ')
  ];

  static String unsign(final String text) {
    String result = text;
    if (result is String) {
      for (int i = 0; i < _vietnamese.length; ++i) {
        result = result.replaceAll(_vietnameseRegex[i], _vietnamese[i]);
      }
    }
    return result;
  }

  static String formatNumber(final int value) {
    return NumberFormat.compact(locale: 'vi_VN').format(
      value,
    );
  }

  static String formatSalary(String? value) {
    String format = '';
    if (value == null) {
      format = 'Thoả thuận';
    } else if (value.contains('-')) {
      List<String> strArr = value.split('-');
      for (var i = 0; i < strArr.length; i++) {
        int num = int.parse(strArr[i].trim());
        if (i == 0) {
          format += formatNumber(num);
        } else {
          format += ' - ${formatNumber(num)}';
          // format += ' - ${formatNumber(num)}' + ' VNĐ';
        }
      }
    } else if (value == '0') {
      format = 'Thoả thuận';
    } else {
      int num = int.parse(value.trim());
      format += formatNumber(num);
    }
    return format;
  }

  // static String enumToString(Object o) =>
  //     o.toString().split('.').last.toLowerCase();

  // static T? enumFromString<T>(String key, List<T> values) => values
  //     .firstWhere((v) => key == enumToString(v as Object), orElse: () => null);
}
