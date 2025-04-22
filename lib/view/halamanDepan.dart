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
    return Scaffold(
      body: Stack(
        children: [
          SlideTransition(
            position: Tween<Offset>(
              begin: Offset(-0.2, 0), // Mulai sedikit ke kiri
              end: Offset(0.2, 0), // Berakhir sedikit ke kanan
            ).animate(_controller),
            child: Image.network(
              'https://rt9.anauri.id/assets_front/images/front/front-top-1.jpg',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          AnimatedDefaultTextStyle(
              child: text(context, "text"),
              style: TextStyle(color: Colors.blue),
              duration: Duration(seconds: 2))
          // Center(
          //   child: Text(
          //     'Konten Aplikasi',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 24,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
