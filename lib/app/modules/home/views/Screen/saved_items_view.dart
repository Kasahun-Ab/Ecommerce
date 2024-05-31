import 'package:flutter/material.dart';

import 'package:get/get.dart';


class SavedItem {
  final String name;
  final String imageUrl;
  final double price;
  final double rating;

  SavedItem({
    required this.name,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}

class SavedItemsController extends GetxController {
  var savedItems = <SavedItem>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchSavedItems();
  }

  void fetchSavedItems() {
    // Dummy data for illustration
    var items = [
      SavedItem(
        name: 'AirPods',
        imageUrl: 'assets/airpods.png',
        price: 149.00,
        rating: 4.9,
      ),
      SavedItem(
        name: 'iPhone 14 Pro',
        imageUrl: 'assets/iphone.png',
        price: 149.00,
        rating: 4.9,
      ),
      SavedItem(
        name: 'Macbook Pro 2022',
        imageUrl: 'assets/macbook.png',
        price: 149.00,
        rating: 4.9,
      ),
      SavedItem(
        name: 'Xbox Trm',
        imageUrl: 'assets/xbox.png',
        price: 149.00,
        rating: 4.9,
      ),
      SavedItem(
        name: 'iPad',
        imageUrl: 'assets/ipad.png',
        price: 149.00,
        rating: 4.9,
      ),
      SavedItem(
        name: 'Controller',
        imageUrl: 'assets/controller.png',
        price: 149.00,
        rating: 4.9,
      ),
    ];

    savedItems.assignAll(items);
  }
}

class SavedItemsPage extends StatelessWidget {
  final SavedItemsController controller = Get.put(SavedItemsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Items'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(() {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16.0,
              mainAxisSpacing: 8.0,
              childAspectRatio: 0.79,
            ),
            itemCount: controller.savedItems.length,
            itemBuilder: (context, index) {
              final item = controller.savedItems[index];
              return Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                        ),
                        child: Image.network(
                          "https://images.pexels.com/photos/757889/pexels-photo-757889.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '\$${item.price.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              SizedBox(width: 4),
                              Text(
                                item.rating.toString(),
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                              ),
                              Spacer(),
                              IconButton(
                                icon: Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
