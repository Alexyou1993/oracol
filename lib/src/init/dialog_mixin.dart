import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

mixin DialogMixin {
  Future<void> showErrorDialog(BuildContext context, String title, Object error) {
    if (Theme.of(context).platform == TargetPlatform.android) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(title),
            content: Text('$error'),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ok'),
              ),
            ],
          );
        },
      );
    } else {
      return showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: Text(title),
            content: Text('$error'),
            actions: <Widget>[
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('ok'),
              ),
            ],
          );
        },
      );
    }
  }
}
