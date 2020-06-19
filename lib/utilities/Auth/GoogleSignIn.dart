import 'package:StreetCoffee/utilities/Auth/AuthUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

Future<void> signInWithGoogle(bool _rememberMe) async {
    GoogleSignInAccount googleUser;
    try {
      googleUser = await googleSignIn.signIn();
    } catch (e) {
      switch (e.code) {
        case 'ERROR_USER_DISABLED':
          print('Google Sign-In error: User disabled');
          break;
        case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
          print('Google Sign-In error: Account already exists with a different credential.');
          break;
        case 'ERROR_INVALID_CREDENTIAL':
          print('Google Sign-In error: Invalid credential.');
          break;
        case 'ERROR_OPERATION_NOT_ALLOWED':
          print('Google Sign-In error: Operation not allowed.');
          break;        
        default:
          print('Google Sign-In error');
          break;
      }

    }

    if (googleUser == null) {
      return;
    }
    
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken);
     
    var user = await _auth.signInWithCredential(credential);
    var email = user.user.email;
    
    if (_rememberMe) {
      AuthUserLogic().checkSaveSesion(_rememberMe, email);
      AuthUserLogic().saveDataDB('', email);
    } else {
      AuthUserLogic().saveDataDB('', email);
    }
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}