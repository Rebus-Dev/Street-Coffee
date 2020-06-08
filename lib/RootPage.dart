import 'package:StreetCoffee/screens/LoginScreens/LoginScreen.dart';
import 'package:StreetCoffee/screens/MenuDashboardLayout/MenuDashboardLayout.dart';
import 'package:StreetCoffee/utilities/Auth/AuthDataInstancce.dart';
import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  
  @override
  State<StatefulWidget> createState() => new _RootPageState();
}

enum AuthStatus {
  notSignedIn,
  signedIn,
}

class _RootPageState extends State<RootPage> {

  SaveAndRead userSignIn = new SaveAndRead();
  AuthStatus authStatus = AuthStatus.notSignedIn;

  initState() {
    super.initState();
    userSignIn.read().then((userId) {
      setState(() {
        if (userId) {
          authStatus = AuthStatus.signedIn;
        } else {
          authStatus = AuthStatus.notSignedIn;
        }       
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    switch (authStatus) {
      case AuthStatus.notSignedIn:
        return new LoginScreen();
      case AuthStatus.signedIn:
        return new MenuDashboardLayout();
    }
  }
}