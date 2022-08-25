import 'dart:convert';
import 'package:applicationapi/models/datamodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

Future<List<UserDetails>> getUserData() async {
  try {
    var response = await http.get(
      Uri.parse("https://randomuser.me/api/?seed=ab&inc=name,cell&results=20"),
    );
    if (response.statusCode == 200) {
      debugPrint(
        response.statusCode.toString(),
      );
      String data = response.body;
      List jsonData = jsonDecode(data)["results"];
      print(jsonData);

      var result = jsonData
          .map(
            (e) => UserDetails.fromJson(e),
          )
          .toList();
      return result;
    } else {
      return [];
    }
  } catch (error) {
    print(error);
  }
  return [];
}
