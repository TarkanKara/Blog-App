// ignore_for_file: unused_field, avoid_print

import 'package:blog_app/utils/show_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../app/routes/app_pages.dart';

class AuthService extends GetxService {
  //AutService
  Future<AuthService> init() async {
    return this;
  }

  //Firebase instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //Create Account
  Future<void> createAccount(String email, String password) async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Get.offAllNamed(Routes.LOGIN);
        showAlert("Kayıt Başaralı");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showAlert("Sağlanan parola çok zayıf.");
      } else if (e.code == 'email-already-in-use') {
        showAlert("Bu e-posta için hesap zaten var");
      }
    } catch (e) {
      print(e);
    }
  }

  //Login Users
  Future<void> login(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Get.offAllNamed(Routes.HOMEVIEW);
        showAlert("Kullanıcı Girişi Başaralı");
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showAlert("Hatalı Email");
      } else if (e.code == 'wrong-password') {
        showAlert("Yanlış Şifre Girdiniz.");
      }
    }
  }

  //Users LogOut
  Future<void> logOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print(e);
    }
  }
}
