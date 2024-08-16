// File: lib/main.dart

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../theme/themedata.dart';
import '../../../Components/search_textfield.dart';

class CategoryController extends GetxController {
  var mostUsed = [
    {'name': 'T-shirt', 'icon': "assets/images/phone.png"},
    {'name': 'Facial', 'icon': "assets/images/tshirt.png"},
    {'name': 'Phone', 'icon': "assets/images/sunscreen.png"},
    {'name': 'Laptop', 'icon': "assets/images/tv.png"},
    {'name': 'Laptop', 'icon': "assets/images/tv.png"},
    {'name': 'Phone', 'icon': "assets/images/sunscreen.png"},
    {'name': 'Facial', 'icon': "assets/images/tshirt.png"},
    {'name': 'T-shirt', 'icon': "assets/images/phone.png"},
  ].obs;

  var otherCategories = [
    {'name': 'Phone', 'icon': 'assets/svg/desktop.svg'},
    {'name': 'Audio Equipment', 'icon': 'assets/svg/mic.svg'},
    {'name': 'Car Equipment', 'icon': 'assets/svg/car.svg'},
    {'name': 'Video Game Consoles', 'icon': 'assets/svg/group.svg'},
  ].obs;

  RxInt selectedIndex = 0.obs;
}

class CategoryPage extends StatelessWidget {
  final CategoryController controller = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
        title: Text('Categories'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            search(),
            SizedBox(height: 16.0),
            // Most Used Categories
            Text('Most used',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 15.0),
            Obx(() {
              return GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: controller.mostUsed.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(width: 1, color: Colors.black12)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          width: 20,
                          '${controller.mostUsed[index]['icon']}',
                          fit: BoxFit.fill,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(controller.mostUsed[index]['name'].toString()),
                      ],
                    ),
                  );
                },
              );
            }),
            SizedBox(height: 16.0),
            // Other Categories
            Text('Other categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8.0),

            Expanded(
                child: ListView.builder(
              itemCount: controller.otherCategories.length,
              itemBuilder: (context, index) {
                return Obx(
                  () => Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.black12),
                        borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      leading: SvgPicture.asset(
                          '${controller.otherCategories[index]['icon']}'),
                      title: Text(
                          controller.otherCategories[index]['name'].toString()),
                      trailing: Container(
                        height: 20,
                        width: 20,
                        child: controller.selectedIndex.value == index
                            ? Container(
                                width: 13,
                                height: 13,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xff115DB1)))
                            : null,
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 1,
                              color: Color(0xff115DB1),
                            )),
                      ),
                      onTap: () => controller.selectedIndex.value = index,
                    ),
                  ),
                );
              },
            )),
            Container(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle update button action
                  },
                  child: Text(
                    'Update',
                    style: GoogleFonts.poppins(color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Colors.yellow,
                    minimumSize: Size(150, 48),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle close button action
                  },
                  child: Text(
                    'Close',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(),
                    backgroundColor: Color(0xff115DB1),
                    minimumSize: Size(150, 48),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
