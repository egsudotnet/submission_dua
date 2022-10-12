import 'package:flutter/material.dart';

class CommonProvider extends ChangeNotifier {
  String _idRestaurant = "";
 
  String get idRestaurant => _idRestaurant;
 
  void complete(String id) {
    _idRestaurant = id;
    notifyListeners();
  }
}