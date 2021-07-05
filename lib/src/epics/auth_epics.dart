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
      TypedEpic<AppState, SignOut$>(_signOut),
      TypedEpic<AppState, SignUpWithGoogle$>(_signUpWithGoogle),
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

  Stream<AppAction> _signOut(Stream<SignOut$> actions, EpicStore<AppState> store) {
    return actions.flatMap((SignOut$ action) => Stream<SignOut$>.value(action)
        .asyncMap((SignOut$ action) => _api.signOut())
        .mapTo(const SignOut.successful())
        .onErrorReturnWith((dynamic error) => SignOut.error(error)));
  }

  Stream<AppAction> _signUpWithGoogle(Stream<SignUpWithGoogle$> actions, EpicStore<AppState> store) {
    return actions //
        .flatMap((SignUpWithGoogle$ action) => Stream<SignUpWithGoogle$>.value(action)
            .asyncMap((SignUpWithGoogle$ action) => _api.signInWithGoogle())
            .map((AppUser user) => SignUpWithGoogle.successful(user))
            .onErrorReturnWith((dynamic error) => SignUpWithGoogle.error(error))
            .doOnData(action.response));
  }
}
