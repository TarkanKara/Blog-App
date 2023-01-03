// ignore_for_file: constant_identifier_names

import 'package:blog_app/app/modules/authentication/authentication_bindign.dart';
import 'package:blog_app/app/modules/authentication/authentitaciton.dart';
import 'package:blog_app/app/modules/blog_detail/blog_detail_binding.dart';
import 'package:blog_app/app/modules/blog_detail/blog_detail_view.dart';
import 'package:blog_app/app/modules/home_page/home_binding.dart';
import 'package:blog_app/app/modules/home_page/home_view.dart';
import 'package:blog_app/app/modules/login_page/login_binding.dart';
import 'package:blog_app/app/modules/login_page/login_view.dart';
import 'package:blog_app/app/modules/my_blogs_page/my_blogs_binding.dart';
import 'package:blog_app/app/modules/my_blogs_page/my_blogs_view.dart';
import 'package:blog_app/app/modules/my_favourite_page/my_favourite_binding.dart';
import 'package:blog_app/app/modules/my_favourite_page/my_favourite_view.dart';
import 'package:blog_app/app/modules/profile_page/profile_binding.dart';
import 'package:blog_app/app/modules/profile_page/profile_view.dart';
import 'package:blog_app/app/modules/sign_up_page/sign_up_binding.dart';
import 'package:blog_app/app/modules/sign_up_page/sign_up_view.dart';
import 'package:blog_app/app/modules/upload_blog/upload_blog_binding.dart';
import 'package:blog_app/app/modules/upload_blog/upload_blog_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.AUTENTICATION;

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
      name: Routes.AUTENTICATION,
      page: () => const AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: Routes.HOMEVIEW,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.UPLOAD_BLOG,
      page: () => UploadBlogView(),
      binding: UploadBlogBinding(),
    ),
    GetPage(
      name: Routes.BLOG_DETAIL_VIEW,
      page: () => const BlogDetailView(),
      binding: BlogDetailBinding(),
    ),
    GetPage(
      name: Routes.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: Routes.MY_BLOGS,
      page: () => const MyBlogsView(),
      binding: MyBlogsBinding(),
    ),
    GetPage(
      name: Routes.MY_FAVOURITE,
      page: () => const MyFavouriteView(),
      binding: MyFavouriteBinding(),
    ),
  ];
}
