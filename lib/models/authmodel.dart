import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sicklesmart/models/firestoremodel.dart';

class Authentication {
  // For Authentication related functions you need an instance of FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FireStore _fireStore = FireStore();

  //  It will be used to check if the user is logged in or not.
  Stream<User?> get authStateChange => _auth.authStateChanges();

  get currentUser => _auth.currentUser;
  Future<User?> getCUser() async {
    return _auth.currentUser;
  }

  bool get isUserLoggedIn => _auth.currentUser != null;

  //  SigIn the user using Email and Password
  Future<void> signInWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (context.mounted) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: const Text('Error Occurred'),
            content: Text(e.toString()),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: const Text("OK"))
            ],
          ),
        );
      }
    }
  }

  // SignUp the user using Email and Password
  Future<void> signUpWithEmailAndPassword(
      String email, String password, BuildContext context) async {
    try {
      _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                  title: const Text('Error Occurred'),
                  content: Text(e.toString()),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: const Text("OK"))
                  ]));
    } catch (e) {
      if (e == 'email-already-in-use') {
        debugPrint('Email already in use.');
      } else {
        debugPrint('Error: $e');
      }
    }
  }

  Future<dynamic> signInWithGoogle(BuildContext context, bool isPatient) async {
    try {
      // Trigger the authentication flow
      GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        return null;
      }
      // Obtain the auth details from the request
      GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      if (!isPatient) {
        var querySnapshot = await _fireStore.db
            .collection("users")
            .where("guardianEmail", isEqualTo: googleUser.email)
            .limit(1)
            .get();
        if (querySnapshot.docs.isEmpty) {
          signOut();
          return "not found";
        }
      }

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        debugPrint(googleUser.email.toString());
        await _auth.signInWithCredential(credential);
      } on FirebaseAuthException catch (e) {
        if (context.mounted) {
          await showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: const Text('Error Occurred'),
              content: Text(e.toString()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: const Text("OK"))
              ],
            ),
          );
        }
      }
      // Add a return statement here
      return "success";
    } catch (e) {
      debugPrint('Error: $e');
      // Add a return statement here
      return "error";
    }
  }

  //  SignOut the current user
  Future<void> signOut() async {
    // SignOut the current user
    if (await GoogleSignIn().isSignedIn()) {
      await GoogleSignIn().disconnect();
    }
    await _auth.signOut();
  }
}
