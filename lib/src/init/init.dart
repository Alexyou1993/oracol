import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oracol/src/data/auth_api.dart';
import 'package:oracol/src/data/post_api.dart';
import 'package:oracol/src/epics/app_epics.dart';
import 'package:oracol/src/models/index.dart';
import 'package:oracol/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

Future<Store<AppState>> init() async {
  await Firebase.initializeApp();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  final AuthApi authApi = AuthApi(auth: auth, firestore: firestore, googleSignIn: googleSignIn);
  final FirebaseStorage storage = FirebaseStorage.instance;
  final PostsApi postsApi = PostsApi(firestore: firestore, storage: storage);
  final AppEpics epic = AppEpics(authApi: authApi, postsApi: postsApi);

  return Store<AppState>(
    reducer,
    initialState: AppState.initialState(),
    middleware: <Middleware<AppState>>[
      EpicMiddleware<AppState>(epic.epics),
    ],
  );
}
