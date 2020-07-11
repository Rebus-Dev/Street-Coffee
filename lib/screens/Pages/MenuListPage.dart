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
import 'package:StreetCoffee/screens/NavigationBloc/NavigationBloc.dart';
import 'package:StreetCoffee/utilities/Widget/Cards.dart';

class MenuListPage extends StatelessWidget with NavigationStates {
  String nameBranch = '';

  MenuListPage(String nameBranch) {
    this.nameBranch = nameBranch;
  }

  @override
  Widget build(BuildContext context) {
    GetDateImage().readDateMenu(nameBranch);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white70
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 50),
                  CardsMenuItem(context, nameBranch + '/list'),
                  SizedBox(height: 5),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }

}