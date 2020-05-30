import 'package:StreetCoffee/screens/LoginScreens/LoginScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(StreetCoffee());

class StreetCoffee extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Street Coffee",
      debugShowCheckedModeBanner: true,
      home: LoginScreen(),
    );
  }
  
}