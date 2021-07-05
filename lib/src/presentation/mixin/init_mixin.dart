import 'dart:async';

import 'package:flutter/material.dart';
import 'package:oracol/src/init/init.dart';
import 'package:oracol/src/models/index.dart';
import 'package:redux/redux.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutter/cupertino.dart';

mixin InitMixin<S extends StatefulWidget> on State<S> {
  final Completer<Store<AppState>> _completer = Completer<Store<AppState>>();

  @override
  void initState() {
    super.initState();
    _initState();
  }

  Future<void> _initState() async {
    final List<dynamic> result = await ConcatStream<dynamic>(<Stream<dynamic>>[
      init().asStream(),
      Future<void>.delayed(const Duration(seconds: 3)).asStream(),
    ]).toList();

    _completer.complete(result[0]);
  }

  Future<Store<AppState>> get future => _completer.future;
}
