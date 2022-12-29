// ignore_for_file: unused_field, unused_local_variable

import 'package:blog_app/utils/indicator.dart';
import 'package:blog_app/utils/show_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../app/routes/routes.dart';

class FirebaseFunctions {
  //Cloud FireStore & Firebase Auth
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Cloud FireStore Users
  Future<void> createUserCredential(String name, String email) async {
    try {
      //UsersMap
      Map<String, dynamic> userDetail = {
        "uid": _auth.currentUser!.uid,
        "name": name,
        "email": email,
      };
      await _firebaseFirestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .set(userDetail)
          .then((value) {
        Indicator.closeLoading();
        Get.toNamed(Routes.HOMEVIEW);
      });
    } catch (e) {
      showAlert(e.toString());
    }
  }
}
