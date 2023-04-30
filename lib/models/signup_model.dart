class UserInfo {
  late String nickname, gender, birth;
  UserInfo() {
    nickname = '';
    gender = '';
    birth = '';
  }

  Map<String, dynamic> toJson() {
    return {
      'nickname': nickname,
      'gender': gender,
      'birth': birth,
    };
  }

  UserInfo.fromJson(Map<String, dynamic> json)
      : birth = json['birth'],
        nickname = json['nickname'],
        gender = json['gender'];
}
