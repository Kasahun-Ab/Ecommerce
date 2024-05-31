// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/CardTitle_with%20Icon.dart';
import 'package:pazimo/app/modules/Components/product_card.dart';
import 'package:pazimo/app/modules/Components/search_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final HomeController controller = Get.find<HomeController>();

  List catagories = ["T-shirt", "Facial", "Phone", "Computers", "Game"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: search()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: catagories.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage("assets/images/laptop.png"),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            catagories[index],
                            style: GoogleFonts.poppins(
                              color: Color(0xff333333),
                              fontSize: 14,
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/banner.png"))),
            ),
            SizedBox(
              height: 20.h,
            ),
            CardTitle_with_icon(
              title: 'Big Save',
              subtitle: 'Top brand’s, price slashed',
              tap: () {},
            ),
            SizedBox(
              height: 12.h,
            ),
            Container(
              height: 290.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    print(controller.products[index].id);
                    return Container(
                      margin: EdgeInsets.only(right: 8.w),
                      child: ProductCard(
                        ImageSource: controller.products[index].photos[0],
                        description: controller.products[index].description,
                        price: 'ETB ${controller.products[index].price} ',
                        oldprice: '80000',
                        tap: () {
                          controller.selectedProductIndex.value = index;
                          controller.selectedIndex.value = 6;
                        },
                        index: "${controller.products[index].id}",
                      ),
                    );
                  }),
            ),
            CardTitle_with_icon(
              title: "Recommended For you",
              tap: () {
                controller.selectedIndex.value = 5;
              },
            ),
            SizedBox(
              height: 5.h,
            ),
            Container(
              height: 290.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    print(controller.products[index].id);
                    return Container(
                      margin: EdgeInsets.only(right: 8.w),
                      child: ProductCard(
                        ImageSource: controller.products[index].photos[0],
                        description: controller.products[index].description,
                        price: 'ETB ${controller.products[index].price} ',
                        oldprice: '80000',
                        tap: () {
                          controller.selectedProductIndex.value = index;
                          controller.selectedIndex.value = 6;
                        },
                        index: "${controller.products[index].id}",
                      ),
                    );
                  }),
            ),
          ]),
        ),
      ),
    );
  }
}
