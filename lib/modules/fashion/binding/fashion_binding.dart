import 'package:get/get.dart';
import 'package:iroid/modules/fashion/controller/fashion_controller.dart';

class FashionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FashionController>(() => FashionController());
  }
}
