import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/base/helper.dart';

final dio = Dio();
String baseURL = Helper().baseURL;

class LoginController extends GetxController {
  var isLoading = false.obs;

  goLogin(Map data, BuildContext context) async {
    Map<String, dynamic> post = {};
    data.forEach(
      (key, value) => post[key] = value.text,
    );
    try {
      double isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom;
      print(isKeyboardOpen);
      isLoading.value = true;
      final res = await dio.post('$baseURL/api/mobileLogin', data: post);
      final data = res.data;
      if (data['pesan'] == 'Login Berhasil') {
      } else {
        Future.delayed(Duration.zero, () {
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).showSnackBar(snackbar(context,
              Icons.warning_amber_rounded, Colors.redAccent, data['pesan']));
        });
      }
    } catch (e) {
      Future.delayed(Duration.zero, () {
        ScaffoldMessenger.of(context).showSnackBar(snackbar(
            context,
            Icons.warning_amber_rounded,
            Colors.redAccent,
            'Sedang ada masalah pada server'));
      });
    } finally {
      isLoading.value = false;
    }
  }
}
