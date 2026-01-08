import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iroid/routes/app_pages.dart';
import 'package:iroid/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: "Iroid Test",
        initialRoute: AppRoutes.splashScreen,
        getPages: AppPages.pages,
        debugShowCheckedModeBanner: false,
       
      );
  }
}
