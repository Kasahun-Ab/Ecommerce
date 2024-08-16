import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/api/Api_Methods/allmethodsapi.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/app/modules/home/views/Screen/conditions.dart';
import 'package:pazimo/theme/themedata.dart';
import '../../../../data/whishlist.dart';
import '../../../Components/logoutDialog.dart';
import 'address.dart';
import 'help_view.dart';
import 'mydetails.dart';
import 'myorders.dart';
import 'mytickets.dart';
import 'notficationSetings.dart';

class AccountScreen extends StatelessWidget {
  final HomeController controller = Get.find<HomeController>();
  var _wishlist = Wishlist(data: []).obs;
  RxBool _isloading = false.obs;
  Api _api = Api();

  getWishlist() async {
    _isloading.value = true;
    final response = await _api.getWishlist();
    if (response?.statusCode == 200) {
      var data = response!.data;
      _isloading.value = false;
      controller.wishlist.value = Wishlist.fromJson(data);
      _wishlist.value = Wishlist.fromJson(data);
    }
  }

  getWish() async {
    final response = await _api.getWishlist();
    if (response?.statusCode == 200) {
      var data = response!.data;
      controller.wishlist.value = Wishlist.fromJson(data);
      _wishlist.value = Wishlist.fromJson(data);
      EasyLoading.dismiss();
    }
  }

