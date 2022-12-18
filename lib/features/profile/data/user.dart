/// user : {"id":"f569c202-7bbf-4620-af77-ecc1419a6b28","email":"student@lettutor.com","name":"Demo1111","avatar":"https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1671339081995.jpg","country":"AG","phone":"842499996508","roles":["student","CHANGE_PASSWORD"],"language":"Albanian","birthday":"2022-12-08","isActivated":true,"tutorInfo":{"id":"db37f185-399f-470d-995b-bf6143cb1a5f","video":"https://sandbox.api.lettutor.com/video/f569c202-7bbf-4620-af77-ecc1419a6b28video1643096811438.mp4","bio":"You can't Xi me ! Bing chilling ! 1","education":"University of Science 3","experience":"3 years","profession":"WWE, Online English teacher","accent":null,"targetStudent":"Advanced","interests":"I like reading book","languages":"+1268","specialties":"conversational-english,movers,flyers,toefl,toeic,business-english,Business English,Conversational English,Ielts,Movers,Toeic","resume":null,"rating":4.378378378378378,"isActivated":false,"isNative":false},"walletInfo":{"amount":"60300000","isBlocked":false,"bonus":0},"requireNote":null,"level":"BEGINNER","learnTopics":[{"id":3,"key":"english-for-kids","name":"English for Kids"}],"testPreparations":[{"id":3,"key":"flyers","name":"FLYERS"}],"isPhoneActivated":true,"timezone":7,"referralInfo":{"referralCode":"RSJYDZYQLE","referralPackInfo":{"earnPercent":5}},"studySchedule":"","canSendMessage":false,"studentGroup":null,"studentInfo":null,"avgRating":4.378378378378378}

class User {
  User({
      User? user,}){
    _user = user;
}

  User.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;

  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }

}

/// id : "f569c202-7bbf-4620-af77-ecc1419a6b28"
/// email : "student@lettutor.com"
/// name : "Demo1111"
/// avatar : "https://sandbox.api.lettutor.com/avatar/f569c202-7bbf-4620-af77-ecc1419a6b28avatar1671339081995.jpg"
/// country : "AG"
/// phone : "842499996508"
/// roles : ["student","CHANGE_PASSWORD"]
/// language : "Albanian"
/// birthday : "2022-12-08"
/// isActivated : true
/// tutorInfo : {"id":"db37f185-399f-470d-995b-bf6143cb1a5f","video":"https://sandbox.api.lettutor.com/video/f569c202-7bbf-4620-af77-ecc1419a6b28video1643096811438.mp4","bio":"You can't Xi me ! Bing chilling ! 1","education":"University of Science 3","experience":"3 years","profession":"WWE, Online English teacher","accent":null,"targetStudent":"Advanced","interests":"I like reading book","languages":"+1268","specialties":"conversational-english,movers,flyers,toefl,toeic,business-english,Business English,Conversational English,Ielts,Movers,Toeic","resume":null,"rating":4.378378378378378,"isActivated":false,"isNative":false}
/// walletInfo : {"amount":"60300000","isBlocked":false,"bonus":0}
/// requireNote : null
/// level : "BEGINNER"
/// learnTopics : [{"id":3,"key":"english-for-kids","name":"English for Kids"}]
/// testPreparations : [{"id":3,"key":"flyers","name":"FLYERS"}]
/// isPhoneActivated : true
/// timezone : 7
/// referralInfo : {"referralCode":"RSJYDZYQLE","referralPackInfo":{"earnPercent":5}}
/// studySchedule : ""
/// canSendMessage : false
/// studentGroup : null
/// studentInfo : null
/// avgRating : 4.378378378378378

