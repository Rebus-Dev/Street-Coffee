import 'package:flutter/material.dart';
import 'package:slimy_card/slimy_card.dart';

import 'package:StreetCoffee/screens/NavigationBloc/NavigationBloc.dart';

class CardBillsPage extends StatelessWidget with NavigationStates {

  final Function onMenuTap;

  const CardBillsPage({
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
              Text("Карта", style: TextStyle(fontSize: 24, color: Colors.black)),
              Icon(Icons.settings, color: Colors.black),
            ],
          ),
          SizedBox(height: 50),
          SlimyCard(
            color: Color(0xFF038C61),
            topCardWidget: Container(
              child: Image(
                image: AssetImage("assets/images/coffee.png"),
                height: 180,
                width: 180,
              )
            ),
            bottomCardWidget: Container(
              child: Text(
                "Ваш персональний код в Street Coffee: 0171",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                )
              ),
            ),
          )
        ],
      ),
    );
  }
}