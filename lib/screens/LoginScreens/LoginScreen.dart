import 'package:flutter/material.dart';

import 'package:StreetCoffee/utilities/Constants.dart';
import 'package:StreetCoffee/utilities/Widget/DataFields.dart';

import 'package:StreetCoffee/screens/HomeScreens/HomeScreen.dart';
import 'package:StreetCoffee/screens/LoginScreens/RegistrationScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

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
            buildDataField(),

            SizedBox(height: 20.0),
            _buildRememberSignIn(),

            SizedBox(height: 20.0),

            _buildLoginButton(context),
            _buildSignInWithText(),
            _buildSocialBtnRow(),
            _buildSignupButton()
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondRoute())
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

  Widget _buildSignInWithText() {
    return Column(
      children: <Widget>[
        Text(
          'Або',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          'Увійти за допомогою',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 1.5,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans',
          ),
        ),
      ],
    );
  }

Widget _buildSocialBtn(Function onTap, AssetImage logo) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50.0,
        width: 50.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 2),
              blurRadius: 6.0,
            ),
          ],
          image: DecorationImage(
            image: logo,
          ),
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildSocialBtn(
            () => print('Login with Facebook'),
            AssetImage(
              "assets/images/facebook.jpg",
            ),
          ),
          _buildSocialBtn(
            () => print('Login with Google'),
            AssetImage(
              "assets/images/google.jpg",
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSignupButton() {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RegistrationScreen())
        );
      },
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: 'У вас немає облікового запису? ',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: 'Зареєструйтесь',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

}