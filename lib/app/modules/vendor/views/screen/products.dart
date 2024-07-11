import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../Components/search_textfield.dart';
import 'ProductEdit.dart';
import 'prooductDetails_vender.dart';

class ProductsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Products',
          style: TextStyle(color: Color(0xff115DB1)),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xff115DB1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            search(),
            SizedBox(height: 16.0),
            _buildProductCard(
              context,
              'https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp',
              'Iphone 14 pro 256gb',
              'ETB 80,000 · 30 in stock',
            ),
            _buildDivider(),
            _buildProductCard(
                context,
                'https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp',
                'Macbook pro',
                'ETB 80,000 · 10 in stock'),
            _buildDivider(),
            _buildProductCard(
              context,
              'https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp',
              'Iphone 12 pro 256gb',
              'ETB 80,000 · 20 in stock',
            ),
            _buildDivider(),
            _buildProductCard(
              context,
              'https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp',
              'Iphone 13 pro 128gb',
              'ETB 80,000 · 30 in stock',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductCard(
      BuildContext context, String imagePath, String mainText, String subText) {
    return Card(
      color: Colors.white,

      elevation: 0, // Remove the shadow by setting elevation to 0
      child: GestureDetector(
        onTap: () {
          Get.to(ProductDetailView(
            id: 1,
          ));
        },
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Row(
            children: [
              Image.network(
                imagePath,
                width: 50,
                height: 50,
              ),
              SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainText,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(subText),
                  ],
                ),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: () {
                  Get.to(() => ProductEdit());
                },
                child: Text(
                  'Edit',
                  style: TextStyle(color: Color(0xff115DB1)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Divider(
        color: Color.fromARGB(133, 214, 209, 209),
        thickness: 1,
      ),
    );
  }
}
