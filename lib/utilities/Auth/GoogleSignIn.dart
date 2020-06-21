// MIT License

// Copyright (c) 2020 Rebus Dev

// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import 'package:StreetCoffee/utilities/Auth/AuthUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    
    AuthUserLogic().checkSaveSesion(_rememberMe, email);
    AuthUserLogic().saveDataDB('', email);
}

void signOutGoogle() async{
  await googleSignIn.signOut();

  print("User Sign Out");
}