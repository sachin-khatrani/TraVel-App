import 'package:flutter/material.dart';

const textInputDecoration =  InputDecoration(
    fillColor: Colors.white,
    filled: true,
    enabledBorder:OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white,width: 2.0),
    ),
    focusedBorder:OutlineInputBorder(
      borderSide: BorderSide(color: Colors.black,width: 2.0),
    )
);

final String SIGN_IN = 'signin';
final String SIGN_UP ='signup';
final String SPLASH_SCREEN ='splashscreen';