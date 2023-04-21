import 'package:flutter/material.dart';
import 'package:huewoo/pages/Login/signup_detail_page.dart';

class MainLogin extends StatefulWidget {
  const MainLogin({super.key});

  @override
  State<MainLogin> createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<MainLogin> {
  @override
  Widget build(BuildContext context) {
    TextEditingController inputId = TextEditingController();
    TextEditingController inputPwd = TextEditingController();

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
                            width: 300,
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
                            width: 300,
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
                        onPressed: () {},
                      ),
                      ElevatedButton(
                        child: const Text("회원가입"),
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignupDetailPage(),
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
                  child: const Text("Kakao"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text("Naver"),
                  onPressed: () {},
                ),
                ElevatedButton(
                  child: const Text("Google"),
                  onPressed: () {},
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
