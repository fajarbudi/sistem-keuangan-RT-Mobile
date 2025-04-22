import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/base/helper.dart';
import 'package:keuangan_rt/controller/auth.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = Get.put(LoginController());
  dynamic helper = Helper();
  final Map<String, TextEditingController> inputController = {
    'username': TextEditingController(),
    'password': TextEditingController(),
  };
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Login',
        home: Scaffold(
          body: Stack(
            children: [
              ListView(padding: EdgeInsets.zero, children: [
                Container(
                  width: double.infinity,
                  height: Helper.screenHeight(context, 40),
                  decoration:
                      // BoxDecoration(color: Color.fromARGB(255, 59, 208, 253)),
                      BoxDecoration(color: helper.baseColor),
                ),
                Container(
                  width: double.infinity,
                  height: Helper.screenHeight(context, 60),
                  decoration: const BoxDecoration(color: Colors.white),
                )
              ]),
              ListView(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          gapY(context, 2),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 600),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selamat Datang',
                                      // style: TextStyle(
                                      //   fontStyle: GoogleFonts.aBeeZee(),
                                      //     color: Colors.white,
                                      //     fontSize: 35,
                                      //     fontWeight: FontWeight.bold),
                                      style: GoogleFonts.baskervville(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    text(context,
                                        'Sistem Keuangan Rt.09 / Rw.20',
                                        fontSize: 14, textColor: Colors.white),
                                  ],
                                )),
                          ),
                          gapY(context, 7),
                          Container(
                              padding: const EdgeInsets.all(20),
                              height: Helper.screenHeight(context, 45),
                              constraints: const BoxConstraints(
                                  maxWidth: 600, minHeight: 400),
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: const [
                                    BoxShadow(
                                        // color: Color.fromARGB(50, 230, 42, 255),
                                        color: Color.fromRGBO(0, 0, 0, 0.1),
                                        blurStyle: BlurStyle.solid,
                                        blurRadius: 20,
                                        offset: Offset(2, 3))
                                  ]),
                              child: LayoutBuilder(
                                builder: (context, constraints) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Image.network(
                                          height: Helper.parrentHeight(
                                              constraints, 20),
                                          '${helper.baseURL}/assets/images/logo/logo.png'),
                                      gapYconstrain(constraints, 5),
                                      divider(context, height: 1.3),
                                      gapYconstrain(constraints, 10),
                                      inputText(context,
                                          height: Helper.parrentHeight(
                                              constraints, 14),
                                          width: Helper.parrentWidth(
                                              constraints, 100),
                                          fillColor: const Color.fromARGB(
                                              45, 33, 149, 243),
                                          borderColor: helper.secondaryColor,
                                          icons: Icons.assignment_ind_outlined,
                                          controller:
                                              inputController['username'],
                                          label: 'Username'),
                                      gapYconstrain(constraints, 5),
                                      inputText(context,
                                          height: Helper.parrentHeight(
                                              constraints, 14),
                                          width: Helper.parrentWidth(
                                              constraints, 100),
                                          fillColor: const Color.fromARGB(
                                              45, 33, 149, 243),
                                          borderColor: helper.secondaryColor,
                                          icons: Icons.lock_outline,
                                          controller:
                                              inputController['password'],
                                          label: 'Kata Sandi'),
                                      gapYconstrain(constraints, 8),
                                      Obx(
                                        () => buttonIcon(context, () {
                                          loginController.goLogin(
                                              inputController, context);
                                        },
                                            height: Helper.parrentHeight(
                                                constraints, 11),
                                            width: Helper.parrentWidth(
                                                constraints, 100),
                                            borderRadius: 10,
                                            backgroundColor: helper.baseColor,
                                            icon:
                                                loginController.isLoading.value
                                                    ? Icons.access_time
                                                    : Icons.login,
                                            iconColor: Colors.white,
                                            label:
                                                loginController.isLoading.value
                                                    ? 'Loading...'
                                                    : 'Go Login',
                                            fontSize: Helper.parrentHeight(
                                                constraints, 5),
                                            textColor: Colors.white),
                                      ),
                                      gapYconstrain(constraints, 1),
                                      text(context,
                                          'Jika ada kendala silahkan hubungi admin',
                                          fontSize: Helper.parrentHeight(
                                              constraints, 3.3))
                                    ],
                                  );
                                },
                              )),
                          gapY(context, 3),
                          Image.asset(
                            'assets/gambar/showData.jpg',
                            height: Helper.screenHeight(context, 22),
                          )
                        ],
                      )),
                ],
              )
            ],
          ),
        ));
  }
}
