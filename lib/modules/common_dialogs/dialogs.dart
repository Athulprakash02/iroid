
import 'package:flutter/material.dart';
import 'package:get/get.dart';

var isSnackbarOpen = false.obs;

class Dialogs {
  static showSnackbar(message, color,) {
    if (!isSnackbarOpen.value) {
      isSnackbarOpen.value = true;

      ScaffoldMessenger.of(Get.context!)
          .showSnackBar(
            SnackBar(
              behavior: SnackBarBehavior.floating,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              content: Text(
                message,
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: color,
              // duration: Duration(seconds: 2),
            ),
          )
          .closed
          .then((_) {
        isSnackbarOpen.value = false; // reset when snackbar disappears
      });
    }

  }

}