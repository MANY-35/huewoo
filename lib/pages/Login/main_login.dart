import 'package:flutter/material.dart';
import 'package:huewoo/actions/LoadDB_Action.dart';
import 'package:huewoo/pages/Login/signup_page.dart';
import 'package:huewoo/pages/home_page.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({super.key});

  @override
  State<MainLogin> createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<MainLogin> {
  TextEditingController inputId = TextEditingController();
  TextEditingController inputPwd = TextEditingController();
  FirebaseManage loginManager = FirebaseManage();

  loginAction(Services eService) {
    if (eService.name == Services.custom.name) {
      loginManager
          .loginWithIdPassword(id: inputId.text, password: inputPwd.text)
          .then((value) {
        if (value) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomePage(userinfo: loginManager.userinfo)));
        }
      });
    } else {
      loginManager.loginWhitAuto(eService).then((value) {
        if (value == 0) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      HomePage(userinfo: loginManager.userinfo)));
        } else if (value == 1) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SignupPage(
                        eService: eService,
                        uid: loginManager.automanager.uid,
                      )));
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: Text("asd"),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.blueAccent[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("로그인"),
                      Row(
                        children: [
                          const Text("아이디"),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: inputId,
                              decoration: const InputDecoration(),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text("비밀번호"),
                          SizedBox(
                            width: 100,
                            child: TextField(
                              controller: inputPwd,
                              decoration: const InputDecoration(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        child: const Text("로그인"),
                        onPressed: () {
                          loginAction(Services.custom);
                        },
                      ),
                      ElevatedButton(
                        child: const Text("회원가입"),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupPage(
                                eService: Services.custom,
                                uid: "",
                              ),
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    loginAction(Services.kakao);
                  },
                  child: const Text("Kakao"),
                ),
                ElevatedButton(
                  onPressed: () {
                    loginAction(Services.naver);
                  },
                  child: const Text("Naver"),
                ),
                ElevatedButton(
                  onPressed: () {
                    loginAction(Services.google);
                  },
                  child: const Text("Google"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
