import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iroid/routes/app_routes.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(AppRoutes.fashionScreen);
    });

    return const Scaffold(
      body: Center(
        child: Text(
          'Iroid',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}