import 'package:flutter/foundation.dart';
import 'package:oracol/src/actions/auth/index.dart';
import 'package:oracol/src/actions/index.dart';
import 'package:oracol/src/data/auth_api.dart';
import 'package:oracol/src/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/rxdart.dart';

class AuthEpics {
  const AuthEpics({@required AuthApi api})
      : assert(api != null),
        _api = api;

  final AuthApi _api;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      TypedEpic<AppState, Login$>(_login),
      TypedEpic<AppState, SignUp$>(_signUp),
    ]);
  }

  Stream<AppAction> _login(Stream<Login$> actions, EpicStore<AppState> store) {
    return actions //
      .flatMap((Login$ action) => Stream<Login$>.value(action)
    .asyncMap((Login$ action) => _api.login(email: action.email, password: action.password))
        .map((AppUser user) => Login.successful(user))
        .onErrorReturnWith((dynamic error) => Login.error(error))
        .doOnData(action.response));
  }

  Stream<AppAction> _signUp(Stream<SignUp$> actions, EpicStore<AppState> store) {
    return actions //
      .flatMap((SignUp$ action) => Stream<SignUp$>.value(action)
        .asyncMap((SignUp$ action) => _api.signUp(
        email: store.state.auth.info.email,
        password: store.state.auth.info.username,
        username: store.state.auth.info.username))
        .map((AppUser user) => SignUp.successful(user))
        .onErrorReturnWith((dynamic error) => SignUp.error(error))
    .doOnData(action.response));
  }
}
