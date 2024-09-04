import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:untitled3/core/helpers/extensions.dart';
import 'chat/Api/linkapi.dart';
import 'chat/Api/service/notifications.dart';
import 'chat/pusher/pusher.dart';
import 'core/di/dependency_injection.dart';
import 'core/helpers/constants.dart';
import 'core/routing/app_router.dart';
import 'yalla_work.dart';
import 'features/add/widget/shared_preferences.dart';
String ImageC= 'assets/images/Capture.png';
File?image;
const K = TextStyle(fontSize: 30,color: Color(0xFF01002f),
  fontWeight: FontWeight.bold,);
const F = TextStyle(fontSize: 22,color: Color(0xFF88869f),
);

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CachData.casheInitialization();
  setupGetIt();
  await ScreenUtil.ensureScreenSize();
  await initializeLocalNotifications();
  // Get.put(PusherController());
  await checkIfLoggedInUser();
  runApp(YallaWork(
    appRouter: AppRouter(),
  ),);
}

checkIfLoggedInUser() async {
  String? token = CachData.getData(key: 'access_token');
  if (token != null) {
    AppLink.token = token;
    AppLink.myId = CachData.getData(key: 'user_id');
    Get.put(PusherController());
    isLoggedInUser = true;
  } else {
    isLoggedInUser = false;
  }
}