import 'package:get/get.dart';

class HomeController extends GetxController {

  

  RxMap<String, dynamic> details_of_product = <String, dynamic>{}.obs;

  RxList<Map<String, dynamic>> carts = <Map<String, dynamic>>[].obs;

  RxList<Map<String, dynamic>> Saved = <Map<String, dynamic>>[].obs;

  void addtoCart(Map<String, dynamic> details) {
    carts.add(details);
  }
  
  int priceCalculation( RxInt itemNum,RxInt price_of_item) {
     return  price_of_item.value * itemNum.value;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
