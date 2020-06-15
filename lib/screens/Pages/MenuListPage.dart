import 'package:flutter/material.dart';
import 'package:StreetCoffee/screens/NavigationBloc/NavigationBloc.dart';
import 'package:StreetCoffee/utilities/Widget/Cards.dart';

class MenuListPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const MenuListPage({
    Key key, this.onMenuTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white70
            ),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 15),
                  CardsMenu(context, "hot_drinks", Color(0xFF1b1b1b)),
                  SizedBox(height: 5),
                  CardsMenu(context, "cold_drinks", Color(0xFF1b1b1b)),
                  SizedBox(height: 5),
                  CardsMenu(context, "desserts", Color(0xFF1b1b1b)),
                  SizedBox(height: 5),
                  CardsMenu(context, "cold_drinks", Color(0xFF1b1b1b)),
                  SizedBox(height: 5),
                  CardsMenu(context, "desserts", Color(0xFF1b1b1b)),
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