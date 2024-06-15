import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/cart_price_list_text.dart';
import 'package:pazimo/app/modules/Components/icon_button.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/checkout.dart';

class CartView extends StatelessWidget {
  CartView({super.key});

  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    controller.calculateSubTotal(controller.carts);
    controller.calculateTotal(controller.carts);
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        centerTitle: true,
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          SvgPicture.asset("assets/svg/Bell.svg"),
          SizedBox(width: 20),
        ],
      ),
      body: Obx(
        () => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.carts.length > 0
                  ? Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            RxDouble price = 0.0.obs;
                            price = controller.carts[index]['total_price'];
                            return Container(
                              margin: EdgeInsets.only(top: 5, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Color(0xFFE6E6E6)),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Row(
                                children: [
                                  Container(
                                    height: 83.h,
                                    width: 79.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFE6E6E6),
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: controller.carts[index]['image']
                                              is List
                                          ? controller.carts[index]['image'][0]
                                          : controller.carts[index]['image'],
                                      placeholder: (context, url) =>
                                          CircularProgressIndicator(
                                        color: Colors.blue,
                                      ),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                  SizedBox(width: 15.w),
                                  Flexible(
                                    child: Container(
                                      child: Column(
                                        children: [
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          "Name:${controller.carts[index]['name']}"),
                                                      Text(
                                                          "Size: ${controller.carts[index]["size"]}"),
                                                    ]),
                                                InkWell(
                                                  radius: 20.sp,
                                                  onTap: () {
                                                    controller.carts
                                                        .removeAt(index);
                                                  },
                                                  child: SvgPicture.asset(
                                                      "assets/svg/delete.svg"),
                                                ),
                                              ]),
                                          SizedBox(height: 10),
                                          Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Obx(
                                                        () => Text("ETB \$" +
                                                            "${price.value}"),
                                                      ),
                                                    ]),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Iconbutton(
                                                      onTap: () {
                                                        if (controller
                                                                .carts[index][
                                                                    'itemNumber']
                                                                .value >
                                                            1) {
                                                          controller.carts[
                                                                      index][
                                                                  'itemNumber'] =
                                                              controller.carts[
                                                                          index]
                                                                      [
                                                                      'itemNumber'] -
                                                                  1;

                                                          price.value =
                                                              calculateTotalPrice(
                                                                  index);
                                                          controller.carts[
                                                                      index][
                                                                  'total_price'] =
                                                              price;
                                                        }
                                                        print(controller
                                                                .carts[index]
                                                            ['total_price']);

                                                        controller
                                                            .calculateSubTotal(
                                                                controller
                                                                    .carts);
                                                        controller
                                                            .calculateTotal(
                                                                controller
                                                                    .carts);
                                                      },
                                                      icon: Icons.remove,
                                                    ),
                                                    SizedBox(width: 5),

                                                    Obx(
                                                      () => Text(controller
                                                          .carts[index]
                                                              ['itemNumber']
                                                          .toString()),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    //icons to add
                                                    Iconbutton(
                                                      onTap: () {
                                                        controller.carts[index]
                                                                ['itemNumber'] =
                                                            controller.carts[
                                                                        index][
                                                                    'itemNumber'] +
                                                                1;

                                                        price.value =
                                                            calculateTotalPrice(
                                                                index);

                                                        controller.carts[index][
                                                                'total_price'] =
                                                            price;
                                                        print(controller
                                                                .carts[index]
                                                            ['total_price']);

                                                        controller
                                                            .calculateSubTotal(
                                                                controller
                                                                    .carts);
                                                        controller
                                                            .calculateTotal(
                                                                controller
                                                                    .carts);
                                                      },
                                                      icon: Icons.add,
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: controller.carts.length),
                    )
                  : Center(
                      child: Column(children: [
                        SvgPicture.asset("assets/svg/cart_big.svg"),
                        Text(
                          "Your Cart Is Empty!",
                          style: GoogleFonts.poppins(
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.blue,
                          ),
                        ),
                        Text(
                          "When you add products, they’ll \nappear here.",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              letterSpacing: 1.2,
                              color: Color(0Xff808080)),
                        )
                      ]),
                    ),
              controller.carts.length > 0
                  ? Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      width: double.infinity,
                      child: Column(
                        children: [
                          cart_price_text(
                            Sub_total: 'Sub-total',
                            price: controller.sub_total,
                          ),
                          SizedBox(height: 10.h),
                          cart_price_text(
                            Sub_total: 'Vat(%)',
                            price: controller.vat,
                          ),
                          SizedBox(height: 10.h),
                          cart_price_text(
                            Sub_total: 'Shipping fee',
                            price: controller.shippingFee,
                          ),
                          SizedBox(height: 10.h),
                          Divider(
                            color: Color(0Xff808080),
                          ),
                          SizedBox(height: 10),
                          cart_price_text(
                            Sub_total: 'Total',
                            price: controller.total,
                          ),
                          SizedBox(height: 20),
                          Button(
                              title: "Go to Checkout",
                              color: Colors.blue,
                              onPressed: () {
                                Get.to(CheckoutView());
                              },
                              hasBorder: false,
                              iconDirectionIsRight: true,
                              hasIcon: true)
                        ],
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  double calculateTotalPrice(int index) {
    return controller.priceCalculation(controller.carts[index]['itemNumber'],
        controller.carts[index]['price']);
  }
}
