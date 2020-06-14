import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class GetDateImage {
  var subject = new PublishSubject<String>();

  PublishSubject<String> _readDate(String childName) {
    final DBRef = FirebaseDatabase.instance.reference().child(childName);
    
    DBRef.once().then((DataSnapshot dataSnapshot) {
      subject.add(dataSnapshot.value.toString());
    });

    return subject;
  }

}

class RenderCards {

  List<Widget> renderCard(List<String> url) {
    List<Widget> card = [ ];

    RegExp regExp = new RegExp(
      r"http:\/\/[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?",
      caseSensitive: false,
      multiLine: false,
    );

    for (int i = 0; i < url.length; i++) {
      card.add( 
        Card(
          elevation: 4.0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          clipBehavior: Clip.antiAlias,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Image.network(
                regExp.stringMatch(url[ i ]).toString(),
                fit: BoxFit.contain,
                height: 480.0,
                width: 320.0,
              )
            ],
          ),
        )
      );
    }
    return card;
  }
}

Widget CardsDashboard(String childDataName) {
  var subject = new PublishSubject<String>();
  var getImage = new GetDateImage();
  
  subject = getImage._readDate(childDataName);
  
  return Container(
    height: 500,
    child: StreamBuilder(
      stream: subject.stream,
      builder: (context, snapsot) {
        if (snapsot.data == null) {
          return CircularProgressIndicator();
        }

        var urls = snapsot.data.split(',');

        return PageView(
          controller: PageController(viewportFraction: 1.0),
          scrollDirection: Axis.horizontal,
          pageSnapping: true,
          children: 
            RenderCards().renderCard(urls)
        );
      },
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