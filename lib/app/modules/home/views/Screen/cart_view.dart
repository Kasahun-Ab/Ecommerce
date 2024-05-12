import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/icon_button.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

class CartView extends StatelessWidget {
  CartView({super.key});
  final HomeController controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    RxInt price = 12345.obs;
    RxInt vat = 1.obs;
    RxInt shippingFee = 12345.obs;
    RxInt total = 0.obs;
    for (var element in controller.carts) {
      total.value =
          element['price'] + vat.value + shippingFee.value + price.value;
    }

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          elevation: 40,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {},
          ),
          centerTitle: true,
          title: Text("My Cart"),
          actions: [
            SvgPicture.asset("assets/svg/Bell.svg"),
            SizedBox(width: 20),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              controller.carts.isNotEmpty
                  ? Expanded(
                      child: ListView.builder(
                          itemBuilder: (context, index) {
                            return Obx(
                              () => Container(
                                margin: EdgeInsets.only(top: 10, bottom: 10),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Color(0xFFE6E6E6)),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 83,
                                      width: 79,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Color(0xFFE6E6E6),
                                      ),
                                      child: Image.asset(
                                        "assets/images/tshirt.png",
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width.w -
                                              200.w,
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
                                                      Text("T-Shirt"),
                                                      Text("Size: 2XL"),
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
                                                      Text("ETB " +
                                                          controller
                                                              .carts[index]
                                                                  ["price"]
                                                              .toString()),
                                                    ]),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    //icons to minimize
                                                    Iconbutton(
                                                      onTap: () {
                                                        print(controller
                                                            .carts[index]
                                                                ["quantity"]
                                                            .toString());

                                                        controller.carts[index]
                                                                ["quantity"] =
                                                            controller.carts[
                                                                        index][
                                                                    "quantity"] -
                                                                1;

                                                        controller.carts[index]
                                                                ["price"] =
                                                            controller.priceCalculation(
                                                                controller.carts[
                                                                        index][
                                                                    "quantity"],
                                                                controller.carts[
                                                                        index][
                                                                    "single_price"]);
                                                      },
                                                      icon: Icons.remove,
                                                    ),
                                                    SizedBox(width: 5),

                                                    // price display text
                                                    Text(controller.carts[index]
                                                            ['quantity']
                                                        .toString()),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    //icons to minimize
                                                    Iconbutton(
                                                      onTap: () {
                                                        controller.carts[index]
                                                                ["quantity"] =
                                                            controller.carts[
                                                                        index][
                                                                    "quantity"] +
                                                                1;

                                                        controller.carts[index]
                                                                ["price"] =
                                                            controller.priceCalculation(
                                                                controller.carts[
                                                                        index][
                                                                    "quantity"],
                                                                controller.carts[
                                                                        index][
                                                                    "single_price"]);
                                                      },
                                                      icon: Icons.add,
                                                    )
                                                  ],
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
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
              Container(
                // height: 170,
                padding: EdgeInsets.symmetric(vertical: 20),
                width: double.infinity,
                child: Column(
                  children: [
                    cart_price_text(
                      Sub_total: 'Sub-total',
                      price: price,
                    ),
                    SizedBox(height: 10.h),
                    cart_price_text(
                      Sub_total: 'Vat(%)',
                      price: vat,
                    ),
                    SizedBox(height: 10.h),
                    cart_price_text(
                      Sub_total: 'Shipping fee',
                      price: shippingFee,
                    ),
                    SizedBox(height: 10.h),
                    Divider(
                      color: Color(0Xff808080),
                    ),
                    SizedBox(height: 10),
                    cart_price_text(
                      Sub_total: 'Total',
                      price: total,
                    ),
                    SizedBox(height: 20),
                    Button(
                        title: "Go to Checkout",
                        color: Colors.blue,
                        onPressed: () {},
                        hasBorder: false,
                        iconDirectionIsRight: true,
                        hasIcon: true)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class cart_price_text extends StatelessWidget {
  cart_price_text({
    super.key,
    required this.Sub_total,
    required this.price,
    this.color = Colors.white60,
  });
  final String Sub_total;
  final RxInt price;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            Sub_total,
            style: GoogleFonts.poppins(
                fontSize: 16,
                color: Color(0Xff808080),
                fontWeight: FontWeight.w500),
          ),
          Text(
            "ETB ${price}",
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
