import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

class deliverAdressList extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  deliverAdressList({
    super.key,
    required this.title,
    required this.address,
    required this.ontap,
  });

  final String title;
  final String address;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset('assets/svg/Location.svg'),
                SizedBox(width: 10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          color: Color(0xff115DB1),
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      address,
                      style: GoogleFonts.poppins(
                          color: Color(0Xff808080), fontSize: 14),
                    ),
                  ],
                )
              ],
            ),
          ),
          Obx(
            () => Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  border: Border.all(width: 2),
                  shape: BoxShape.circle,
                  color: Colors.white),
              child: Center(
                child: controller.isHome.value
                    ? Container(
                        height: 12,
                        width: 12,
                        decoration: BoxDecoration(
                            // border: Border.all(width: 2),
                            shape: BoxShape.circle,
                            color: const Color.fromARGB(255, 0, 0, 0)),
                      )
                    : Container(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
