
import 'package:get/get.dart';
import 'package:iroid/modules/binding/fashion_binding.dart';
import 'package:iroid/modules/view/fashion_screen.dart';

import 'app_routes.dart';

class AppPages {
  static var pages = [
    GetPage(
      name: AppRoutes.fashionScreen,
      page: () => FashionScreen(),
      transition: Transition.rightToLeftWithFade,
      binding: FashionBinding(),
    ),
 
  ];
}
