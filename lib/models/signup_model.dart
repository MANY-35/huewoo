class SignupModel {
  late String id, password, nickname, gender, birth;
  SignupModel() {
    id = "";
    password = "";
    nickname = '';
    gender = 'Nothing';
    birth = '';
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'nickname': nickname,
      'gender': gender,
      'birth': birth,
    };
  }

  SignupModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        password = json['password'],
        nickname = json['nickname'],
        gender = json['gender'];
}
