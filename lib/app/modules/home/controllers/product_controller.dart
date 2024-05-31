import 'package:get/get.dart';

class Product {
  final String imageUrl;
  final String title;
  final double price;
  final double originalPrice;

  Product({
    required this.imageUrl,
    required this.title,
    required this.price,
    required this.originalPrice,
  });
}

class Event {
  final String imageUrl;
  final String title;
  final double price;

  Event({
    required this.imageUrl,
    required this.title,
    required this.price,
  });
}

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var events = <Event>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    fetchEvents();
  }

  void fetchProducts() {
    var serverResponse = [
      Product(
          imageUrl: 'assets/images/tshirt.png',
          title: 'Pink never surrender shirt',
          price: 800,
          originalPrice: 80000),
      Product(
          imageUrl: 'assets/images/tshirt.png',
          title: 'Pink never surrender shirt',
          price: 800,
          originalPrice: 80000),
      // Add more products as needed
    ];

    products.value = serverResponse;
  }

  void fetchEvents() {
    var serverResponse = [
      Event(
          imageUrl: 'assets/images/event1.jpg',
          title: 'Valentine Day event',
          price: 800),
      Event(
          imageUrl: 'assets/images/event1.jpg',
          title: 'Start-up conference',
          price: 800),
      // Add more events as needed
    ];

    events.value = serverResponse;
  }
}
