import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pazimo/api/ApiConfig.dart';

import 'package:pazimo/app/data/orderModel.dart';
import 'package:pazimo/app/data/productModel.dart';
import 'package:pazimo/app/data/whishlist.dart';

import '../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../data/Category .dart';
import '../../../data/LoginResponse.dart';

class HomeController extends GetxController {
  dio.Dio _dio = dio.Dio(dio.BaseOptions(baseUrl: ApiConfig.baseurl));
  var categories = <Categories>[].obs;
  RxBool iscategories = false.obs;
  RxBool isLoading = true.obs;
  late LoginResponse userData;
  RxBool isnew = false.obs;
  var wishlist = <whishlistmodel>[].obs;
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

  var products = ProductResponse(data: []).obs;

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

  @override
  void onInit() async {
    getCategory();
    _api.initializeDio();
    getLoginResponse();
    // wishlist.value = await _api.feachWhishlist();
    products.value = await _api.fetchProducts();
   
    fetchOrders();

    super.onInit();
  }

  // SelectBigSave() {
  //   return products.value.data

  //       .obs;
  // }
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

  Future<LoginResponse?> getLoginResponse() async {
    try {
      final data = await storage.read('loginResponse');
      if (data != null) {
        userData = LoginResponse.fromJson(Map<String, dynamic>.from(data));

        return userData;
      }
    } catch (e) {
      print('Error reading loginResponse: $e');
    }
    return null;
  }

  Future getCategory() async {
    iscategories.value = true;
    final response = await Api().getCategories();
    if (response!.statusCode == 200) {
      var categoryList = (response.data['data'] as List)
          .map((i) => Categories.fromJson(i))
          .toList();
      categories.assignAll(categoryList);
      iscategories.value = false;
    }
    print(categories.length);
  }
}
