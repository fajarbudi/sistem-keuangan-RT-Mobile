import 'package:flutter/material.dart';

class Helper {
  // String baseURL = 'https://rt9.anauri.id';
  String baseURL = 'http://192.168.0.106:8000';
  Color baseColor = Colors.blue;
  Color secondaryColor = Colors.blue;
  Color textColor = Colors.white;

  static screenWidth(BuildContext context, double persen) {
    return MediaQuery.of(context).size.width * (persen / 100);
  }

  static screenHeight(BuildContext context, double persen) {
    return MediaQuery.of(context).size.height * (persen / 100);
  }

  static parrentWidth(BoxConstraints constraints, double persen) {
    return constraints.maxWidth * (persen / 100);
  }

  static parrentHeight(BoxConstraints constraints, double persen) {
    return constraints.maxHeight * (persen / 100);
  }
}
