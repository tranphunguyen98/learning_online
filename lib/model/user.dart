import 'package:learning_online/features/login/data/login_reponse.dart';

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
  final WalletInfo? walletInfo;


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
    required this.walletInfo,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? avatar,
    String? phoneNumber,
    String? dateOfBirth,
    String? email,
    String? nation,
    String? level,
    String? subject,
    String? accessToken,
    WalletInfo? walletInfo,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      avatar: avatar ?? this.avatar,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
      nation: nation ?? this.nation,
      level: level ?? this.level,
      subject: subject ?? this.subject,
      accessToken: accessToken ?? this.accessToken,
      walletInfo: walletInfo ?? this.walletInfo,
    );
  }
}
