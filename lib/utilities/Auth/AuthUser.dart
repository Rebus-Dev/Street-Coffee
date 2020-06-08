import 'package:firebase_auth/firebase_auth.dart';
import 'package:StreetCoffee/screens/MenuDashboardLayout/MenuDashboardLayout.dart';
import 'package:flutter/material.dart';

class AuthUserLogic {
  void checkUserEnterCode(BuildContext context, TextEditingController _codeController, FirebaseAuth _auth, String verificationId) async {
    final code = _codeController.text.trim();
    AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: verificationId, smsCode: code);

    AuthResult result;
    
    try {
      result = await _auth.signInWithCredential(credential);
    }
    catch (PlatformException) {
      print("Invalid Enter Code!!!");

      return;
    }

    FirebaseUser user = result.user;

    if (user != null) {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MenuDashboardLayout(user: user,)
      ));
    } else {
      print("Error");

      return;
    }
  }

  void verificationNumberSuccess(AuthCredential credential, BuildContext context, FirebaseAuth _auth) async {
    Navigator.of(context).pop();

    AuthResult result = await _auth.signInWithCredential(credential);

    FirebaseUser user = result.user;

    if (user != null){
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MenuDashboardLayout(user: user,)
      ));
    } else {
      print("Error");
    }
  }

  void verificationFailed(AuthException exception) {
    print(exception.message);
  }
}

class AuthUser {
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) {
          AuthUserLogic().verificationNumberSuccess(credential, context, _auth);
        },
        verificationFailed: (AuthException exception) {
          AuthUserLogic().verificationFailed(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: Text("Введіть код з смс"),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      controller: _codeController,
                    ),
                  ],
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text("Пітвердити!"),
                    textColor: Colors.white,
                    color: Color(0xFF04B47C),
                    onPressed: () {
                      AuthUserLogic().checkUserEnterCode(
                        context,
                        _codeController,
                        _auth,
                        verificationId
                      );
                    },
                  )
                ],
              );
            }
          );
        },
        codeAutoRetrievalTimeout: null
    );
  }
}