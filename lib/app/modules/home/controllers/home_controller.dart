import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:get_storage/get_storage.dart';
import 'package:pazimo/app/data/orderModel.dart';
import 'package:pazimo/app/data/productModel.dart' as pro;
import 'package:pazimo/app/data/whishlist.dart';

import '../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../data/Category .dart';
import '../../../data/Customer.dart' as user;

class HomeController extends GetxController with GetSingleTickerProviderStateMixin  {
  late AnimationController animationController;
  late Animation<double> animation;

  var categories = <Categories>[].obs;
  RxBool iscategories = false.obs;
   RxBool isproductFeach = false.obs;
  RxBool isLoading = true.obs;

  user.Customerdata? userData;
  
  RxBool isnew = false.obs;
  var wishlist = Wishlist(data: []).obs;
  Api _api = Api();
  RxList BigSave = [].obs;
  final storage = GetStorage();

  var orders = <Order>[].obs;

  RxInt selectedIndex = 0.obs;
  RxDouble sub_total = 0.0.obs;
  RxDouble total = 0.0.obs;
  RxDouble shippingFee = 80.0.obs;
  RxDouble vat = 15.0.obs;
  RxBool isHome = true.obs;

  RxInt selectedProductIndex = 2.obs;

  var products = pro.Product(
    data: [],
  ).obs;

  RxMap<String, dynamic> productDetailData = <String, dynamic>{}.obs;

  RxList<Map<String, dynamic>> carts = <Map<String, dynamic>>[].obs;

  RxList<Map<String, dynamic>> Saved = <Map<String, dynamic>>[].obs;

  RxInt brandSelectedIndex = 0.obs;
  RxInt colorSelectedIndex = 0.obs;
  RxDouble startValue = 20.0.obs;
  RxDouble endValue = 80.0.obs;

  void updateValues(double start, double end) {
    startValue.value = start;
    endValue.value = end;
  }

  void addtoCart(Map<String, dynamic> details) {
    carts.add(details);
  }

  void removeFromCart(Map<String, dynamic> details) {
    carts.remove(details);
  }

  calculateSubTotal(List<Map<String, dynamic>> carts) {
    double total = 0.0;

    carts.forEach((element) {
      total += element["total_price"].value;
    });
    sub_total.value = total;
  }

  calculateTotal(List<Map<String, dynamic>> carts) {
    double _total = 0;
    carts.forEach((element) {
      _total += element["total_price"].value;
    });
    total.value = _total + shippingFee.value + vat.value;
  }

  double priceCalculation(RxInt itemNum, RxDouble price_of_item) {
    final result = price_of_item * itemNum.value;
    return result;
  }

  var suggestions = <String>[].obs;

  var textController = TextEditingController().obs;

  final List<String> allSuggestions = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Fig',
    'Grape',
    'Lemon',
    'Mango',
    'Nectarine',
    'Orange',
    'Papaya',
    'Quince',
    'Raspberry',
    'Strawberry',
    'Tomato',
    'Ugli fruit',
    'Watermelon'
  ];

  void updateSuggestions(String query) {
    suggestions.value = allSuggestions
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void fetchOrders() {
    var orderList = [
      Order(
          name: 'Regular Fit Slogan',
          size: 'M',
          price: 1190,
          rating: 4.5,
          completed: true),
      Order(
          name: 'Regular Fit Polo',
          size: 'L',
          price: 1100,
          rating: 4.5,
          completed: true),
      Order(
          name: 'Regular Fit Black',
          size: 'L',
          price: 1690,
          rating: 4.0,
          completed: true),
      Order(
          name: 'Regular Fit V-Neck',
          size: 'S',
          price: 1290,
          rating: 3.5,
          completed: true),
      Order(
          name: 'Regular Fit Pink',
          size: 'M',
          price: 1341,
          rating: 3.5,
          completed: true),
    ];
    orders.assignAll(orderList);
  }

  getWishlist() async {
    final response = await _api.getWishlist();
    if (response?.statusCode == 200) {
      var data = response!.data;
      wishlist.value = Wishlist.fromJson(data);
    }
  }


  @override
  void onInit() async {
    animationController=AnimationController(vsync: this,duration: Duration(milliseconds: 500))
    ; 
   animation = Tween<double>(begin: -5.0, end: 0.0).chain(CurveTween(curve: Curves.elasticIn)).animate(animationController);



     _api.initializeDio();
     userData = await getLoginResponse();
    getCategory();
    getWishlist();
    
getProduct();
await _api.fetchBigSave();
  
    fetchOrders();

    super.onInit();
  }
void startShakeAnimation(){
  print("clicked");
animationController.forward(from: 0.0);
}

//0933681528

  @override
  void onReady() {
    super.onReady();
  }

  close() {
    onClose();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<user.Customerdata?> getLoginResponse() async {
    user.Customerdata userdata;
    try {
      final data = await storage.read('loginResponse');
      if (data != null) {
        userdata = user.CustomerdataFromJson(data);

        return userdata;
      }
    } catch (e) {
      print('Error reading loginResponse: $e');
    }
    return null;
  }

 getProduct() async{
  
  products.value = await _api.fetchProducts();

 }
 
  Future setLoginResponse(user.Data data) async {
  
    user.Customerdata userdata = user.Customerdata(
        data: data, message: userData!.message, token: userData!.token);

    try {
      final data = await storage.read('loginResponse');
      if (data != null) {
        userdata =user.CustomerdataFromJson(data);

        return userdata;
      }
    } catch (e) {
      print('Error reading loginResponse: $e');
    }
    return null;
  }

  Future getCategory() async {
    iscategories.value = true;
    final response = await Api().getCategories();

    if (response?.statusCode == 200) {
      var categoryList = (response?.data['data'] as List)
          .map((i) => Categories.fromJson(i))
          .toList();
          print(categoryList.length);
      categories.assignAll(categoryList);
      iscategories.value = false;
    }
 
  }
}