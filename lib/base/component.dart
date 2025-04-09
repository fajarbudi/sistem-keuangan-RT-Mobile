import 'package:flutter/material.dart';

class Component {
  static gapX(BuildContext context, double persen) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * (persen / 100),
    );
  }

  static gapY(BuildContext context, double persen) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * (persen / 100),
    );
  }
}
