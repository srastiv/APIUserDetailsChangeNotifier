import 'package:flutter/material.dart';

const kScaffoldBackgroundColor = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        Color.fromARGB(255, 181, 136, 215),
        Color.fromARGB(255, 138, 192, 205),
      ],
      begin: const FractionalOffset(0.0, 0.0),
      end: const FractionalOffset(1.0, 0.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);
const kUserDetailsTextStyle = TextStyle(
    fontSize: 40,
    fontFamily: 'Pacifico',
    fontWeight: FontWeight.bold,
    color: Colors.white);

const kAPIError = Center(
  child: Text(
    "API list has error!",
    style: TextStyle(color: Colors.red),
  ),
);
