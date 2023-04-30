import 'package:flutter/material.dart';
import 'package:huewoo/models/signup_model.dart';

class HomePage extends StatefulWidget {
  final UserInfo userinfo;

  const HomePage({required this.userinfo, super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    UserInfo userinfo = widget.userinfo;

    return Scaffold(
      body: Center(child: Text("success : ${userinfo.nickname}")),
    );
  }
}
