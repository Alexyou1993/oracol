import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oracol/src/actions/auth/index.dart';
import 'package:oracol/src/actions/index.dart';
import 'package:oracol/src/models/index.dart';
import 'package:oracol/src/presentation/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _page = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.power_settings_new),
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(
                const SignOut(),
              );
            },
          ),
        ],
      ),
      body: <Widget>[
        Container(color: Colors.red),
        Container(color: Colors.green),
        Container(color: Colors.blue),
        Container(color: Colors.yellow),
        Container(color: Colors.orange),
      ][_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        onTap: (int i) async {
          if (i == 2) {
            final PickedFile file = await ImagePicker().getImage(source: ImageSource.gallery);
            if (file != null) {
              StoreProvider.of<AppState>(context).dispatch(UpdatePostInfo(addImage: file.path));
              Navigator.pushNamed(context, AppRoutes.createPost);
            }
          } else {
            setState(() {
              _page = i;
            });
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        ],
      ),
    );
  }
}
