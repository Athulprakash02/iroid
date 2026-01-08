
import 'package:get/get.dart';
import 'package:iroid/modules/fashion/binding/fashion_binding.dart';
import 'package:iroid/modules/fashion/view/fashion_screen.dart';
import 'package:iroid/modules/splash/view/splash_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var pages = [
     GetPage(
      name: AppRoutes.splashScreen,
      page: () => SplashScreen(),
      transition: Transition.rightToLeftWithFade,
     
    ),
    GetPage(
      name: AppRoutes.fashionScreen,
      page: () => FashionScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: FashionBinding(),
    ),
 
  ];
}
