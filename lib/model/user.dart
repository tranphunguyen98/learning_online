class UserModel {
  final String id;
  final String name;
  final String? avatar;
  final String? phoneNumber;
  final String dateOfBirth;
  final String email;
  final String? nation;
  final String? level;
  final String? subject;
  final String accessToken;

  const UserModel({
    this.phoneNumber,
    required this.dateOfBirth,
    required this.email,
    this.nation,
    this.level,
    this.subject,
    required this.accessToken,
    required this.id,
    required this.name,
    required this.avatar,
  });

  static UserModel mock = UserModel(
    email: 'ntran@gmail.com',
    accessToken: '',
    id: '',
    name: 'name',
    dateOfBirth: DateTime.now().toIso8601String(),
    avatar:
    'https://cdn-img.thethao247.vn/upload/kienlv/2020/09/11/tuyen-thu-dt-viet-nam-cong-khai-ban-gai-xinh-nhu-mong1599795990.png',
  );

  UserModel copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? phoneNumber,
    String? dateOfBirth,
    String? email,
    String? nation,
    String? level,
    String? subject,
    String? accessToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: imageUrl ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      nation: nation ?? this.nation,
      level: level ?? this.level,
      subject: subject ?? this.subject,
      accessToken: accessToken ?? this.accessToken,
    );
  }
}
