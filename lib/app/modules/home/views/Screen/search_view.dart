import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/Item_not_found.dart';
import 'package:pazimo/app/modules/Components/Seggestion.dart';
import 'package:pazimo/app/modules/Components/filter_and_sort_button.dart';
import 'package:pazimo/app/modules/Components/finlter_button.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/Components/search_items.dart';

import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

// ignore: must_be_immutable
class SearchView extends StatelessWidget {
  SearchView({super.key});
  final HomeController controller = Get.find<HomeController>();
  RxInt SortingIndex = 0.obs;
  RxBool isSegestion = false.obs;
  @override
  Widget build(BuildContext context) {
    List SortingmethodList = [
      "Recommended",
      "Recently Added",
      "Price: Low to High",
      "Price: High to low",
      "Top rated",
    ];
    RxString _selectedItem = "L".obs;
    List listofbrand = [
      "All",
      "Addidas",
      "iphone",
      "samsung",
      "Hp",
    ];
    List ColorList = [
      "All",
      "Blue",
      "Red",
      "Green",
      "Gray",
    ];
    final List<String> _dropdownItems = ['L', 'M', 'X', 'XX'];
    List suggestion = [
      "Jeans",
      "Casual clothes",
      "Hoodie",
      "Nike shoes black",
      "V-neck tshirt",
      "Winter clothes"
    ];
    RxBool ishadData = false.obs;
    Size size = MediaQuery.of(context).size;
    TextEditingController textController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  onTap: () {
                    isSegestion.value = true;
                  },
                  onSubmitted: (value) {
                    isSegestion.value = false;
                  },
                  controller: textController,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    hintText: "search Pazimo",
                    hintStyle: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      fontSize: 16,
                      color: Color(0xff666666),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 3),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Add your search logic here
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  width: 58,
                  height: 39,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //"Sort By" Button
                        SearchButton(
                          size: size,
                          title: "Sort By",
                          bg: Colors.amber,
                          textcolor: Colors.black,
                          icon: "assets/svg/sort.svg",
                          tap: () {
                            Get.bottomSheet(Sorts(size, SortingmethodList));
                          },
                        ),
                        // Filter button
                        SearchButton(
                          size: size,
                          title: "Filter",
                          bg: Colors.blue,
                          textcolor: Colors.white,
                          icon: "assets/svg/filter.svg",
                          tap: () {
                            Get.bottomSheet(Filters(size, listofbrand,
                                ColorList, _selectedItem, _dropdownItems));
                          },
                        ),
                      ],
                    ),
                  ),
                  isSegestion.value == true
                      ? seggestion(suggestion: suggestion)
                      : ishadData.value == true
                          ? ItemNotFound(size: size)
                          : searchItems(size: size)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container Sorts(Size size, List<dynamic> SortingmethodList) {
    return Container(
        height: 350.h,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        child: Column(children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              color: Colors.grey,
              width: 100.w,
              height: 3.h,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Sort By",
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Colors.black38,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.close,
                color: Colors.blue,
              ),
            ],
          ),
          Divider(
            color: Color.fromARGB(20, 0, 0, 0),
          ),
          SizedBox(
            height: 7.h,
          ),
          Container(
            height: 200.h,
            child: ListView.builder(
              itemCount: SortingmethodList.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Obx(
                  () => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          SortingIndex.value = index;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              SortingmethodList[index],
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Container(
                              height: 20,
                              width: 20,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.black, width: 2)),
                              child: Center(
                                  child: SortingIndex.value == index
                                      ? Container(
                                          height: 12,
                                          width: 12,
                                          decoration: BoxDecoration(
                                            color: const Color.fromARGB(
                                                255, 0, 0, 0),
                                            shape: BoxShape.circle,
                                          ),
                                        )
                                      : Container()),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                );
              },
            ),
          )
        ]));
  }

  Container Filters(
      Size size,
      List<dynamic> listofbrand,
      List<dynamic> ColorList,
      RxString _selectedItem,
      List<String> _dropdownItems) {
    return Container(
      height: 600.h,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          SizedBox(
            height: 20.h,
          ),
          Center(
            child: Container(
              color: Colors.grey,
              width: 100.w,
              height: 3.h,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: GoogleFonts.poppins(
                    fontSize: 20.sp,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500),
              ),
              Icon(
                Icons.close,
                color: Colors.blue,
              ),
            ],
          ),
          Divider(
            color: Color.fromARGB(20, 0, 0, 0),
          ),
          SizedBox(
            height: 7.h,
          ),
          Column(
            children: [
              filterButton(
                title: 'Brand',
                buttonTitle: '',
                tap: () {},
                listofItems: listofbrand,
                selectedIndex: controller.brandSelectedIndex,
                listoflist: 0,
              ),
              SizedBox(
                height: 7.h,
              ),
              filterButton(
                title: 'Color',
                buttonTitle: '',
                tap: () {},
                listofItems: ColorList,
                selectedIndex: controller.colorSelectedIndex,
                listoflist: 1,
              ),
              SizedBox(
                height: 4.h,
              ),
              Divider(
                color: Color.fromARGB(20, 0, 0, 0),
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Price",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  Row(
                    children: [
                      Obx(() => Text(
                            '\$ ${controller.startValue.toStringAsFixed(1)}',
                            style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Color(0xff808080),
                                fontWeight: FontWeight.normal),
                          )),
                      Text(" - "),
                      Obx(() => Text(
                            '\$ ${controller.endValue.toStringAsFixed(1)}',
                            style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: Color(0xff808080),
                                fontWeight: FontWeight.normal),
                          )),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 5.h),
              Obx(
                () => Container(
                  child: RangeSlider(
                    values: RangeValues(
                        controller.startValue.value, controller.endValue.value),
                    min: 0,
                    max: 100,
                    divisions: 100,
                    activeColor: Colors.blue,
                    onChanged: (RangeValues values) {
                      controller.updateValues(values.start, values.end);
                    },
                    labels: RangeLabels(
                      controller.startValue.toStringAsFixed(1),
                      controller.endValue.toStringAsFixed(1),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Size",
                    style: GoogleFonts.poppins(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.blue),
                  ),
                  DropdownButton<String>(
                    alignment: AlignmentDirectional.center,
                    icon: Icon(Icons.navigate_next),
                    value: _selectedItem.value,
                    hint: Text('Select an item'),
                    items: _dropdownItems.map((String item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        child: Text(item),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      _selectedItem.value = newValue!;
                    },
                  ),
                ],
              ),
              Button(
                  title: "Apply Filters",
                  color: Colors.blue,
                  onPressed: () {},
                  hasBorder: false,
                  iconDirectionIsRight: true,
                  hasIcon: false)
            ],
          )
        ],
      ),
    );
  }
}
