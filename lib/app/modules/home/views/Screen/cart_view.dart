
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/data/Cart.dart';
import 'package:pazimo/app/modules/Components/cart_price_list_text.dart';
import 'package:pazimo/app/modules/Components/icon_button.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/checkout.dart';
import 'package:pazimo/theme/themedata.dart';

import '../../../../../api/Api_Methods/allmethodsapi.dart';

class CartView extends StatelessWidget {
  RxBool isloading = false.obs;
  Api _api = Api();
  final HomeController controller = Get.find<HomeController>();
  final items = <Item>[].obs;
  Cart? _cart;
  @override
  Widget build(BuildContext context) {
    getCart() async { 
      items.value = [];
      isloading.value = true;
     
      try {
        final response = await _api.getCart();
   
        if (response.statusCode == 200) {
        
          if (response.data != null) {
         
            _cart = await Cart.fromJson(response.data);
           
            items.value = _cart!.data!.items!;
     
            isloading.value = false;

          } else {
           
            _cart = null;
            items.value = [];
            isloading.value = false;
          }
        }
        isloading.value = false;
      } catch (e) {
       print(e);
        isloading.value = false;
      }
    }

    getCart();

  
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
       
        centerTitle: true,
        title: Text(
          "My Cart",
          style: GoogleFonts.poppins(color: primary_blue,fontSize: 24.sp,fontWeight: FontWeight.w500),
        ),
        actions: [
     
        ],
      ),
      body: Obx(
        () => isloading.isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(
                      () => items.length != 0
                          ? Expanded(
                              child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    RxDouble price = 0.0.obs;
                                    Rx<int?> quantity =
                                        items[index].quantity.obs;
                                     price = double.parse(items[index].product!.price!)
                                        .obs;

                                    return Container(
                                      margin:
                                          EdgeInsets.only(top: 5, bottom: 10),
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Color(0xFFE6E6E6)),
                                      ),
                                      padding: EdgeInsets.all(8),
                                      child: Row(
                                        children: [

                                          Container(
                                            height: 83.h,
                                            width: 79.w,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xFFE6E6E6),
                                            ),
                                            child: CachedNetworkImage(
                                              imageUrl: items[index]
                                                          .product!
                                                          .images!
                                                          .length ==
                                                      0
                                                  ? "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp"
                                                  : items[index]
                                                      .product!
                                                      .images![0]
                                                      .mediumImageUrl!,
                                              placeholder: (context, url) =>
                                                  CircularProgressIndicator(
                                                color: primary_blue,
                                              ),
                                              errorWidget:
                                                  (context, url, error) =>
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
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                              width:170,
                                                              
                                                                child: Text(
                                                                    "Name:${items[index].product!.name}",style: GoogleFonts.poppins(
                                                                    ),
                                                                    overflow: TextOverflow.fade,
                                                                    ),
                                                              ),
                                                              Text(
                                                                  "Size: ${100}"),
                                                            ]),
                                                        InkWell(
                                                          radius: 20.sp,
                                                          onTap: () async {
                                                            EasyLoading.show(
                                                                status:
                                                                    'loading...');
                                                            try {
                                                              final response = await _api
                                                                  .deleteFromCart(
                                                                      items[index]
                                                                          .id);
                                                              if (response!
                                                                      .statusCode ==
                                                                  200) {
                                                                if (response
                                                                        .data !=
                                                                    null) {
                                                                  _cart = await Cart
                                                                      .fromJson(
                                                                          response
                                                                              .data);
                                                                  items.value =
                                                                      _cart!
                                                                          .data!
                                                                          .items!;
                                                                  isloading
                                                                          .value =
                                                                      false;
                                                                  EasyLoading
                                                                      .dismiss();
                                                                } else {
                                                                  items.value =
                                                                      [];
                                                                  EasyLoading
                                                                      .dismiss();
                                                                }
                                                              }
                                                            } catch (e) {
                                                              items.value = [];
                                                              EasyLoading
                                                                  .dismiss();
                                                            }
                                                          },
                                                          child: SvgPicture.asset(
                                                              "assets/svg/delete.svg"),
                                                        ),
                                                      ]),
                                                  SizedBox(height: 10),
                                                  Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Obx(() => Text(
                                                                  "ETB \$ ${price}")),
                                                            ]),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .end,
                                                          children: [
                                                            Iconbutton(
                                                              onTap: () async {
                                                                if (quantity
                                                                        .value ==1)
                                                                        { } 
                                                                else {
                                                                  quantity.value =
                                                                      (quantity.value! -
                                                                          1);
                                                                    final response =
                                                                      await _api
                                                                          .updateCart(
                                                                            {
                                                                              "qty": {
                                                                          "${items[index].id}":
                                                                          quantity.value
                                                                    }
                                                                    
                                                                             }
                                                                          );

                                                                }
                                                              },
                                                              icon:
                                                                  Icons.remove,
                                                            ),
                                                            SizedBox(width: 5),

                                                            Obx(
                                                              () => Text(
                                                                  '${quantity}'),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            //icons to add
                                                            Iconbutton(
                                                              onTap: () async{
                                                                     quantity.value =
                                                                      quantity.value! +
                                                                          1;
                                                                    final response =
                                                                      await _api
                                                                          .updateCart({
                                                                    "qty": {
                                                                      "${items[index].id}":
                                                                          " ${quantity.value}"
                                                                    }
                                                                  });

                                                                  
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
                                         RSizedBox(width: 10,)
                                        ],
                                      ),
                                    );
                                  },
                                  itemCount: items.length),
                            )
                          : Center(
                              child: Column(children: [
                                SvgPicture.asset("assets/svg/cart_big.svg"),
                                Text(
                                  "Your Cart Is Empty!",
                                  style: GoogleFonts.poppins(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xff115DB1),
                                  ),
                                ),
                                Text(
                                  "When you add products, they’ll \nappear here.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: 16.sp,
                                      letterSpacing: 1.2,
                                      color: Color(0Xff808080)),
                                )
                              ]),
                            ),
                    ),
                    items.length > 0
                        ? Container(
                            padding: EdgeInsets.symmetric(vertical: 20),
                            width: double.infinity,
                            child: Column(
                              children: [


                                Divider(
                                  color: Color(0Xff808080),
                                ),
                                SizedBox(height: 10),
                                cart_price_text(
                                  Sub_total: 'Total',
                                  price: _cart!.data!.subTotal!.obs,
                                ),
                                SizedBox(height: 20),
                                Button(
                                    title: "Go to Checkout",
                                    color: Color(0xff115DB1),
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
}
