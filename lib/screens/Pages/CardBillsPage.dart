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

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:slimy_card/slimy_card.dart';
import 'package:StreetCoffee/utilities/Auth/AuthUser.dart';
import 'package:StreetCoffee/utilities/Auth/AuthDataInstancce.dart';
import 'package:StreetCoffee/screens/NavigationBloc/NavigationBloc.dart';

class GetDateImage {
  var subject = new PublishSubject<Map<String, dynamic>>();

  PublishSubject<Map<String, dynamic>> _readDate() {
    final DBRef = FirebaseDatabase.instance.reference().child("users");

    Future<String> userSave = SaveAndRead().read("loginSaveTmp");

    String md5Phone;

    userSave.then((value) => {
      md5Phone = AuthUserLogic().generateMd5(value),

      DBRef.child(md5Phone)
        .child("code")
        .once()
        .then((DataSnapshot dataSnapshot) { 
          Map<String, dynamic> code = { "code" : dataSnapshot.value };

          subject.add(code);
      })
    });

    return subject;
  }

}

class CardBillsPage extends StatelessWidget with NavigationStates {

  final Function onMenuTap;

  const CardBillsPage({
    Key key, this.onMenuTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var subject = new PublishSubject<Map<String, dynamic>>();
    var code = "";
    subject = GetDateImage()._readDate();
    
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
              Icon(Icons.favorite_border, color: Colors.black),
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
              child: StreamBuilder(
                stream: subject.stream,
                builder: (context, snapsot) { 
                  if (snapsot.data == null) {
                    return CircularProgressIndicator();
                  }

                  if (snapsot.data["code"] == null)  {
                    code = "---";
                  } else {
                    code = snapsot.data["code"];
                  }

                  return Text(
                    "Ваш персональний код в Street Coffee: $code",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontFamily: 'OpenSans',
                    )
                  );
                },
              )
            ),
          )
        ],
      ),
    );
  }
}