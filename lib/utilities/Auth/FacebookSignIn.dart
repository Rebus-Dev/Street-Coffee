// import 'dart:async';

// import 'package:StreetCoffee/screens/MenuDashboardLayout/MenuDashboardLayout.dart';
// import 'package:flutter_facebook_login/flutter_facebook_login.dart';
// import 'package:flutter/material.dart';

// import 'AuthUser.dart';

// class FacebookSignIn {
//   BuildContext context;
//   bool _rememberMe;

//   FacebookSignIn(BuildContext context, bool _rememberMe) {
//     this.context = context;
//     this._rememberMe = _rememberMe;
//   }

//   static final FacebookLogin facebookSignIn = new FacebookLogin();

//   Future<Null> login() async {
//     final FacebookLoginResult result =
//         await facebookSignIn.logIn(['email']);

//     switch (result.status) {
//       case FacebookLoginStatus.loggedIn:
//         final FacebookAccessToken accessToken = result.accessToken;

//         AuthUserLogic().checkSaveSesion(_rememberMe, accessToken.userId);
//         AuthUserLogic().saveDataDB('', '', accessToken.userId);
        
//         Navigator.push(
//           context,
//           new MaterialPageRoute(
//             builder: (context) => MenuDashboardLayout()
//           ),
//         );

//         break;  
//       case FacebookLoginStatus.cancelledByUser:
//         break;
//       case FacebookLoginStatus.error:
//         break;
//     }
//   }
// }
