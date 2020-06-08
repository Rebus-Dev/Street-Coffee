import 'package:StreetCoffee/screens/LoginScreens/LoginScreen.dart';
import 'package:StreetCoffee/screens/MenuDashboardLayout/MenuDashboardLayout.dart';
import 'package:StreetCoffee/utilities/Auth/AuthDataInstancce.dart';

import 'package:flutter/material.dart';

SaveAndRead getUserLogined = new SaveAndRead();

void main() => runApp(
  StreetCoffee()
);

class StreetCoffee extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    Widget _defaultPage = LoginScreen();

    final _userLogin = getUserLogined.read();
    
    _userLogin.then((value) { 
      if (value) {
        _defaultPage = MenuDashboardLayout();
      }
    });
    
    return MaterialApp(
      title: "Street Coffee",
      debugShowCheckedModeBanner: true,
      home: _defaultPage,
    );
  }
  
}
