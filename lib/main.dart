import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
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
          theme: themeData(context),
          title: "Pazimo",
          home: SplashScreen(),
          getPages: AppPages.routes,
        )),
  ));
}

// Returns a ThemeData based on the provided BuildContext.
ThemeData themeData(BuildContext context) {
  return ThemeData(
    colorScheme: ColorScheme.fromSwatch(
      brightness: Brightness.light,
    ),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Poppins",
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme:
        GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme.copyWith(
              displayLarge: GoogleFonts.poppins(
                  fontSize: 96,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.5),
              displayMedium: GoogleFonts.poppins(
                  fontSize: 60,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 0.5),
              displaySmall: GoogleFonts.poppins(
                  fontSize: 48, fontWeight: FontWeight.w400),
              headlineMedium: GoogleFonts.poppins(
                  fontSize: 34,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              headlineSmall: GoogleFonts.poppins(
                  fontSize: 24, fontWeight: FontWeight.w400),
              titleLarge: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.15),
              titleMedium: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.15),
              titleSmall: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.1),
              bodyLarge: GoogleFonts.poppins(
                  color: Color(0XFFB3B3B3),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.5),
              bodyMedium: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.25),
              labelLarge: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.25),
              bodySmall: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.4),
              labelSmall: GoogleFonts.poppins(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.5),
            )),
    iconTheme: IconThemeData(color: Colors.blue),
  );
}
