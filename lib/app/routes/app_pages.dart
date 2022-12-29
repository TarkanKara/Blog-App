// ignore_for_file: constant_identifier_names

import 'package:blog_app/app/modules/home_page/home_binding.dart';
import 'package:blog_app/app/modules/home_page/home_view.dart';
import 'package:blog_app/app/modules/login_page/login_binding.dart';
import 'package:blog_app/app/modules/login_page/login_view.dart';
import 'package:blog_app/app/modules/sign_up_page/sign_up_binding.dart';
import 'package:blog_app/app/modules/sign_up_page/sign_up_view.dart';
import 'package:blog_app/app/modules/upload_blog/upload_blog_binding.dart';
import 'package:blog_app/app/modules/upload_blog/upload_blog_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.SIGNUP,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.HOMEVIEW,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.UPLOAD_BLOG,
      page: () => const UploadBlogView(),
      binding: UploadBlogBinding(),
    ),
  ];
}
