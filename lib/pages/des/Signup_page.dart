// import 'package:flutter/material.dart';
// import 'package:huewoo/widget/CategoryDrwaing_widget.dart';
// import '../actions/LoadDB_ACtion.dart';
// import '../models/signup_model.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({super.key});

//   @override
//   State<SignupPage> createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final GlobalKey<FormState> _signupkey = GlobalKey<FormState>();
//   late SignupModel model = SignupModel();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(50),
//         child: Form(
//           key: _signupkey,
//           child: FutureBuilder(
//             future: Myfirebase.connetingFirebase(["id", "nickname"]),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Column(
//                   children: [
//                     DrawingCategories.inputTextCategory(
//                       validator: (value) {
//                         if (value.length < 1) {
//                           return '필수사항입니다.';
//                         }

//                         for (var tmp in snapshot.data!["id"]) {
//                           if (tmp == value) {
//                             return "중복된아이디입니다.";
//                           }
//                         }
//                         return null;
//                       },
//                       onSaved: (newValue) {
//                         model.id = newValue;
//                       },
//                       text: "아이디",
//                     ),
//                     DrawingCategories.inputTextCategory(
//                       validator: (value) {
//                         if (value.length < 1) {
//                           return '필수사항입니다.';
//                         }
//                         String pattern =
//                             r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?~^<>,.&+=])[A-Za-z\d$@$!%*#?~^<>,.&+=]{8,15}$';
//                         RegExp regExp = RegExp(pattern);
//                         if (!regExp.hasMatch(value)) {
//                           return '특수문자, 대소문자, 숫자 포함 8자 이상 15자 이내로 입력하세요.';
//                         }
//                         return null;
//                       },
//                       onSaved: (newValue) {
//                         model.password = newValue;
//                       },
//                       text: "비밀번호",
//                     ),
//                     DrawingCategories.inputTextCategory(
//                       validator: (value) {
//                         if (value.length < 1) {
//                           return '필수사항입니다.';
//                         }

//                         for (var tmp in snapshot.data!["nickname"]) {
//                           if (tmp == value) {
//                             return "중복된닉네임입니다.";
//                           }
//                         }
//                         return null;
//                       },
//                       onSaved: (newValue) {
//                         model.nickname = newValue;
//                       },
//                       text: "닉네임",
//                     ),
//                     DrawingCategories.genderSelectCategory(
//                       onChanged: (value) {
//                         setState(() {
//                           model.gender = value;
//                         });
//                       },
//                       text: "성별",
//                       selected: model.gender,
//                     ),
//                     DrawingCategories.dateSelectCategory(
//                       onDateChangeCallback: (value) {
//                         setState(() {
//                           model.birth = value.toString().split(' ')[0];
//                         });
//                       },
//                       text: "생일",
//                     ),
//                     const SizedBox(
//                       height: 50,
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         if (model.birth == '') {
//                         } else if (_signupkey.currentState!.validate()) {
//                           _signupkey.currentState!.save();

//                           //데이터 베이스 저장
//                           Myfirebase.updateFirebase(model.toJson());

//                           //데이터 베이스 저장 완료
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: const Text("완료"),
//                               action: SnackBarAction(
//                                 label: '닫기',
//                                 onPressed: () {},
//                               ),
//                             ),
//                           );
//                           // 페이지 이동 추가필요
//                         } else {
//                           // 입력 오류시 스넥바 출력
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: const Text("입력된 정보를 다시 확인해 주세요."),
//                               action: SnackBarAction(
//                                 label: '닫기',
//                                 onPressed: () {},
//                               ),
//                             ),
//                           );
//                         }
//                       },
//                       child: const Text("회원가입"),
//                     )
//                   ],
//                 );
//               }
//               return const Center(
//                 child: CircularProgressIndicator(), // 로딩 이미지 가운데
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
