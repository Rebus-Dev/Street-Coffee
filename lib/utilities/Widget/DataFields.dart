import 'package:flutter/material.dart';
import 'package:StreetCoffee/utilities/Constants.dart';

Widget DataField() {
  return Column(
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
          keyboardType: TextInputType.number,
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
        ),
      )
    ],
  );
}

