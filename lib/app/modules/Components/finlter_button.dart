

// ignore: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

// ignore: must_be_immutable
class filterButton extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  filterButton({
    required this.title,
    required this.buttonTitle,
    required this.listofItems,
    required this.selectedIndex,
    required this.tap,
    required this.listoflist,
    super.key,
  });

  String title;
  int listoflist;
  String buttonTitle;
  RxInt selectedIndex;
  final Function() tap;
  final List listofItems;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 16, fontWeight: FontWeight.w500, color: Colors.blue),
        ),
        SizedBox(
          height: 5.h,
        ),
        Container(
          width: MediaQuery.of(context).size.width.w - 32.w,
          height: 30.h,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listofItems.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    if (listoflist == 0) {
                      controller.brandSelectedIndex.value = index;
                    } else if (listoflist == 1) {
                      controller.colorSelectedIndex.value = index;
                    }
                  },
                  child: Obx(
                    () => Container(
                      height: 30.h,
                      margin: EdgeInsets.only(left: 10.w),
                      padding: EdgeInsets.symmetric(horizontal: 25.w),
                      decoration: BoxDecoration(
                        border: selectedIndex == index
                            ? Border.all(width: 1.w, color: Colors.blue)
                            : Border.all(width: 1.w, color: Colors.black12),
                        borderRadius: BorderRadius.circular(5),
                        color: selectedIndex.value == index
                            ? Colors.blue
                            : Colors.white,
                      ),
                      child: Center(
                        child: Text(
                          listofItems[index],
                          style: GoogleFonts.poppins(
                              fontSize: 14.sp,
                              color: selectedIndex.value == index
                                  ? Colors.white
                                  : Colors.blue),
                        ),
                      ),
                    ),
                  ),
                );
              }),
        )
      ],
    );
  }
}
