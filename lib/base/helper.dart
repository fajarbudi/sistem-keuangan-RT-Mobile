import 'package:flutter/material.dart';

class Helper {
  String baseURL = 'https://rt9.anauri.id/';

  static screenWidth(BuildContext context, double persen) {
    return MediaQuery.of(context).size.width * (persen / 100);
  }

  static screenHeight(BuildContext context, double persen) {
    return MediaQuery.of(context).size.height * (persen / 100);
  }
}
