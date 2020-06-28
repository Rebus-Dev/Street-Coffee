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

import 'package:flutter/material.dart';

import 'package:StreetCoffee/utilities/Constants.dart';
import 'package:StreetCoffee/utilities/Auth/AuthUser.dart';
import 'package:StreetCoffee/utilities/Widget/Button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  final _phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Image(
              image: AssetImage("assets/images/logo.png"),
              height: 180,
              width: 180,
            ),
            Text(
              "Вхід",
              style: TextStyle(
                color: Colors.white,
                fontFamily: "OpenSans",
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 15.0),
            
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Мобільний телефон",
                  style: kLabelStyle
                ),
                SizedBox(height: 10.0),
                Container(
                  alignment: Alignment.centerLeft,
                  decoration: kBoxDecorationStyle,
                  height: 60.0,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14.0),
                      prefixIcon: Icon(
                        Icons.call,
                        color: Colors.white,
                      ),
                      hintText: "Введіть будь ласка моб. тел.",
                      hintStyle: kHintTextStyle
                    ),
                    controller: _phoneController,
                  ),
                )
              ],
            ),

            SizedBox(height: 20.0),
            _buildRememberSignIn(),

            SizedBox(height: 20.0),

            _buildLoginButton(context),
            SignInWithText('Увійти за допомогою'),
            SocialBtnRow(context, _rememberMe),
          ],
        ),
      ),
    );
  }



  Widget _buildRememberSignIn() {
    return Container(
      child: Row(
        children: <Widget>[
          Theme(
            data: ThemeData(unselectedWidgetColor: Colors.white38),
            child: Checkbox(
              value: _rememberMe,
              checkColor: Colors.black45,
              activeColor: Colors.white,
              onChanged: (value) {
                setState(() {
                  _rememberMe = value;
                });
              },
            ),
          ),
          Text(
            "Запам'ятати мене",
            style: kLabelStyle
          )
        ],
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.0),
      width: double.infinity,
      child: RaisedButton(
        elevation: 5.0,
        onPressed: () {
          final phone = _phoneController.text.trim();

          AuthUser().loginUser(
            phone, 
            context,
            _rememberMe
          );
        },
        padding: EdgeInsets.all(15.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        color: Colors.white,
        child: Text(
          'Увійти',
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