class User {
  User({
      String? id, 
      String? email, 
      String? name, 
      String? avatar, 
      String? country, 
      String? phone, 
      List<String>? roles, 
      String? language, 
      String? birthday, 
      bool? isActivated, 
      TutorInfo? tutorInfo, 
      WalletInfo? walletInfo, 
      dynamic requireNote, 
      String? level, 
      List<LearnTopics>? learnTopics, 
      List<TestPreparations>? testPreparations, 
      bool? isPhoneActivated, 
      int? timezone, 
      ReferralInfo? referralInfo, 
      String? studySchedule, 
      bool? canSendMessage, 
      dynamic studentGroup, 
      dynamic studentInfo, 
      double? avgRating,}){
    _id = id;
    _email = email;
    _name = name;
    _avatar = avatar;
    _country = country;
    _phone = phone;
    _roles = roles;
    _language = language;
    _birthday = birthday;
    _isActivated = isActivated;
    _tutorInfo = tutorInfo;
    _walletInfo = walletInfo;
    _requireNote = requireNote;
    _level = level;
    _learnTopics = learnTopics;
    _testPreparations = testPreparations;
    _isPhoneActivated = isPhoneActivated;
    _timezone = timezone;
    _referralInfo = referralInfo;
    _studySchedule = studySchedule;
    _canSendMessage = canSendMessage;
    _studentGroup = studentGroup;
    _studentInfo = studentInfo;
    _avgRating = avgRating;
}

  User.fromJson(dynamic json) {
    _id = json['id'];
    _email = json['email'];
    _name = json['name'];
    _avatar = json['avatar'];
    _country = json['country'];
    _phone = json['phone'];
    _roles = json['roles'] != null ? json['roles'].cast<String>() : [];
    _language = json['language'];
    _birthday = json['birthday'];
    _isActivated = json['isActivated'];
    _tutorInfo = json['tutorInfo'] != null ? TutorInfo.fromJson(json['tutorInfo']) : null;
    _walletInfo = json['walletInfo'] != null ? WalletInfo.fromJson(json['walletInfo']) : null;
    _requireNote = json['requireNote'];
    _level = json['level'];
    if (json['learnTopics'] != null) {
      _learnTopics = [];
      json['learnTopics'].forEach((v) {
        _learnTopics?.add(LearnTopics.fromJson(v));
      });
    }
    if (json['testPreparations'] != null) {
      _testPreparations = [];
      json['testPreparations'].forEach((v) {
        _testPreparations?.add(TestPreparations.fromJson(v));
      });
    }
    _isPhoneActivated = json['isPhoneActivated'];
    _timezone = json['timezone'];
    _referralInfo = json['referralInfo'] != null ? ReferralInfo.fromJson(json['referralInfo']) : null;
    _studySchedule = json['studySchedule'];
    _canSendMessage = json['canSendMessage'];
    _studentGroup = json['studentGroup'];
    _studentInfo = json['studentInfo'];
    _avgRating = json['avgRating'];
  }
  String? _id;
  String? _email;
  String? _name;
  String? _avatar;
  String? _country;
  String? _phone;
  List<String>? _roles;
  String? _language;
  String? _birthday;
  bool? _isActivated;
  TutorInfo? _tutorInfo;
  WalletInfo? _walletInfo;
  dynamic _requireNote;
  String? _level;
  List<LearnTopics>? _learnTopics;
  List<TestPreparations>? _testPreparations;
  bool? _isPhoneActivated;
  int? _timezone;
  ReferralInfo? _referralInfo;
  String? _studySchedule;
  bool? _canSendMessage;
  dynamic _studentGroup;
  dynamic _studentInfo;
  double? _avgRating;

