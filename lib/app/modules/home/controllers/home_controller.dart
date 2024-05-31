import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pazimo/api/ApiConfig.dart';
import 'package:pazimo/app/data/orderModel.dart';
import 'package:pazimo/app/data/productModel.dart';
import 'package:pazimo/app/routes/app_pages.dart';

import '../../../data/LoginResponse.dart';

class HomeController extends GetxController {
  final dio = Dio();
  late LoginResponse userData;

  final storage = GetStorage();

  var orders = <Order>[].obs;
  RxInt selectedIndex = 0.obs;
  RxDouble sub_total = 0.0.obs;
  RxDouble total = 0.0.obs;
  RxDouble shippingFee = 80.0.obs;
  RxDouble vat = 15.0.obs;
  RxBool isHome = true.obs;
  RxInt selectedProductIndex = 2.obs;

  final products = <Product>[].obs;

  RxList<Product> liked = <Product>[].obs;

  RxMap<String, dynamic> details_of_product = <String, dynamic>{}.obs;

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
    double total = 0;
    carts.forEach((element) {
      total += element["total_price"];
    });
    sub_total.value = total;
  }

  calculateTotal(List<Map<String, dynamic>> carts) {
    double _total = 0;
    carts.forEach((element) {
      _total += element["total_price"];
    });
    total.value = _total + shippingFee.value + vat.value;
  }

  double priceCalculation(RxInt itemNum, RxDouble price_of_item) {
    return price_of_item.value * itemNum.value;
  }

  double totalPriceWithVat(List<Map<String, dynamic>> carts) {
    double total = 0;
    carts.forEach((element) {
      total += element["total_price"];
    });
    return total;
  }

  void addStorage(Product listOfLiked) {
    liked.add(listOfLiked);
    final List<Map<String, dynamic>> productListJson =
        products.map((product) => product.toJson()).toList();
    storage.write('liked', productListJson);
  }

  void removeStorage(Product listOfLiked) {
    liked.remove(listOfLiked);
    final List<Map<String, dynamic>> productListJson =
        liked.map((product) => product.toJson()).toList();
    storage.write('liked', productListJson);
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

  List<Product> getProducts() {
    final List<dynamic>? productListJson = storage.read('liked');
    if (productListJson != null) {
      return productListJson
          .whereType<Map<String, dynamic>>() // Filter out non-maps
          .map((productJson) => Product.fromJson(productJson))
          .toList();
    } else {
      return [];
    }
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

  LoginResponse? getLoginResponse() {
    final data = storage.read('loginResponse');
    if (data != null) {
      return LoginResponse.fromJson(Map<String, dynamic>.from(data));
    }
    return null;
  }

  @override
  void onInit() {
    userData = getLoginResponse()!;

    // liked.value = getProducts();
    fetchOrders();

    products.addAll([
      Product(
        id: '1',
        name: "iPhone 13 ",
        brand: "Apple",
        photos: [
          "assets/images/iphone.png",
        ],
        colors: [
          "blue",
          "black",
          "red",
          "green",
        ],
        sizes: [
          "64 GB",
          "128 GB",
          " 256 GB",
        ],
        reviews: [
          {
            "name": "John Doe",
            "rating": 4.5,
            "comment": "Great product!",
          },
          {
            "name": "Jane Smith",
            "rating": 4.0,
            "comment": "I love it!",
          },
          {
            "name": "Michael Johnson",
            "rating": 3.5,
            "comment": "OK product!",
          },
        ],
        price: 130434,
        description: 'The iPhone 14 is a solid smartphone ',
        category: 'Mobile',
        specifications:
            " 6.1-inch OLED display, 12MP dual rear cameras, A15 Bionic chip , 5G connectivity, iOS 16, no expandable storage ,Starts at 128GB and priced from 799 (prices may vary)",
        materialAndCare:
            'Apple doesnt provide a specific "materialAndCare" section for iPhones on their website. However, based on previous models, the iPhone 14 likely has a glass front and back with a stainless steel frame',
      ),
      Product(
        id: '2',
        name: "smart T-shirt  ",
        brand: "Polo",
        photos: [
          "assets/images/tshert.png",
        ],
        colors: [
          "blue",
          "black",
          "red",
          "green",
        ],
        sizes: [
          "XL",
          "XXl",
          "Large",
        ],
        reviews: [
          {
            "name": "John Doe",
            "rating": 4.5,
            "comment": "Great product!",
          },
          {
            "name": "Jane Smith",
            "rating": 4.0,
            "comment": "I love it!",
          },
          {
            "name": "Michael Johnson",
            "rating": 3.5,
            "comment": "OK product!",
          },
        ],
        price: 213434,
        description: 'The Samsung S22 packs a powerful processor ',
        category: 'Mobile',
        specifications:
            "6.1-inch 120Hz AMOLED display, Qualcomm Snapdragon 8 Gen 1 processor, 8GB RAM, 128/256GB storage, 50MP triple-camera system, 3700mAh battery.",
        materialAndCare:
            'Samsung doesnt have a dedicated "materialAndCare section for the Galaxy S22. But based on previous models, heres likely',
      ),
      Product(
        id: '3',
        name: "Addidas T-shirt  ",
        brand: "Addidas",
        photos: [
          "assets/images/tshirt.png",
        ],
        colors: [
          "blue",
          "black",
          "red",
          "green",
        ],
        sizes: [
          "XL",
          "XXl",
          "Large",
        ],
        reviews: [
          {
            "name": "John Doe",
            "rating": 4.5,
            "comment": "Great product!",
          },
          {
            "name": "Jane Smith",
            "rating": 4.0,
            "comment": "I love it!",
          },
          {
            "name": "Michael Johnson",
            "rating": 3.5,
            "comment": "OK product!",
          },
        ],
        price: 213434,
        description: 'The Samsung S22 packs a powerful processor ',
        category: 'Mobile',
        specifications:
            "6.1-inch 120Hz AMOLED display, Qualcomm Snapdragon 8 Gen 1 processor, 8GB RAM, 128/256GB storage, 50MP triple-camera system, 3700mAh battery.",
        materialAndCare:
            'Samsung doesnt have a dedicated "materialAndCare section for the Galaxy S22. But based on previous models, heres likely',
      ),
    ]);
    super.onInit();
  }

  Future Logout() async {
    storage.remove("loginResponse");
    Get.offNamed(Routes.AUTHENTICATION);

    try {
      final response = await dio.post(
          '${ApiConfig.baseUrl}/${ApiConfig.loginEndpoint}',
          options: Options(headers: ApiConfig.getHeaders(userData.token)));

      if (response.statusCode == 201) {
        print('Logout successful');
        print(response.data);
      } else {
        print('Failed to logout: ${response.statusCode}');
        print(response.data);
      }
    } catch (e) {
      print(e.toString());
    }
  }

//0933681528

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
