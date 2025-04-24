import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/base/helper.dart';
import 'package:keuangan_rt/view/halamanDepan.dart';
import 'package:keuangan_rt/view/home.dart';
import 'package:keuangan_rt/view/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

final dio = Dio();
String baseURL = '${Helper().baseURL}/api';

class LoginController extends GetxController {
  var isLoading = false.obs;

  goLogin(Map data, BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final cekToken = Get.put(CekToken());
    Map<String, dynamic> post = {};

    data.forEach(
      (key, value) => post[key] = value.text,
    );

    try {
      isLoading.value = true;
      final res = await dio.post('$baseURL/auth/mobileLogin', data: post);
      Map<String, dynamic> data = res.data;

      if (data['pesan'] == 'Login Berhasil') {
        String token = data['access_token'];
        prefs.setString('token', token);
        cekToken.cek().then((val) => {
              (val == 'Valid Token')
                  ? Get.off(() => const Home())
                  : Get.off(() => const Login())
            });
        // Get.off(() => const Home());
      } else {
        Future.delayed(Duration.zero, () {
          FocusScope.of(context).unfocus();
          ScaffoldMessenger.of(context).showSnackBar(snackbar(context,
              Icons.warning_amber_rounded, Colors.redAccent, data['pesan']));
        });
      }
    } catch (e) {
      Future.delayed(Duration.zero, () {
        FocusScope.of(context).unfocus();
        ScaffoldMessenger.of(context).showSnackBar(snackbar(
            context,
            Icons.warning_amber_rounded,
            Colors.redAccent,
            'Periksa koneksi internet anda'));
      });
    } finally {
      isLoading.value = false;
    }
  }
}

class CekToken extends GetxController {
  var status = false.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    // cek();
    super.onInit();
  }

  cek() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    try {
      final res = await dio.get('$baseURL/auth/cekToken',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': "Bearer $token",
          }));
      //status
      (res.data['status'] == 'Valid Token'
          ? status.value = true
          : status.value = false);
      //return status
      return res.data['status'];
    } catch (e) {
      Get.off(() => const HalamanDepan());
    }
  }
}