  String? get id => _id;
  String? get email => _email;
  String? get name => _name;
  String? get avatar => _avatar;
  String? get country => _country;
  String? get phone => _phone;
  List<String>? get roles => _roles;
  String? get language => _language;
  String? get birthday => _birthday;
  bool? get isActivated => _isActivated;
  TutorInfo? get tutorInfo => _tutorInfo;
  WalletInfo? get walletInfo => _walletInfo;
  dynamic get requireNote => _requireNote;
  String? get level => _level;
  List<LearnTopics>? get learnTopics => _learnTopics;
  List<TestPreparations>? get testPreparations => _testPreparations;
  bool? get isPhoneActivated => _isPhoneActivated;
  int? get timezone => _timezone;
  ReferralInfo? get referralInfo => _referralInfo;
  String? get studySchedule => _studySchedule;
  bool? get canSendMessage => _canSendMessage;
  dynamic get studentGroup => _studentGroup;
  dynamic get studentInfo => _studentInfo;
  double? get avgRating => _avgRating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['email'] = _email;
    map['name'] = _name;
    map['avatar'] = _avatar;
    map['country'] = _country;
    map['phone'] = _phone;
    map['roles'] = _roles;
    map['language'] = _language;
    map['birthday'] = _birthday;
    map['isActivated'] = _isActivated;
    if (_tutorInfo != null) {
      map['tutorInfo'] = _tutorInfo?.toJson();
    }
    if (_walletInfo != null) {
      map['walletInfo'] = _walletInfo?.toJson();
    }
    map['requireNote'] = _requireNote;
    map['level'] = _level;
    if (_learnTopics != null) {
      map['learnTopics'] = _learnTopics?.map((v) => v.toJson()).toList();
    }
    if (_testPreparations != null) {
      map['testPreparations'] = _testPreparations?.map((v) => v.toJson()).toList();
    }
    map['isPhoneActivated'] = _isPhoneActivated;
    map['timezone'] = _timezone;
    if (_referralInfo != null) {
      map['referralInfo'] = _referralInfo?.toJson();
    }
    map['studySchedule'] = _studySchedule;
    map['canSendMessage'] = _canSendMessage;
    map['studentGroup'] = _studentGroup;
    map['studentInfo'] = _studentInfo;
    map['avgRating'] = _avgRating;
    return map;
  }

}

/// referralCode : "RSJYDZYQLE"
/// referralPackInfo : {"earnPercent":5}

class ReferralInfo {
  ReferralInfo({
      String? referralCode, 
      ReferralPackInfo? referralPackInfo,}){
    _referralCode = referralCode;
    _referralPackInfo = referralPackInfo;
}

  ReferralInfo.fromJson(dynamic json) {
    _referralCode = json['referralCode'];
    _referralPackInfo = json['referralPackInfo'] != null ? ReferralPackInfo.fromJson(json['referralPackInfo']) : null;
  }
  String? _referralCode;
  ReferralPackInfo? _referralPackInfo;

  String? get referralCode => _referralCode;
  ReferralPackInfo? get referralPackInfo => _referralPackInfo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['referralCode'] = _referralCode;
    if (_referralPackInfo != null) {
      map['referralPackInfo'] = _referralPackInfo?.toJson();
    }
    return map;
  }

}

/// earnPercent : 5

class ReferralPackInfo {
  ReferralPackInfo({
      int? earnPercent,}){
    _earnPercent = earnPercent;
}

  ReferralPackInfo.fromJson(dynamic json) {
    _earnPercent = json['earnPercent'];
  }
  int? _earnPercent;

  int? get earnPercent => _earnPercent;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['earnPercent'] = _earnPercent;
    return map;
  }

}

/// id : 3
/// key : "flyers"
/// name : "FLYERS"

class TestPreparations {
  TestPreparations({
      int? id, 
      String? key, 
      String? name,}){
    _id = id;
    _key = key;
    _name = name;
}

  TestPreparations.fromJson(dynamic json) {
    _id = json['id'];
    _key = json['key'];
    _name = json['name'];
  }
  int? _id;
  String? _key;
  String? _name;

  int? get id => _id;
  String? get key => _key;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['key'] = _key;
    map['name'] = _name;
    return map;
  }

}

/// id : 3
/// key : "english-for-kids"
/// name : "English for Kids"

class LearnTopics {
  LearnTopics({
      int? id, 
      String? key, 
      String? name,}){
    _id = id;
    _key = key;
    _name = name;
}

  LearnTopics.fromJson(dynamic json) {
    _id = json['id'];
    _key = json['key'];
    _name = json['name'];
  }
  int? _id;
  String? _key;
  String? _name;

  int? get id => _id;
  String? get key => _key;
  String? get name => _name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['key'] = _key;
    map['name'] = _name;
    return map;
  }

}

/// amount : "60300000"
/// isBlocked : false
/// bonus : 0

