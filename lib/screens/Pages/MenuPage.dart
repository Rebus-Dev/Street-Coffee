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

class MenuPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const MenuPage({
    Key key, this.onMenuTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        color: Color(0xFFf5f5f5),
      ),
      padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                child: Icon(Icons.menu, color: Colors.black),
                onTap: () {
                  onMenuTap();
                },
              ),
              Text("Меню", style: TextStyle(fontSize: 24, color: Colors.black)),
              Icon(Icons.favorite_border, color: Colors.black),
            ],
          ),
          SizedBox(height: 50),
          
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CardsMenu(context, "hot_drinks", Color(0xFF1b1b1b)),
                SizedBox(height: 5),
                CardsMenu(context, "cold_drinks", Color(0xFF1b1b1b)),
                SizedBox(height: 5),
                CardsMenu(context, "desserts", Color(0xFF1b1b1b)),
                SizedBox(height: 10),
              ],
            )
          ),
        ],
      ),
    );
  }
}