import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keuangan_rt/base/component.dart';
import 'package:keuangan_rt/base/helper.dart';
import 'package:keuangan_rt/view/halamanDepan.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    Timer(
        const Duration(seconds: 5), () => Get.off(() => const HalamanDepan()));
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      _controller.stop();
    });
  }

  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final layar = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      clipBehavior: Clip.none,
      children: [
        TweenAnimationBuilder(
          duration: const Duration(seconds: 1),
          tween: Tween(begin: 0.0, end: 280.0),
          builder: (context, value, child) => Center(
            child: Image.network(
              "${Helper().baseURL}/assets/images/logo/logo.png",
              width: value,
              fit: BoxFit.cover,
            ),
          ),
        ),
        // TweenAnimationBuilder(
        //   curve: Curves.elasticInOut,
        //   tween: RelativeRectTween(
        //     begin: RelativeRect.fromLTRB(0, layar.height, 0, 0),
        //     end: RelativeRect.fromLTRB(0, layar.height - 100, 0, 0),
        //   ),
        //   duration: Duration(seconds: 5),
        //   builder: (context, value, child) => Positioned(
        //     bottom: value.bottom,
        //     top: value.top,
        //     left: layar.width * 0.2,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       children: [
        //         text(context, 'Powered By',
        //             fontWeight: FontWeight.w600, textColor: Colors.black38),
        //         gapY(context, 0.3),
        //         Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             text(context, 'Anauri',
        //                 fontSize: 30,
        //                 fontWeight: FontWeight.bold,
        //                 textColor: Colors.black38),
        //             gapX(context, 3),
        //             Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 text(context, "Digital Asistant",
        //                     textColor: Colors.black38),
        //                 text(context, "Visual Enterprise",
        //                     textColor: Colors.black38)
        //               ],
        //             )
        //           ],
        //         ),
        //         gapY(context, 3)
        //       ],
        //     ),
        //   ),
        // ),
        PositionedTransition(
          rect: RelativeRectTween(
            begin: RelativeRect.fromSize(
              Rect.fromLTWH(0, layar.height, 10, 5),
              const Size(10, 50),
            ),
            end: RelativeRect.fromSize(
              Rect.fromLTWH(
                0,
                layar.height - 100,
                200,
                50,
              ),
              const Size(200, 50),
            ),
          ).animate(
              CurvedAnimation(parent: _controller, curve: Curves.elasticInOut)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              text(context, 'Powered By',
                  fontWeight: FontWeight.w600, textColor: Colors.black38),
              gapY(context, 0.3),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  text(context, 'Anauri',
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      textColor: Colors.black38),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(context, "Digital Asistant",
                          textColor: Colors.black38),
                      text(context, "Visual Enterprise",
                          textColor: Colors.black38)
                    ],
                  )
                ],
              ),
              gapY(context, 3)
            ],
          ),
        ),
      ],
    ));
  }
}