class WalletInfo {
  WalletInfo({
      String? amount, 
      bool? isBlocked, 
      int? bonus,}){
    _amount = amount;
    _isBlocked = isBlocked;
    _bonus = bonus;
}

  WalletInfo.fromJson(dynamic json) {
    _amount = json['amount'];
    _isBlocked = json['isBlocked'];
    _bonus = json['bonus'];
  }
  String? _amount;
  bool? _isBlocked;
  int? _bonus;

  String? get amount => _amount;
  bool? get isBlocked => _isBlocked;
  int? get bonus => _bonus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['amount'] = _amount;
    map['isBlocked'] = _isBlocked;
    map['bonus'] = _bonus;
    return map;
  }

}

/// id : "db37f185-399f-470d-995b-bf6143cb1a5f"
/// video : "https://sandbox.api.lettutor.com/video/f569c202-7bbf-4620-af77-ecc1419a6b28video1643096811438.mp4"
/// bio : "You can't Xi me ! Bing chilling ! 1"
/// education : "University of Science 3"
/// experience : "3 years"
/// profession : "WWE, Online English teacher"
/// accent : null
/// targetStudent : "Advanced"
/// interests : "I like reading book"
/// languages : "+1268"
/// specialties : "conversational-english,movers,flyers,toefl,toeic,business-english,Business English,Conversational English,Ielts,Movers,Toeic"
/// resume : null
/// rating : 4.378378378378378
/// isActivated : false
/// isNative : false

class TutorInfo {
  TutorInfo({
      String? id, 
      String? video, 
      String? bio, 
      String? education, 
      String? experience, 
      String? profession, 
      dynamic accent, 
      String? targetStudent, 
      String? interests, 
      String? languages, 
      String? specialties, 
      dynamic resume, 
      double? rating, 
      bool? isActivated, 
      bool? isNative,}){
    _id = id;
    _video = video;
    _bio = bio;
    _education = education;
    _experience = experience;
    _profession = profession;
    _accent = accent;
    _targetStudent = targetStudent;
    _interests = interests;
    _languages = languages;
    _specialties = specialties;
    _resume = resume;
    _rating = rating;
    _isActivated = isActivated;
    _isNative = isNative;
}

  TutorInfo.fromJson(dynamic json) {
    _id = json['id'];
    _video = json['video'];
    _bio = json['bio'];
    _education = json['education'];
    _experience = json['experience'];
    _profession = json['profession'];
    _accent = json['accent'];
    _targetStudent = json['targetStudent'];
    _interests = json['interests'];
    _languages = json['languages'];
    _specialties = json['specialties'];
    _resume = json['resume'];
    _rating = json['rating'];
    _isActivated = json['isActivated'];
    _isNative = json['isNative'];
  }
  String? _id;
  String? _video;
  String? _bio;
  String? _education;
  String? _experience;
  String? _profession;
  dynamic _accent;
  String? _targetStudent;
  String? _interests;
  String? _languages;
  String? _specialties;
  dynamic _resume;
  double? _rating;
  bool? _isActivated;
  bool? _isNative;

  String? get id => _id;
  String? get video => _video;
  String? get bio => _bio;
  String? get education => _education;
  String? get experience => _experience;
  String? get profession => _profession;
  dynamic get accent => _accent;
  String? get targetStudent => _targetStudent;
  String? get interests => _interests;
  String? get languages => _languages;
  String? get specialties => _specialties;
  dynamic get resume => _resume;
  double? get rating => _rating;
  bool? get isActivated => _isActivated;
  bool? get isNative => _isNative;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['video'] = _video;
    map['bio'] = _bio;
    map['education'] = _education;
    map['experience'] = _experience;
    map['profession'] = _profession;
    map['accent'] = _accent;
    map['targetStudent'] = _targetStudent;
    map['interests'] = _interests;
    map['languages'] = _languages;
    map['specialties'] = _specialties;
    map['resume'] = _resume;
    map['rating'] = _rating;
    map['isActivated'] = _isActivated;
    map['isNative'] = _isNative;
    return map;
  }

}