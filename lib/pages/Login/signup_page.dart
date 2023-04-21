import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _signupPageState();
}

// ignore: camel_case_types
class _signupPageState extends State<SignupPage> {
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
                    child: TextFormField(expands: false),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("비밀번호"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
