// import 'package:flutter/material.dart';
// import 'package:huewoo/actions/LoadDB_ACtion.dart';
// import 'package:huewoo/pages/Start_page.dart';

// import 'Signup_page.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String id = '', password = '';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 50),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               "로그인",
//               style: TextStyle(
//                 fontSize: 30,
//                 fontWeight: FontWeight.w200,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               onChanged: (value) {
//                 id = value;
//               },
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             TextField(
//               onChanged: (value) {
//                 password = value;
//               },
//               obscureText: true,
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     Myfirebase.getUserInformationForLogin(
//                             logindata: {"id": id, 'password': password})
//                         .then((value) {
//                       if (value != null) {
//                         Navigator.of(context).pushAndRemoveUntil(
//                             MaterialPageRoute(
//                               builder: (context) => StartPage(
//                                 userCol: value,
//                               ),
//                             ),
//                             (Route<dynamic> route) => false);
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: const Text("입력된 정보를 다시 확인해 주세요."),
//                             action: SnackBarAction(
//                               label: '닫기',
//                               onPressed: () {},
//                             ),
//                           ),
//                         );
//                       }
//                     });
//                   },
//                   child: const Text("로그인"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () => Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => const SignupPage(),
//                       )),
//                   child: const Text("회원가입"),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
