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
              Icon(Icons.settings, color: Colors.black),
            ],
          ),
          SizedBox(height: 50),
          
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                CardsMenu(context, "Гарячі напої", NetworkImage('https://wallpapercave.com/wp/wp2365076.jpg'), Color(0xFF1b1b1b)),
                SizedBox(height: 5),
                CardsMenu(context, "Холодні напої", NetworkImage('https://wallpapercave.com/wp/wp2365076.jpg'), Color(0xFF1b1b1b)),
                SizedBox(height: 5),
                CardsMenu(context, "Десерти", NetworkImage('https://wallpapercave.com/wp/wp2365076.jpg'), Color(0xFF1b1b1b)),
                SizedBox(height: 10),
              ],
            )
          ),
        ],
      ),
    );
  }
}