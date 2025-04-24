import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/base/helper.dart';
import 'package:keuangan_rt/controller/auth.dart';
import 'package:keuangan_rt/view/home.dart';
import 'package:keuangan_rt/view/login.dart';

class HalamanDepan extends StatefulWidget {
  const HalamanDepan({super.key});

  @override
  State<HalamanDepan> createState() => _HalamanDepanState();
}

class _HalamanDepanState extends State<HalamanDepan> {
  final cekToken = Get.put(CekToken());
  @override
  void initState() {
    cekToken.cek().then((val) {
      // if (val == 'Valid Token') {
      //   Get.off(() => const Home());
      // }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final helper = Helper();
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            width: Helper.screenWidth(context, 100),
            height: Helper.screenHeight(context, 100),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: LayoutBuilder(
              builder: (context, constraints) => Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // gapY(context, 1),
                  Container(
                    width: double.infinity,
                    height: Helper.screenHeight(context, 25),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: const [
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.5),
                              blurStyle: BlurStyle.inner,
                              blurRadius: 20,
                              offset: Offset(0, 4))
                        ]),
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                  'https://rt9.anauri.id/assets_front/images/front/front-top-1.jpg'),
                              fit: BoxFit.cover)),
                    ),
                  ),
                  gapY(context, 3),
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      height: 180,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.2),
                                blurStyle: BlurStyle.solid,
                                blurRadius: 10,
                                offset: Offset(2, 3))
                          ]),
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
                        child: text(
                            context,
                            fontSize: 13.5,
                            '\t\t\tAplikasi ini merupakan sistem keuangan berbasis elektronik di lingkungan Krapyak RT.9/RW.20. Bertujuan untuk mendukung terwujudnya sistem keuangan yang transparan, akuntabel, efektif dan efisien sehingga dapat meningkatkan kepuasan warga terhapad sistem keuangan di lingkungan Krapyak RT.9/RW.20.'),
                      ),
                    ),
                    Container(
                        margin: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                        height: 35,
                        width: 140,
                        decoration: BoxDecoration(
                            color: helper.baseColor,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: const [
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  blurStyle: BlurStyle.solid,
                                  blurRadius: 10,
                                  offset: Offset(2, 3))
                            ]),
                        child: Center(
                          child: text(context, 'Tentang Layanan',
                              textColor: Colors.white),
                        )),
                  ]),
                  gapY(context, 15),
                  Opacity(
                    opacity: 0.25,
                    child: Image.network(
                      "${Helper().baseURL}/assets/images/logo/logo.png",
                      colorBlendMode: BlendMode.hue,
                      color: Colors.white,
                      width: 250,
                      fit: BoxFit.cover,
                    ),
                  ),

                  gapY(context, 5),
                  buttonIcon(context, () {
                    Get.to(() => const Login());
                  },
                      label: 'Login Page',
                      width: double.infinity,
                      fontSize: Helper.parrentWidth(constraints, 5),
                      icon: Icons.login
                      )
                ],
              ),
            )),
      )),
    );
  }
}
