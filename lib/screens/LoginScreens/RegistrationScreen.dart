import 'dart:core';
import 'package:flutter/material.dart';

import 'package:StreetCoffee/utilities/Widget/DataFields.dart';
import 'package:StreetCoffee/utilities/Widget/Button.dart';
 
class RegistrationScreen extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF04B47C),
        title: Text(
          "Рестрація",
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF04B47C),
                  Color(0xFF03A06E),
                  Color(0xFF038C61),
                  Color(0xFF027853),
                ],
                stops: [
                  0.1,
                  0.4,
                  0.7,
                  0.9
                ]
              )
            ),
          ),
          _buildMainGroup()
        ],
      ),
    );
  }

  Widget _buildMainGroup() {
    return Container(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        padding: EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.0),
            DataField(),

            SizedBox(height: 30.0),
            _buildPrevievText(),
            
            SizedBox(height: 40.0),
            _buildRegisterButton(),
            
            SignInWithText('Зареєструватися за допомогою'),
            SizedBox(height: 20.0),
            SocialBtnRow(),
          ],
        ),
      ),
    );
  }

  Widget _buildPrevievText() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Нікому не повідомляйте код який надійде вам в смс, " +
            "даний код буде використано для реєстрації і в подальшому " +
            "він стане неактивним",
            style: TextStyle(
              color: Colors.white54,
              fontFamily: "OpenSans",
              fontSize: 12.0,
            ),
          ),
        ],
      )
    );
  }

  Widget _buildRegisterButton() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          // Registration
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Зареєструватися',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          )
        ),
      ),
    );
  }

}