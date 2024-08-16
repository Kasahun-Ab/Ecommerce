import 'package:get/get.dart';

import '../modules/Affiliate/bindings/affiliate_binding.dart';
import '../modules/Affiliate/views/affiliate_view.dart';
import '../modules/EventOrganizer/bindings/event_organizer_binding.dart';
import '../modules/EventOrganizer/views/event_organizer_view.dart';
import '../modules/authentication/bindings/authentication_binding.dart';
import '../modules/authentication/views/authentication_view.dart';
import '../modules/delivery/bindings/delivery_binding.dart';
import '../modules/delivery/views/delivery_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home.dart';
import '../modules/onbording/bindings/onbording_binding.dart';
import '../modules/onbording/views/SplashScreen.dart';
import '../modules/vendor/bindings/vendor_binding.dart';
import '../modules/vendor/views/vendor_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ONBORDING,
      page: () => OnboardingScreen(),
      binding: OnbordingBinding(),
    ),
    GetPage(
      name: _Paths.AUTHENTICATION,
      page: () => AuthenticationView(),
      binding: AuthenticationBinding(),
    ),
    GetPage(
      name: _Paths.VENDOR,
      page: () => VendorView(),
      binding: VendorBinding(),
    ),
    GetPage(
      name: _Paths.AFFILIATE,
      page: () => AffiliateView(),
      binding: AffiliateBinding(),
    ),
    GetPage(
      name: _Paths.EVENT_ORGANIZER,
      page: () => EventOrganizerView(),
      binding: EventOrganizerBinding(),
    ),
    GetPage(
      name: _Paths.DELIVERY,
      page: () => const DeliveryView(),
      binding: DeliveryBinding(),
    ),
  ];
}
