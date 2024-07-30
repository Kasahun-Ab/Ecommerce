import 'package:get/get.dart';

import '../controllers/event_organizer_controller.dart';

class EventOrganizerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventOrganizerController>(
      () => EventOrganizerController(),
    );
  }
}
