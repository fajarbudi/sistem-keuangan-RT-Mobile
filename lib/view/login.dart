import 'package:flutter/material.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/base/helper.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    dynamic helper = Helper();
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
                      BoxDecoration(color: Colors.blue),
                ),
                Container(
                  width: double.infinity,
                  height: Helper.screenHeight(context, 60),
                  decoration: BoxDecoration(color: Colors.white),
                )
              ]),
              ListView(
                children: [
                  Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Component.gapY(context, 2),
                          Container(
                            constraints: BoxConstraints(maxWidth: 500),
                            child: Align(
                                alignment: Alignment.topLeft,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Selamat Datang',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Sistem Keuangan Rt.09 / Rw.20',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                )),
                          ),
                          Component.gapY(context, 5),
                          Container(
                            padding: EdgeInsets.all(20),
                            height: Helper.screenHeight(context, 51),
                            constraints: BoxConstraints(maxWidth: 500),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.2),
                                      blurStyle: BlurStyle.solid,
                                      blurRadius: 20,
                                      offset: Offset(3, 4))
                                ]),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                // Text(
                                //   'Login Form',
                                //   style: TextStyle(
                                //       fontSize: 30,
                                //       color: Color.fromARGB(255, 11, 145, 255),
                                //       fontWeight: FontWeight.w500),
                                // )
                                Image.network(
                                    width: 200,
                                    '${helper.baseURL}assets/images/logo/logo.png'),
                                Component.gapY(context, 3),
                                TextField(
                                  decoration:
                                      InputDecoration(labelText: 'Username'),
                                ),
                                Component.gapY(context, 3),
                                TextField(
                                  decoration:
                                      InputDecoration(labelText: 'Kata Sandi'),
                                ),
                                Component.gapY(context, 5),
                                ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue),
                                    onPressed: () {},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.add_to_home_screen,
                                          color: Colors.white,
                                        ),
                                        Component.gapX(context, 2.5),
                                        Text(
                                          'Submit',
                                          style: TextStyle(color: Colors.white),
                                        )
                                      ],
                                    )),
                                Component.gapY(context, 3),
                                Text('Jika ada kendala silahkan hubungi admin')
                              ],
                            ),
                          ),
                          Component.gapY(context, 2.5),
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
