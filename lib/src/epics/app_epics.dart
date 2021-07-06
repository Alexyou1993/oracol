import 'package:flutter/foundation.dart';
import 'package:oracol/src/data/auth_api.dart';
import 'package:oracol/src/data/post_api.dart';
import 'package:oracol/src/epics/auth_epics.dart';
import 'package:oracol/src/epics/posts_episc.dart';
import 'package:oracol/src/models/index.dart';
import 'package:redux_epics/redux_epics.dart';

class AppEpics {
  const AppEpics({@required AuthApi authApi, @required PostsApi postsApi})
      : assert(authApi != null),
        assert(postsApi != null),
        _authApi = authApi,
        _postsApi = postsApi;

  final AuthApi _authApi;
  final PostsApi _postsApi;

  Epic<AppState> get epics {
    return combineEpics<AppState>(<Epic<AppState>>[
      AuthEpics(api: _authApi).epics,
      PostsEpics(api: _postsApi).epics,
    ]);
  }
}
