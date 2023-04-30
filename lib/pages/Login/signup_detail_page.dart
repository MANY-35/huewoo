import 'package:flutter/material.dart';
import 'package:huewoo/actions/LoadDB_Action.dart';
import 'package:huewoo/models/signup_model.dart';

class SignupDetailPage extends StatefulWidget {
  const SignupDetailPage({super.key});

  @override
  State<SignupDetailPage> createState() => _signupDetailPageState();
}

// ignore: camel_case_types
class _signupDetailPageState extends State<SignupDetailPage> {
  TextEditingController nickname = TextEditingController();
  TextEditingController birth = TextEditingController();
  TextEditingController gender = TextEditingController();
  FirebaseManage manager = FirebaseManage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50),
        child: Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("닉네임"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: nickname,
                      expands: false,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("생일"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: birth,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("성별"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: gender,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  UserInfo info = UserInfo();
                  info.nickname = "test";
                  info.birth = "1993-04-01";
                  info.gender = "test";

                  manager
                      .updateUserData(info.toJson())
                      .then((value) => Navigator.pop(context, value));
                },
                child: const Text("가입"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
