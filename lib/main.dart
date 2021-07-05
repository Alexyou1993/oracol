
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:oracol/src/models/index.dart';
import 'package:oracol/src/presentation/mixin/init_mixin.dart';
import 'package:oracol/src/presentation/routes.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(Oracol());
}

class Oracol extends StatefulWidget {
  @override
  _OracolState createState() => _OracolState();
}

class _OracolState extends State<Oracol> with InitMixin<Oracol>{


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Store<AppState>>(
      future: future,
      builder: (BuildContext context, AsyncSnapshot<Store<AppState>> snapshot) {
        if (snapshot.hasData) {
          final Store<AppState> store = snapshot.data;
          return StoreProvider<AppState>(
            store: store,
            child: MaterialApp(
              title: 'Oracol',
              theme: ThemeData.dark(),
              routes: AppRoutes.routes,
            ),
          );
        } else {
          if (snapshot.hasError) {
            throw snapshot.error;
          }
          return MaterialApp(
            title: 'Oracol',
            theme: ThemeData.dark(),
            home: const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
