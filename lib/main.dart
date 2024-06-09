import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pazimo/app/data/LoginResponse.dart';
import 'app/modules/onbording/views/screen/splash_screen.dart';
import 'app/routes/app_pages.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  
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
