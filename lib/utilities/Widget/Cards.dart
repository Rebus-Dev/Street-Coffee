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

import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:StreetCoffee/screens/Pages/MenuListPage.dart';

RegExp regExp = new RegExp(
  r"http:\/\/[-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/=]*)?",
  caseSensitive: false,
  multiLine: false,
);

class GetDateImage {
  var subject = new PublishSubject<Map<String, dynamic>>();

  PublishSubject<Map<String, dynamic>> _readDate(String childName) {
    final DBRef = FirebaseDatabase.instance.reference().child(childName);
    
    String url = '';
    String name = '';

    DBRef.once().then((DataSnapshot dataSnapshot) {
      url = dataSnapshot.value["image"];
      name = dataSnapshot.value["name"];

      Map<String, dynamic> tmpValue = { "image": url, "name": name };

      subject.add(tmpValue);
    });

    return subject;
  }

  PublishSubject<String> _readNews(String childName) {
    var subject = new PublishSubject<String>();
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
  
  Widget renderRow(Map<String, dynamic> snapsot) {
    return new Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget> [
        new Padding(
          padding: new EdgeInsets.only(left: 20.0, right: 0.0),
          child: new CircleAvatar(
            radius: 35.0, 
            backgroundImage: NetworkImage(regExp.stringMatch(snapsot["image"]).toString())
          )
        ),
        new Padding(
          padding: new EdgeInsets.only(left: 20.0, right: 0.0),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                snapsot["name"],
                style: new TextStyle(
                  fontSize: 20.0, 
                  color: Colors.white70
                )
              ),
            ],
          )
        )
      ],
    );
  }
}

Widget CardsDashboard(String childDataName) {
  var subject = new PublishSubject<String>();
  var getImage = new GetDateImage();
  
  subject = getImage._readNews(childDataName);
  
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

Widget CardsMenu(BuildContext context, String nameBranch, Color colorCard) {
  var subject = new PublishSubject<Map<String, dynamic>>();
  var getImage = new GetDateImage();
  
  subject = getImage._readDate(nameBranch);

  return new GestureDetector (
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MenuListPage()
      ));
    },
    child: new Container(
      height: 150.0,
      margin: new EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(10.0)),
        color: colorCard
      ),
      child: StreamBuilder(
        stream: subject.stream,
        builder: (context, snapsot) {
          if (snapsot.data == null) {
            return CircularProgressIndicator();
          }

          return RenderCards().renderRow(snapsot.data);
        },
      )
    ),
  );
}