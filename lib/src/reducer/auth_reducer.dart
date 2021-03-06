import 'package:built_collection/built_collection.dart';
import 'package:oracol/src/actions/auth/index.dart';
import 'package:oracol/src/models/auth/index.dart';
import 'package:redux/redux.dart';

Reducer<AuthState> authReducer = combineReducers(<Reducer<AuthState>>[
  TypedReducer<AuthState, LoginSuccessful>(_loginSuccessful),
  TypedReducer<AuthState, SignUpSuccessful>(_signUpSuccessful),
  TypedReducer<AuthState, UpdateRegistrationInfo>(_updateRegistrationInfo),
  TypedReducer<AuthState, SignUpWithGoogleSuccessful>(_signUpWithGoogleSuccessful),
  TypedReducer<AuthState, SearchUsersSuccessful>(_searchUsersSuccessful),
]);

AuthState _loginSuccessful(AuthState state, LoginSuccessful action) {
  return state.rebuild((AuthStateBuilder b) => b.user = action.user.toBuilder());
}

AuthState _signUpSuccessful(AuthState state, SignUpSuccessful action) {
  return state.rebuild((AuthStateBuilder b) => b.user = action.user.toBuilder());
}

AuthState _updateRegistrationInfo(AuthState state, UpdateRegistrationInfo action) {
  return state.rebuild((AuthStateBuilder b) {
    if (action.email != null) {
      b.info.email = action.email;
    } else if (action.password != null) {
      b.info.password = action.password;
    } else if (action.username != null) {
      b.info.username = action.username;
    } else {
      b.info = RegistrationInfo().toBuilder();
    }
  });
}

AuthState _signUpWithGoogleSuccessful(AuthState state, SignUpWithGoogleSuccessful action) {
  return state.rebuild((AuthStateBuilder b) => b.user = action.user?.toBuilder());
}

AuthState _searchUsersSuccessful(AuthState state, SearchUsersSuccessful action) {
  return state.rebuild((AuthStateBuilder b) {
    b.searchResult = ListBuilder<AppUser>(action.users);
  });
}
