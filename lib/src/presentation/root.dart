import 'package:flutter/cupertino.dart';
import 'package:oracol/src/containers/auth/index.dart';
import 'package:oracol/src/models/auth/index.dart';
import 'package:oracol/src/presentation/home/home_page.dart';
import 'package:oracol/src/presentation/login/login_page.dart';

class Root extends StatelessWidget {
  const Root({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserContainer(
      builder: (BuildContext context, AppUser user) {
        if (user == null) {
          return const LoginPage();
        } else {
          return const HomePage();
        }
      },
    );
  }
}
