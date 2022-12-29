// ignore_for_file: unused_local_variable, no_leading_underscores_for_local_identifiers

import 'package:blog_app/app/modules/login_page/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/app_pages.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          loginBackgroundTopCircle(width, height),
          loginBackgroundBottomCircle(height, width),
          SizedBox(
            height: height,
            width: width,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 70),
                child: Column(
                  children: [
                    Text("SIGN IN",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontSize: 25, fontWeight: FontWeight.bold)),
                    loginAvatar(),
                    Container(
                      height: 250,
                      margin: const EdgeInsets.only(top: 40),
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 1,
                              spreadRadius: 1,
                              offset: const Offset(0, 2)),
                        ],
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            textField(
                              context,
                              "EMAIL ADDRESS",
                              "EMAIL",
                              "abc@gmail.com",
                              false,
                              controller.login_email,
                            ),
                            const SizedBox(height: 20),
                            textField(
                              context,
                              "PASSWORD",
                              "PASSWORD",
                              "ABC123",
                              true,
                              controller.login_password,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      child: Column(
                        children: const [
                          Text("Forget Password ?",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  decoration: TextDecoration.underline)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        backgroundColor: Colors.greenAccent,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 45, vertical: 10),
                      ),
                      onPressed: () {
                        controller.onLogin();
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "LOGIN",
                            style:
                                Theme.of(context).textTheme.headline2!.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                          ),
                          const Icon(Icons.login_rounded)
                        ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: RichText(
                        text: TextSpan(
                          text: "Don't have an account? ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(fontSize: 18, color: Colors.grey),
                          children: const [
                            TextSpan(
                                text: " Sign Up",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  //TextField
  Widget textField(BuildContext context, String text, String labelText,
      String hintText, bool isPassword, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: Colors.grey.shade600,
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
          const SizedBox(height: 5),
          TextField(
              controller: controller,
              obscureText: isPassword,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.shade200,
                  hintText: hintText,
                  labelText: labelText,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey)))),
        ],
      ),
    );
  }

  Widget loginAvatar() {
    return Container(
      margin: const EdgeInsets.only(top: 25),
      width: 120,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade600,
        borderRadius: BorderRadius.circular(40),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 4,
              blurRadius: 25),
        ],
      ),
      child: const Center(
        child: Icon(Icons.person_outline, size: 70, color: Colors.white),
      ),
    );
  }

  //Bottom Circle
  Widget loginBackgroundBottomCircle(double height, double width) {
    return Positioned(
        top: height - width / 1.5,
        right: width / 2.1,
        child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
                color: Colors.blueAccent.withOpacity(0.20),
                borderRadius: BorderRadius.circular(width))));
  }

  //Top Circle
  Widget loginBackgroundTopCircle(double width, double height) {
    return Positioned(
      top: 0,
      child: Transform.translate(
        offset: Offset(0.0, -width / 0.6),
        child: Transform.scale(
          scale: 1.1,
          child: Container(
              height: height,
              width: width,
              decoration: BoxDecoration(
                  color: Colors.greenAccent,
                  borderRadius: BorderRadius.circular(width))),
        ),
      ),
    );
  }
}
