import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/modules/onbording/views/screen/splash_screen.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  // HttpOverrides.global = MyHttpOverrides();
  runApp(ScreenUtilInit(
    useInheritedMediaQuery: true,
    minTextAdapt: true,
    splitScreenMode: true,
    ensureScreenSize: true,
    designSize: Size(390, 844),
    builder: ((context, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: "Pazimo",
          home: SplashScreen(),
          getPages: AppPages.routes,
        )),
  ));
}

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback =
//           (X509Certificate cert, String host, int port) => true;
//   }
// }
