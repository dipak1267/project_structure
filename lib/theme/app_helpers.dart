
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_structure/utils/extension.dart';
import 'app_color.dart';


showAppSnackBar(String tittle, {bool status = false}) {
  return Get.showSnackbar(GetSnackBar(
    // message: tittle,
    messageText: tittle.appCommonText(
        size: 18, color: blackTextColor, align: TextAlign.start),
    // messageText: tittle.wallyText(fontSize: 24, fontWeight: wallyLightWeight, color: color),
    borderRadius: 15,
    snackPosition: SnackPosition.BOTTOM,
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
    shouldIconPulse: false,
    icon: Icon(
      status ? Icons.check_circle_outline_rounded : Icons.error_outline,
      color: blackTextColor,
    ),
    backgroundColor: whiteColor,
    duration: const Duration(seconds: 3),
  ));
}



bool isEmailValid(String email) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = RegExp(pattern.toString());
  return regex.hasMatch(email);
}
