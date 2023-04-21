import 'package:flutter/material.dart';
import 'package:huewoo/pages/Login/main_login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  KakaoSdk.init(
    nativeAppKey: 'a16d2144379aaa75426666afa09e2b5d',
    javaScriptAppKey: '5caa4adb1f250e569bbf76739f552ef7',
  );
  // print(await KakaoSdk.origin);

  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'App', home: MainLogin());
  }
}
