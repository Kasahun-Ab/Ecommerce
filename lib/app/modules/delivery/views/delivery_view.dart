import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/delivery_controller.dart';
import 'Screen/deliveryDashboord.dart';

class DeliveryView extends GetView<DeliveryController> {
  const DeliveryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final activePageIndex = 0.obs;
    List<Widget> page = [
      Deliverydashboord(),
    ];
    return Scaffold(
      body: Obx(() => page[activePageIndex.value]),
    );
  }
}
