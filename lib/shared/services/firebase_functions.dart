// ignore_for_file: unused_field, unused_local_variable, avoid_print

import 'dart:io';

import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:blog_app/utils/show_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

import '../../app/routes/routes.dart';

class FirebaseFunctions {
  //Cloud FireStore & Firebase Auth & FirebaseStorage
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

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

  //Upload Blog - Firebase Store
  Future<void> uploadBlog(String title, description, File image) async {
    try {
      //
      String id = generateId();
      DateTime time = DateTime.now();

      //uploadImage to imageUrl
      String imageUrl = await uploadImage(image);

      //blogDeatils Map
      Map<String, dynamic> blogDeatils = {
        "id": id,
        "title": title,
        "desctiption": description,
        "img": imageUrl,
        "time": time,
      };

      await _firebaseFirestore.collection("blogs").doc(id).set(blogDeatils);
    } catch (e) {
      print("$e");
    }
  }

  //UploadImage FireStorage
  Future<String> uploadImage(File file) async {
    try {
      String imageName = generateId();

      var refrence = _storage.ref().child("/images").child("/$imageName.jpg");

      var uploadTask = await refrence.putFile(file);

      String url = await uploadTask.ref.getDownloadURL();

      return url;
    } catch (e) {
      print("$e");
      return "";
    }
  }
}
