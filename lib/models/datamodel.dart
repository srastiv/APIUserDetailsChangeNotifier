// To parse this JSON data, do
//
//     final userDetails = userDetailsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

class UserDetails {
  UserDetails({
    required this.name,
    required this.cell,
  });

  final Name name;
  final String cell;

  factory UserDetails.fromRawJson(String str) =>
      UserDetails.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        name: Name.fromJson(json["name"]),
        cell: json["cell"],
      );

  Map<String, dynamic> toJson() => {
        "name": name.toJson(),
        "cell": cell,
      };
}

class Name {
  Name({
    required this.title,
    required this.first,
    required this.last,
  });

  final String title;
  final String first;
  final String last;

  factory Name.fromRawJson(String str) => Name.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Name.fromJson(Map<String, dynamic> json) => Name(
        title: json["title"],
        first: json["first"],
        last: json["last"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "first": first,
        "last": last,
      };
}
