import 'package:flutter/material.dart';
import 'package:StreetCoffee/screens/NavigationBloc/NavigationBloc.dart';
import 'package:StreetCoffee/utilities/Widget/Cards.dart';

class MyCardsPage extends StatelessWidget with NavigationStates { 
  
  final Function onMenuTap;

  const MyCardsPage({
    Key key, this.onMenuTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(0.0)),
        color: Color(0xFFf5f5f5),
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
                  new InkWell(
                    child: Icon(Icons.menu, color: Colors.black),
                    onTap: () {
                      onMenuTap();
                    },
                  ),
                  Text("Головна", style: TextStyle(fontSize: 24, color: Colors.black)),
                  Icon(Icons.settings, color: Colors.black),
                ],
              ),
              SizedBox(height: 30),
              Text(
                "Новини",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 20),
              CardsDashboard("news"),
              SizedBox(height: 20),
              Text(
                "Акції",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
              SizedBox(height: 20),
              CardsDashboard("shares"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}