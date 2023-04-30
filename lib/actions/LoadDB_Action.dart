import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_naver_login/flutter_naver_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:huewoo/models/signup_model.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

enum Services {
  kakao(name: "kakao"),
  naver(name: "naver"),
  google(name: "google"),
  custom(name: "custom");

  final String name;
  const Services({
    required this.name,
  });

  String conversionFirebaseName() => "${name}LoginInfo";
}

class FirebaseManage {
  late UserInfo userinfo;
  AuthManage automanager = AuthManage();

  Future<int> loginWhitAuto(Services eService) async {
    late String userkey;
    try {
      if (!(await automanager.autoLoginAt(eService))) {
        return -1;
      } else {
        String service = eService.conversionFirebaseName();
        final col = FirebaseFirestore.instance.collection(service);
        QuerySnapshot querySnapshot = await col.get();
        for (var info in querySnapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)) {
          if (automanager.uid == info['id']) {
            userkey = info['key'];
            userinfo = UserInfo.fromJson(await getUserInfoFromKey(userkey));
            return 0;
          }
        }
        return 1;
      }
    } catch (e) {
      print("firebaseErr : $e");
      return -1;
      // TODO
    }
  }

  Future<bool> loginWithIdPassword({
    required String id,
    required String password,
  }) async {
    late String userkey;
    String service = Services.custom.conversionFirebaseName();
    try {
      final col = FirebaseFirestore.instance.collection(service);
      QuerySnapshot querySnapshot = await col.get();
      for (var info in querySnapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)) {
        if (id == info['id'] && password == info['password']) {
          userkey = info['key'];
          userinfo = UserInfo.fromJson(await getUserInfoFromKey(userkey));
          return true;
        }
      }
    } catch (e) {
      // TODO
      print("err_LoginWithPassowrd : $e");
    }
    return false;
  }

  Future<Map<String, dynamic>> getUserInfoFromKey(String key) async {
    final userscol = FirebaseFirestore.instance.collection("users");
    QuerySnapshot querySnapshot = await userscol.get();
    try {
      for (var doc in querySnapshot.docs) {
        if (key == doc.id) {
          return doc.data() as Map<String, dynamic>;
        }
      }
    } catch (e) {
      print("notfoundUser: $e");
    }

    return {};
  }

  //firebase 업로드
  Future<String> updateUserData(Map<String, dynamic> data) async {
    final userscol = FirebaseFirestore.instance.collection("users");
    var user = await userscol
        .add(data)
        .catchError((error) => print("Failed to add user: $error"));
    return user.id;
  }

  Future<bool> updataLoginInfo({
    required String key,
    required String uid,
    required Services service,
  }) async {
    try {
      final col = FirebaseFirestore.instance
          .collection(service.conversionFirebaseName());
      await col.add({'id': uid, 'key': key}).catchError(
          (error) => print("Failed to add user: $error"));

      return true;
    } catch (e) {
      // TODO
      print('firebase update err : $e');
    }
    return false;
  }

  Future<bool> updataLoginInfoCustom({
    required String key,
    required String uid,
    required String password,
  }) async {
    try {
      final col = FirebaseFirestore.instance
          .collection(Services.custom.conversionFirebaseName());
      await col.add({'id': uid, 'key': key, "password": password}).catchError(
          (error) => print("Failed to add user: $error"));

      return true;
    } catch (e) {
      // TODO
      print('firebase update err : $e');
    }
    return false;
  }
}

class AuthManage {
  String uid = "";

  Future<bool> autoLoginAt(eService) async {
    switch (eService) {
      case Services.google:
        return autoGoogle();
      case Services.kakao:
        return autoKakao();
      case Services.naver:
        return autoNaver();
      default:
        return false;
    }
  }

  Future<bool> autoKakao() async {
    print('kakao');
    uid = "";
    try {
      // login
      var result = await UserApi.instance.loginWithKakaoAccount();

      // get user info
      var userInfo = await UserApi.instance.me();

      // userInfo, accessToken
      // print(result.accessToken.toString());
      // print(userInfo.toJson());

      // do something with the user info, like save it to a database
      uid = userInfo.toJson()['id'].toString();

      return true;
    } catch (e) {
      print('Kakao login error: $e');
    }
    return false;
  }

  Future<bool> autoNaver() async {
    print('naver');
    uid = "";
    try {
      final NaverLoginResult res = await FlutterNaverLogin.logIn();
      if (res.status == NaverLoginStatus.loggedIn) {
        // userinfo, accesstoken
        // NaverAccessToken token = await FlutterNaverLogin.currentAccessToken;
        // print('account = ${res.account}');
        // print(token);
        print(res.account);
        uid = res.account.id;
        return true;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<bool> autoGoogle() async {
    print("google");
    uid = "";
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
        // userInfo
        // print('name = ${googleUser.displayName}');
        // print('email = ${googleUser.email}');
        // print('id = ${googleUser.id}');
        uid = googleUser.id;

        return true;
      }
    } catch (e) {
      print("Err : $e");
    }
    return false;
  }
}
