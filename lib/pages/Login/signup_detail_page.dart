import 'package:flutter/material.dart';

class SignupDetailPage extends StatefulWidget {
  const SignupDetailPage({super.key});

  @override
  State<SignupDetailPage> createState() => _signupDetailPageState();
}

// ignore: camel_case_types
class _signupDetailPageState extends State<SignupDetailPage> {
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
                    child: TextFormField(expands: false),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("생일"),
                  SizedBox(
                    width: 300,
                    child: TextFormField(),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("성별"),
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
