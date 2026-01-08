import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:iroid/constants/app_colors.dart';
import 'package:iroid/constants/app_strings.dart';
import 'package:iroid/data/models/fashion_response.dart';
import 'package:iroid/data/network/service/api_service.dart';
import 'package:iroid/data/network/service/app_url.dart';
import 'package:iroid/modules/common_dialogs/dialogs.dart';

class FashionApi{

  final ApiService _apiService = ApiService();



   Future getFashionData() async {
  try {
    final Response response = await _apiService.post(
      AppUrl.fashion,
  
      options: Options(
        
        headers: {
          'Content-Type': 'application/json',
       },
      ),
    );
    // log(json.decode(response.data));
    // return json.decode(response.data);

    return FashionResponse.fromJson(response.data);
  } on DioException catch (e) {
    if (e.error == AppStrings.noInternetConnection) {
      Dialogs.showSnackbar(AppStrings.noInternetConnection, AppColors.grey);
    }
    rethrow;
  }
}
}
