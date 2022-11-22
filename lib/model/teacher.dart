import 'dart:math';

class TeacherModel {
  final String id;
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
  });

  static TeacherModel mock = TeacherModel(
    id: '1',
    star: 5,
    fields: [
      'English for Adults1',
    ],
    name: 'Teacher Yolly',
    description:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom..',
    avatar:
    'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
    isFavorite: true,
    career:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    education:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    experience:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    hobby:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    nation: 'Philippines',
    languages: ['English', 'French', 'Vietnamese'],
  );
  static TeacherModel mock1 = TeacherModel(
    id: '2',
    star: 4,
    fields: [
      'English for Kids',
      'English for Adults',
    ],
    name: 'Teacher Allan',
    description:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    avatar:
    'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
    isFavorite: false,
    career:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    education:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    experience:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    hobby:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    nation: 'Philippines',
    languages: ['English'],
  );

  static TeacherModel mock2 = TeacherModel(
    id: '3',
    star: 3,
    fields: [
      'English for Adults1',
    ],
    name: 'Hoang Hong Ha',
    description:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom..',
    avatar:
    'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
    isFavorite: true,
    career:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    education:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    experience:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    hobby:
    'Tiền thân của Vingroup là Tập đoàn Technocom, thành lập năm 1993 tại Ucraina. Đầu những năm 2000, Technocom trở về Việt Nam, tập trung đầu tư vào lĩnh vực du lịch và bất động sản với hai thương hiệu chiến lược ban đầu là Vinpearl và Vincom. Đến tháng 1/2012, công ty CP Vincom và Công ty CP Vinpearl sáp nhập, chính thức hoạt động dưới mô hình Tập đoàn với tên gọi Tập đoàn Vingroup – Công ty CP.',
    nation: 'Philippines',
    languages: ['English', 'French'],
  );

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
    );
  }
}
