import 'package:flutter/material.dart';

Widget CardsDashboard() {
  return Container(
    height: 200,
    child: PageView(
    controller: PageController(viewportFraction: 1.0),
    scrollDirection: Axis.horizontal,
    pageSnapping: true,
      children: <Widget>[
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.redAccent,
          width: 100,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.blueAccent,
          width: 100,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          color: Colors.greenAccent,
          width: 100,
        ),
      ],
    ),
  );
}

Widget CardsGradient(BuildContext context, String name, NetworkImage imageCategory, Color colorCard) {
  return new Container(
    height: 150.0,
    margin: new EdgeInsets.all(10.0),
    decoration: new BoxDecoration(
      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      color: colorCard
    ),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new Padding(padding: new EdgeInsets.only(left: 30.0, right: 10.0),
          child: new CircleAvatar(radius: 35.0, backgroundImage: imageCategory)
        ),
        new Expanded(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
            )
          ),
        new Padding(padding: new EdgeInsets.only(left: 10.0, right: 50.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(name, style: new TextStyle(fontSize: 25.0, color: Colors.white70),),
            ],
          )
        )
      ],
    ),
  );
}