import 'package:flutter/cupertino.dart';
import 'package:oracol/src/actions/index.dart';
import 'package:oracol/src/presentation/home.dart';
import 'package:oracol/src/presentation/login/reset_password_page.dart';
import 'package:oracol/src/presentation/sign_up/sign_up_page.dart';
import 'package:oracol/src/presentation/sign_up/username_page.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static const String home = '/';
  static const String username = '/username';
  static const String signUp = '/signUp';
  static const String resetPassword = '/resetPassword';

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) {
      return const Home();
    },
    username: (BuildContext context){
      return const UsernamePage();
    },
    signUp: (BuildContext context){
      return const SignUpPage();
    },
    resetPassword: (BuildContext context){
      return const ResetPasswordPage();
    }
  };
}