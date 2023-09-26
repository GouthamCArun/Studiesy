// ignore_for_file: use_build_context_synchronously
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:studiesy/Ui/navigation.dart';

import 'Ui/Auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  //register with email and password
  Future registerWithEmailAndPassword(
      String email, String password, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationPage(),
        ),
      );
    } catch (e) {
      AlertDialog(
        title: Text("Register error: $e"),
      );
      return null;
    }
  }

  //sign in with email and password
  Future signInWithEmailAndPassword(
      String email, String password, context) async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationPage(),
        ),
      );
    } catch (e) {
      AlertDialog(
        title: Text("Sign in error: $e"),
      );
      return null;
    }
  }

  //sign out
  Future signOut(context) async {
    try {
      await _auth.signOut();
      GoogleSignIn().signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Authentication(),
        ),
      );
    } catch (e) {
      AlertDialog(
        title: Text("Sign out error: $e"),
      );
      return null;
    }
  }

//GOOGLE SIGN IN

  Future<String> signInogWithGoogle(BuildContext context) async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    var authResult =
        await FirebaseAuth.instance.signInWithCredential(credential);

    var user = authResult.user;
    if (authResult.additionalUserInfo!.isNewUser) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationPage(),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const NavigationPage(),
        ),
      );
    }
    return 'signInWithGoogle succeded: $user';
  }
}
