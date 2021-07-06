import 'package:built_collection/built_collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:oracol/src/models/auth/index.dart';
import 'package:oracol/src/data/index.dart';

class AuthApi {
  const AuthApi(
      {@required FirebaseAuth auth, @required FirebaseFirestore firestore, @required GoogleSignIn googleSignIn})
      : assert(auth != null),
        assert(firestore != null),
        assert(googleSignIn != null),
        _auth = auth,
        _firestore = firestore,
        _googleSignIn = googleSignIn;

  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;
  final GoogleSignIn _googleSignIn;

  Future<AppUser> login({@required String email, @required String password}) async {
    final UserCredential response = await _auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = response.user;

    final DocumentSnapshot snapshot = await _firestore.doc('users/${user.uid}').get();
    return AppUser.fromJson(snapshot.data());
  }

  Future<AppUser> signUp({@required String email, @required String password, @required String username}) async {
    final UserCredential response = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    final User user = response.user;

    final AppUser appUser = AppUser((AppUserBuilder b) {
      b
        ..uid = user.uid
        ..username = username
        ..email = user.email
        ..searchIndex = ListBuilder<String>(<String>[username].searchIndex);
    });

    await _firestore.doc('users/${user.uid}').set(appUser.json);

    return appUser;
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  Future<AppUser> signInWithGoogle() async {
    final GoogleSignInAccount googleAccount = await _googleSignIn.signIn();

    if (googleAccount == null) {
      return null;
    }
    final GoogleSignInAuthentication authentication = await googleAccount.authentication;
    final OAuthCredential credential =
        GoogleAuthProvider.credential(idToken: authentication.idToken, accessToken: authentication.accessToken);

    final UserCredential response = await _auth.signInWithCredential(credential);
    final User user = response.user;

    final DocumentSnapshot snapshot = await _firestore.doc('user${user.uid}').get();

    if (snapshot.exists) {
      return AppUser.fromJson(snapshot.data());
    }

    final AppUser appUser = AppUser((AppUserBuilder b) {
      b
        ..uid = user.uid
        ..email = user.email
        ..username = user.email.split('@').first
        ..photoUrl = user.photoURL
        ..searchIndex = ListBuilder<String>(<String>[user.email.split('@').first].searchIndex);
    });

    await _firestore.doc('users${user.uid}').set(appUser.json);
    return appUser;
  }

  Future<void> resetPassword(String email) {
    return _auth.sendPasswordResetEmail(email: email);
  }

  Future<List<AppUser>> searchUsers(String query) async {
    final QuerySnapshot snapshot =
        await _firestore.collection('users').where('searchIndex', arrayContains: query).get();
    return snapshot.docs //
        .map((QueryDocumentSnapshot snapshot) => AppUser.fromJson(snapshot.data()))
        .toList();
  }
}
