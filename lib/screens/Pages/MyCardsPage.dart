import 'package:flutter/material.dart';
import 'package:StreetCoffee/screens/NavigationBloc/NavigationBloc.dart';
import 'package:StreetCoffee/utilities/Widget/Cards.dart';

class MyCardsPage extends StatelessWidget with NavigationStates {
  final Function onMenuTap;

  const MyCardsPage({Key key, this.onMenuTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(40)),
        color: Colors.grey,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: ClampingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    child: Icon(Icons.menu, color: Colors.white),
                    onTap: onMenuTap,
                  ),
                  Text("My Cards", style: TextStyle(fontSize: 24, color: Colors.white)),
                  Icon(Icons.settings, color: Colors.white),
                ],
              ),
              SizedBox(height: 50),
              Text(
                "Shares",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              CardsDashboard(),
              SizedBox(height: 20),
              Text(
                "News",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(height: 20),
              CardsDashboard(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}