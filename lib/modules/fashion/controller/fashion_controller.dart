import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:iroid/constants/app_colors.dart';
import 'package:iroid/constants/app_strings.dart';
import 'package:iroid/data/models/fashion_response.dart';
import 'package:iroid/data/network/api/fashion_api.dart';
import 'package:iroid/data/network/service/api_exception.dart';
import 'package:iroid/data/network/service/api_service.dart';
import 'package:iroid/modules/common_dialogs/dialogs.dart';

class FashionController extends GetxController {
  var isLoading = false.obs;
  var fashionApi = FashionApi();
  var fashionData = FashionData().obs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getFashionData();
  }

  Future getFashionData() async {
    isLoading(true);

    try {
      final response = await fashionApi.getFashionData();
      switch (response.status) {
        case "success":
          fashionData.value = response.data!;
          log(fashionData.value.toString());
          isLoading(false);

        default:
          Dialogs.showSnackbar(
            AppStrings.somethingWentWrong,
            AppColors.redError,
          );
          isLoading(false);
      }
    } on DioException catch (e) {
      final ApiException apiException = ApiException.fromDioError(e);
      // Get.snackbar(AppStrings.error, apiException.toString());
    }
  }
}
