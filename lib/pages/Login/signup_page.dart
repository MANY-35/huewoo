import 'package:flutter/material.dart';
import 'package:huewoo/actions/LoadDB_Action.dart';
import 'package:huewoo/pages/Login/signup_detail_page.dart';

class SignupPage extends StatefulWidget {
  final Services eService;
  final String uid;
  const SignupPage({required this.eService, required this.uid, super.key});

  @override
  State<SignupPage> createState() => _signupPageState();
}

// ignore: camel_case_types
class _signupPageState extends State<SignupPage> {
  FirebaseManage manager = FirebaseManage();
  TextEditingController id = TextEditingController();
  TextEditingController passwrd = TextEditingController();

  Future<String> getUserKey() async {
    return await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const SignupDetailPage()));
  }

  signUpCustom() async {
    getUserKey().then((value) {
      manager
          .updataLoginInfoCustom(
              password: passwrd.text, uid: id.text, key: value)
          .then((value) {
        if (value) {
          Navigator.pop(context);
        }
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //빌드 되기전에 다른 state를 포스트하기 위해 사용하는 함수
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.eService != Services.custom) {
        getUserKey().then((value) {
          manager
              .updataLoginInfo(
                  service: widget.eService, uid: widget.uid, key: value)
              .then((value) {
            if (value) {
              Navigator.pop(context);
            }
          });
        });
      }
    });
  }

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
                  const Text("아이디"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: id,
                      expands: false,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("비밀번호"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(
                      controller: passwrd,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: signUpCustom,
                child: const Text("가입"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
