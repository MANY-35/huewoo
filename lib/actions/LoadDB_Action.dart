import 'package:cloud_firestore/cloud_firestore.dart';

class Myfirebase {
  static final userscol = FirebaseFirestore.instance.collection("users");

  static Future<Map<String, dynamic>> connetingFirebase(List categories) async {
    QuerySnapshot querySnapshot = await userscol.get();
    final allData =
        querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>);
    Map<String, dynamic> db = {};
    for (var category in categories) {
      db[category] = getUsersInformationListAt(allData, category);
    }
    print(db);
    return db;
  }

  static List<String> getUsersInformationListAt(var allData, String s) {
    List<String> infoList = [];
    for (var data in allData) {
      infoList.add(data[s]);
    }
    return infoList;
  }

  static getUserInformationForLogin(
      {required Map<String, dynamic> logindata}) async {
    var usercol = await userscol.get().then(
      (var docs) {
        for (var doc in docs.docs) {
          final data = doc.data();

          if (data['id'] == logindata['id'] &&
              data['password'] == logindata['password']) {
            return doc.id;
          }
        }
      },
      onError: (e) => print("Error getting document: $e"),
    );
    return usercol;
  }

  //firebase 업로드
  static updateFirebase(Map<String, dynamic> data) {
    userscol
        .add(data)
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }
}
