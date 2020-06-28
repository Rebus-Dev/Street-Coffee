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

  PublishSubject<List<Map<String, dynamic>>> readDateMenu(String childName) {
    final DBRef = FirebaseDatabase.instance.reference().child(childName);
    var subject = new PublishSubject<List<Map<String, dynamic>>>();

    List<Map<String, dynamic>> tempList = new List();

    String url = '';
    String name = '';
    String descr = '';
    String price = '';

    DBRef.once().then((DataSnapshot dataSnapshot) {
      bool ifInList = new RegExp('/list').hasMatch(childName);
      if (ifInList) {
        for (final data in dataSnapshot.value) {
          
          url = data["image"];
          name = data["name"];
          descr = data["descr"];
          price = data["price"];

          Map<String, dynamic> tmpValue = { "image": url, "name": name, "descr" : descr, "price" : price };
          
          tempList.add(tmpValue);
          
        }

        subject.add(tempList);
      }      

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

  List<Widget> renderRowArray(List<Map<String, dynamic>> snapsot) {
    List<Widget> rows = List();
    
    for(int item = 0; item < snapsot.length; item++) {
      rows.add(
        Card(
          elevation: 5,
          child: Container(
            height: 120.0,
            child: Row(
              children: <Widget>[
                Container(
                  height: 120.0,
                  width: 80.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(5),
                      topLeft: Radius.circular(5)
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(snapsot[item]["image"])
                    )
                  ),
                ),
                Container(
                  height: 120,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 2, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          snapsot[item]["name"]                
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 3, 0, 3),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.teal),
                            ),
                            child: Text(
                              snapsot[item]["price"], 
                              textAlign: TextAlign.center
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 2),
                            child: Container(
                              width: 260,
                              child: Text(
                                snapsot[item]["descr"],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromARGB(255, 48, 48, 54)
                                ),
                              ),
                            ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      );
    }

    return rows;
  }

  Widget menuItemList(List<Map<String, dynamic>> snapsot) {
    return new Container(
      child: ListView (
          children: renderRowArray(snapsot)
      ),
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
        builder: (context) => MenuListPage(nameBranch)
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

Widget CardsMenuItem(BuildContext context, String nameBranch) {
  var subject = new PublishSubject<List<Map<String, dynamic>>>();
  var getImage = new GetDateImage();
  
  subject = getImage.readDateMenu(nameBranch);

  return new GestureDetector (
    onTap: () {
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MenuListPage(nameBranch)
      ));
    },
    child: Container (
      height: 1000,
      child: StreamBuilder (
        stream: subject.stream,
        builder: (context, snapsot) {
          if (snapsot.data == null) {
            return CircularProgressIndicator();
          }

          return RenderCards().menuItemList(snapsot.data);
        },
      )
    )
  );
}