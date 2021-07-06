import 'package:flutter/cupertino.dart';
import 'package:oracol/src/presentation/login/reset_password_page.dart';
import 'package:oracol/src/presentation/posts/create_post.dart';
import 'package:oracol/src/presentation/posts/post_details.dart';
import 'package:oracol/src/presentation/root.dart';
import 'package:oracol/src/presentation/sign_up/password_page.dart';
import 'package:oracol/src/presentation/sign_up/sign_up_page.dart';
import 'package:oracol/src/presentation/sign_up/username_page.dart';
import 'package:oracol/src/presentation/widgets/search_users_page.dart';

// ignore: avoid_classes_with_only_static_members
class AppRoutes {
  static const String home = '/';
  static const String username = '/username';
  static const String signUp = '/signUp';
  static const String resetPassword = '/resetPassword';
  static const String createPost = '/createPost';
  static const String postDetails = '/postDetails';
  static const String password = '/password';
  static const String searchUsers = '/searchUsers';

  static Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
    home: (BuildContext context) {
      return const Root();
    },
    username: (BuildContext context) {
      return const UsernamePage();
    },
    signUp: (BuildContext context) {
      return const SignUpPage();
    },
    resetPassword: (BuildContext context) {
      return const ResetPasswordPage();
    },
    password: (BuildContext context) {
      return const PasswordPage();
    },
    createPost: (BuildContext context) {
      return const CreatePost();
    },
    postDetails: (BuildContext context) {
      return const PostDetails();
    },
    searchUsers: (BuildContext context) {
      return const SearchUsersPage();
    }
  };
}
