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

import 'dart:io';
import 'package:flutter/material.dart';

import 'package:firebase_database/firebase_database.dart';
import 'package:StreetCoffee/utilities/Auth/AuthUser.dart';
import 'package:StreetCoffee/utilities/Auth/AuthDataInstancce.dart';

class GetUserData {
  final DBRef = FirebaseDatabase.instance.reference().child("users");
  final userService = AuthUserLogic();
  final getStorageData = SaveAndRead();

  String md5Phone;

  void GetData() {
    Future<String> userSave = getStorageData.read();

    userSave.then((value) => {
      md5Phone = _CheckData(value),
      _CheckUserDB(md5Phone)
    });
  }

  String _CheckData(String value) {
    if (value != null) {
      return userService.generateMd5(value);
    } else {
      print("Data is null");
    }
  }

  void _CheckUserDB(String hashUser) {
    try {
      final userDB = DBRef.child(hashUser);

      if (userDB != null) {
        userDB.child("code");
        userDB.once().then((DataSnapshot dataSnapshot) {
            
        });
      }

    } catch(ex) {
      print("Not user: ${ex.code}");
    }
  }
}