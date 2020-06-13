import 'dart:ui';
import 'package:flutter/material.dart';

Widget CardsDashboard() {
  return Container(
    height: 500,
    child: PageView(
    controller: PageController(viewportFraction: 1.0),
    scrollDirection: Axis.horizontal,
    pageSnapping: true,
      children: <Widget>[
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ 
              Image.network(
                "http://185.86.78.46/news_1.jpeg",
                fit: BoxFit.contain,
                  height: 480.0,
                  width: 320.0,
              )
            ],
          ),
        ),
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[ 
              Image.network(
                "http://185.86.78.46/news_1.jpeg",
                fit: BoxFit.contain,
                  height: 480.0,
                  width: 320.0,
              )
            ],
          ),
        ),
      ],
    ),
  );
}

Widget CardsMenu(BuildContext context, String name, NetworkImage imageCategory, Color colorCard) {
  return new Container(
    height: 150.0,
    margin: new EdgeInsets.all(10.0),
    decoration: new BoxDecoration(
      borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
      color: colorCard
    ),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
          new Padding(padding: new EdgeInsets.only(left: 20.0, right: 0.0),
          child: new CircleAvatar(radius: 35.0, backgroundImage: imageCategory)
        ),
        new Padding(
          padding: new EdgeInsets.only(left: 20.0, right: 0.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(name, style: new TextStyle(fontSize: 20.0, color: Colors.white70)),
            ],
          )
        )
      ],
    ),
  );
}