// ignore_for_file: unused_field, unused_local_variable, avoid_print, prefer_final_fields

import 'dart:io';

import 'package:blog_app/app/models/blog_models.dart';
import 'package:blog_app/utils/constant.dart';
import 'package:blog_app/utils/indicator.dart';
import 'package:blog_app/utils/show_alert.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../app/routes/routes.dart';

class FirebaseFunctions {
  //Cloud FireStore & Firebase Auth & FirebaseStorage
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final ScrollController _scrollController = ScrollController();
  DocumentSnapshot? _lastDocument;

  //
  bool _hasMoreData = true;
  var isLoading = false.obs;
  int _documentLimit = 10;

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
    Reference refrence;
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

  //getBlogs
  Future<List<BlogsModel>> getBlogs() async {
    if (_hasMoreData) {
      if (!isLoading.value) {
        try {
          if (_lastDocument == null) {
            return await _firebaseFirestore
                .collection("blogs")
                .orderBy("time")
                .limit(_documentLimit)
                .get()
                .then((value) {
              _lastDocument = value.docs.last;
              if (value.docs.length < _documentLimit) {
                _hasMoreData = false;
              }
              Indicator.closeLoading();

              return value.docs
                  .map((e) => BlogsModel.fromJson(e.data()))
                  .toList();
            });
          } else {
            isLoading.value = true;

            return await _firebaseFirestore
                .collection("blogs")
                .orderBy("time")
                .startAfterDocument(_lastDocument!)
                .limit(_documentLimit)
                .get()
                .then((value) {
              _lastDocument = value.docs.last;

              if (value.docs.length < _documentLimit) {
                _hasMoreData = false;
              }
              isLoading.value = false;
              return value.docs
                  .map((e) => BlogsModel.fromJson(e.data()))
                  .toList();
            });
          }
        } catch (e) {
          showAlert("$e");
          print("$e");
          return [];
        }
      } else {
        return [];
      }
    } else {
      print("Veri Bulunamadı");
      return [];
    }
  }
}
