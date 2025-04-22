import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/controller/auth.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // final cekToken = Get.put(CekToken());
    return Scaffold(
      body: text(context, "texta"),
    );
  }
}