  RxBool _isWishlistt = true.obs;
  RxDouble _width = 0.0.obs;
  void increaseWidth(int x) {
    if (x == 1) {
      _isWishlistt.value = true;
    }
    if (x == 2) {
      _isWishlistt.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    getWishlist();
    return Obx(
      () => Scaffold(
        backgroundColor: primary_white,
        appBar: AppBar(
          backgroundColor: primary_white,
          centerTitle: true,
          title: Row(
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.befunky.com%2Flearn%2Flinkedin-profile-picture%2F&psig=AOvVaw0tGLIV3SF9PO84Ea-Vr7S4&ust=1721240610472000&source=images&cd=vfe&opi=89978449&ved=0CBEQjRxqFwoTCJjes6GXrIcDFQAAAAAdAAAAABAE"),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                '${controller.userData!.data.name}',
                style: GoogleFonts.poppins(
                    color: primary_blue,
                    fontSize: 24,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.arrow_back,
              color: primary_blue,
            ),
          ),
          actions: [
            // ignore: deprecated_member_use
            SvgPicture.asset(color: Colors.black, "assets/svg/scanner.svg"),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: ListView(
          children: [
            ListTile(
              leading: SvgPicture.asset("assets/svg/orders.svg"),
              title: Text('My Orders'),
              onTap: () {
                controller.selectedIndex.value = 7;
                Get.to(() => MyOrdersPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/tickets.svg"),
              title: Text('My Tickets'),
              onTap: () {
                // controller.selectedIndex.value = 8;
                Get.to(() => MyTicketsPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/details.svg"),
              title: Text('My Details'),
              onTap: () {
                // controller.selectedIndex.value = 9;
                Get.to(() => MyDetailsPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/adress.svg"),
              title: Text('Delivery Addresses'),
              onTap: () {
                // controller.selectedIndex.value = 10;
                Get.to(() => AddressPage());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/Bell.svg"),
              title: Text('Notifications'),
              onTap: () {
                // controller.selectedIndex.value = 11;
                Get.to(() => NotificationsSeting());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            ListTile(
              leading: SvgPicture.asset("assets/svg/Bell.svg"),
              title: Text('Help Center'),
              onTap: () {
                // controller.selectedIndex.value = 12;
                Get.to(() => HelpCenter());
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            Divider(),

            // ListTile(
            //   title: Text('Become an affiliate'),
            //   onTap: () {
            //     Get.to(() => ConditionsPage(
            //           title: 'affiliate',
            //         ));
            //   },
            //   trailing: Icon(
            //     Icons.navigate_next,
            //     color: Color(0Xffb3b3b3),
            //   ),
            // ),
            ListTile(
              leading: SvgPicture.asset(
                  // ignore: deprecated_member_use
                  color: Colors.red,
                  width: 20,
                  'assets/svg/logout-svgrepo-com.svg'),
              title: Text(
                'Logout',
                style: GoogleFonts.poppins(color: Colors.red),
              ),
              onTap: () {
                Get.dialog((LogoutDialogbox(
                  title: 'Logout?',
                  message: 'Are you sure you want to logout?',
                  onPressed: () {
                    Api().logout(controller);
                  },
                  buttontitle: 'Logout',
                  cancele: () {
                    Get.back();
                  },
                  cancletext: 'No Cancel',
                )));
                controller.close();
              },
              trailing: Icon(
                Icons.navigate_next,
                color: Color(0Xffb3b3b3),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16, right: 16),
              height: 400,
              width: double.infinity,
              child: Column(
                children: [
                  Row(
                    children: [
                      InkWell(
                        onTap: () {
                          increaseWidth(1);
                        },
                        child: Column(
                          children: [
                            Text(
                              "Whishlist",
                              style: GoogleFonts.poppins(
                                  color: _isWishlistt.isTrue
                                      ? primary_back
                                      : Color(0xff4D4D4D)),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              width: _isWishlistt.isTrue ? 65 : 0,
                              height: 4,
                              duration: Duration(milliseconds: 200),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 40,
                      ),
                      InkWell(
                        onTap: () {
                          increaseWidth(2);
                        },
                        child: Column(
                          children: [
                            Text("Free delivery"),
                            SizedBox(
                              height: 5,
                            ),
                            AnimatedContainer(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              width: _isWishlistt.isFalse ? 65 : 0,
                              height: 4,
                              duration: Duration(milliseconds: 200),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  _isWishlistt.isTrue
                      ? AnimatedContainer(
                          width: _isWishlistt.isTrue
                              ? MediaQuery.of(context).size.width
                              : 0,
                          height: 150,
                          duration: Duration(milliseconds: 200),
                          child: _wishlist.value.data.length == 0
                              ? Center(
                                  child: Text("No Items"),
                                )
                              : ListView.builder(
                                  itemCount: _wishlist.value.data.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Padding(
                                      padding:
                                          const EdgeInsets.only(left: 16.0),
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Stack(
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    height: 100.h,
                                                    width: 120.w,
                                                    imageUrl: _wishlist
                                                                .value
                                                                .data[index]
                                                                .product
                                                                .images
                                                                .length !=
                                                            0
                                                        ? _wishlist
                                                            .value
                                                            .data[index]
                                                            .product
                                                            .images[0]
                                                            .mediumimageUrl
                                                        : "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp",
                                                    placeholder:
                                                        (context, url) =>
                                                            Center(
                                                      child:
                                                          CircularProgressIndicator(
                                                        color: primary_blue,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  top: 8,
                                                  right: 8,
                                                  child: InkWell(
                                                    onTap: () async {
                                                      EasyLoading.show(
                                                          status: 'loading...');

                                                      await _api.addToWishlist(
                                                          _wishlist
                                                              .value
                                                              .data[index]
                                                              .product
                                                              .id);
                                                      await getWish();
                                                    },
                                                    child: Container(
                                                      width: 30,
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: primary_white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Center(
                                                        child: SvgPicture.asset(
                                                            "assets/svg/liked.svg"),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Text(
                                              '${_wishlist.value.data[index].product.name}',
                                              overflow: TextOverflow.clip,
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Color(0xff808080)),
                                            ),
                                            Text(
                                              'ETB ${_wishlist.value.data[index].product.price}',
                                              overflow: TextOverflow.clip,
                                              maxLines: 1,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w700,
                                                  color: Color.fromARGB(
                                                      255, 31, 30, 30)),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                        )
                      : Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: BoxDecoration(
                              color: Color(0xffE6E6E6),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Image.asset("assets/images/Frame 48011.png"),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: LinearProgressIndicator(
                                  value: 0.7, // 70% progress
                                  minHeight: 10, // Adjust the height as needed
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.blue),
                                ),
                              ),
                            ],
                          ),
                        ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              66, 221, 219, 219), // Background color
                          // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.sp), // Rounded corners
                            // You can adjust the border radius as needed
                          ),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 4.w,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ConditionsPage(
                                    title: 'vender',
                                  ));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 9.h),
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      "Become \na vendor",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black, // Text color
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Image.asset(
                                    "assets/images/shop 1.png",
                                    width: 25,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              66, 221, 219, 219), // Background color
                          // Text color
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(10.sp), // Rounded corners
                            // You can adjust the border radius as needed
                          ),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3.7.w,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(() => ConditionsPage(
                                    title: 'affiliate',
                                  ));
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 9.h),
                              child: Row(
                                children: [
                                  Center(
                                    child: Text(
                                      "Become \nan affiliate",
                                      style: GoogleFonts.poppins(
                                        color: Colors.black, // Text color
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Image.asset(
                                    "assets/images/brokerage 1.png",
                                    width: 25,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
