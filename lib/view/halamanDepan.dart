import 'package:flutter/material.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/base/helper.dart';

class HalamanDepan extends StatefulWidget {
  const HalamanDepan({super.key});

  @override
  State<HalamanDepan> createState() => _HalamanDepanState();
}

class _HalamanDepanState extends State<HalamanDepan>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final helper = Helper();
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(reverse: true); // Membuat animasi berulang bolak-balik
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final helper = Helper();
    return Scaffold(
      body: Stack(
        children: [
          // SlideTransition(
          //   position: Tween<Offset>(
          //     begin: Offset(-0.2, 0), // Mulai sedikit ke kiri
          //     end: Offset(0.2, 0), // Berakhir sedikit ke kanan
          //   ).animate(_controller),
          //   child: Image.network(
          //     'https://rt9.anauri.id/assets_front/images/front/front-top-1.jpg',
          //     width: double.infinity,
          //     height: double.infinity,
          //     fit: BoxFit.cover,
          //   ),
          // ),
          // TweenAnimationBuilder(
          //   duration: const Duration(seconds: 5),
          //   tween: Tween(begin: 700.0, end: 100.0),
          //   builder: (context, value, child) => Center(
          //       child: Text('.........................',
          //           textAlign: TextAlign.center,
          //           style: TextStyle(
          //               color: Color.fromARGB(255, 202, 202, 202),
          //               fontSize: value,
          //               fontWeight: FontWeight.w900))),
          // ),
          Center(
            child: SafeArea(
              child: Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  width: Helper.screenWidth(context, 100),
                  height: Helper.screenHeight(context, 100),
                  padding: EdgeInsets.all(20),
                  child: LayoutBuilder(
                    builder: (context, constraints) => Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        gapY(context, 1),
                        Container(
                          width: double.infinity,
                          height: Helper.screenHeight(context, 22),
                          padding:
                              EdgeInsets.symmetric(horizontal: 8, vertical: 10),
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
                        gapY(context, 5),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              text(context, 'Tentang Layanan'),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: text(context,
                                    'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa'),
                              )
                            ],
                          ),
                        ),
                        gapY(context, 45),
                        buttonIcon(context, () {},
                            label: 'Login Page',
                            fontSize: Helper.parrentWidth(constraints, 5.5))
                      ],
                    ),
                  )),
            ),
          )
          // TweenAnimationBuilder(
          //   duration: const Duration(seconds: 5),
          //   tween: Tween(begin: 50.0, end: 200.0),
          //   builder: (context, value, child) => Center(
          //       child: Container(
          //     width: value,
          //     height: 50,
          //     decoration: BoxDecoration(
          //         color: Colors.blue, borderRadius: BorderRadius.circular(20)),
          //   )),
          // ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Container(
          //     width: Helper.screenWidth(context, 100),
          //     height: Helper.screenHeight(context, 50),
          //     decoration: BoxDecoration(
          //         color: Colors.blue, borderRadius: BorderRadius.circular(25)),
          //   ),
          // )
        ],
      ),
    );
  }
}
