import 'package:applicationapi/models/datamodel.dart';
import 'package:flutter/material.dart';

class JobProvider extends ChangeNotifier {
  UserDetails? currentSelectedUser;
  @override
  void notifyListeners();
}
