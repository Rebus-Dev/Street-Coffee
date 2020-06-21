import 'dart:io';
import 'package:flutter/material.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

class MessagingWidgetState {
  String _message = '';

  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  _register() {
    _firebaseMessaging.getToken().then((token) => print(token));
  }


  void initState() {
    getMessage();
    _register();
  }
  
  void getMessage(){
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('on message $message');
    }, onResume: (Map<String, dynamic> message) async {
        print('on resume $message');
    }, onLaunch: (Map<String, dynamic> message) async {
        print('on launch $message');
    });
  }

}