import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/data/Customer.dart';
import 'package:pazimo/app/modules/Components/Auth_textfield.dart';
import 'package:pazimo/app/modules/Components/Text_with_text_button.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:pazimo/app/modules/authentication/validator/validator.dart';
import 'package:pazimo/app/modules/authentication/views/Screen/forgotpassword_view.dart';
import 'package:pazimo/app/routes/app_pages.dart';
import '../../../../../theme/themedata.dart';
import '../../../Affiliate/views/affiliate_view.dart';
import '../../../Components/header_title.dart';
import '../../../Components/socialMediaButton.dart';
import '../../../vendor/views/vendor_view.dart';
import 'register.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final controller = Get.find<AuthenticationController>();
  RxBool isLoading = false.obs;

  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    final GetStorage _getStorage = GetStorage();
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30.h),
            HeaderTitle(title: 'Login'),
            SizedBox(height: 15.h),
            Obx(
              () => Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      formKey: GlobalKey<FormState>(),
                      label: 'Phone number or Email ',
                      hint: 'phone or Email',
                      validator: (value) => validator[1](value),
                      controller: _phoneNumberController,
                      obscureText: false,
                      textInputType: TextInputType.phone,
                      enabled: !isLoading.value,
                    ),
                    SizedBox(height: 10.h),
                    AuthTextField(
                      formKey: GlobalKey<FormState>(),
                      label: 'Password',
                      hint: 'password',
                      validator: (value) => validator[2](value),
                      controller: _passwordController,
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      enabled: !isLoading.value,
                    ),
                    SizedBox(height: 10.h),
                    TextwithTextbutton(
                      text: "",
                      textButton: "Forgot your password",
                      onPressed: () {
                        Get.to(() => ForgotpasswordView());
                      },
                    ),
                    SizedBox(height: 25.h),
                    Obx(
                      () => ElevatedButton(
                        onPressed: isLoading.isFalse
                            ? () async {
                                if (_formKey.currentState!.validate()) {
                                  try {
                                    isLoading(true);

                                    final response = await controller.login(
                                        _passwordController.value.text,
                                        _phoneNumberController.value.text);

                                    print(response.statusCode);
                                    if (response.statusCode == 200) {
                                      Customerdata customer =
                                          Customerdata.fromJson(response.data);

                                      String _customerData =
                                          CustomerdataToJson(customer);
                                      await _getStorage.write(
                                          'loginResponse', _customerData);

                                      final storedData = await _getStorage
                                          .read('loginResponse');

                                      if (storedData != null &&
                                          json.encode(storedData) ==
                                              json.encode(_customerData)) {
                                        Get.offNamed(
                                          Routes.HOME,
                                        );
                                      } else {}
                                    }
                                  } catch (e) {
                                  } finally {
                                    isLoading(false);
                                  }
                                }
                              }
                            : null,
                        child: isLoading.isFalse
                            ? Text('Login',
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))
                            : CupertinoActivityIndicator(
                                color: Colors.white,
                              ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary_blue,
                          disabledBackgroundColor: Colors.blueGrey,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          textStyle: GoogleFonts.poppins(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          minimumSize: Size(double.infinity, 48),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6,
                          height: 1,
                          color: const Color.fromARGB(127, 158, 158, 158),
                        ),
                        Text(
                          "Or",
                          style: GoogleFonts.poppins(fontSize: 16),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6,
                          height: 1,
                          color: const Color.fromARGB(127, 158, 158, 158),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SigninSocialButton(
                          title: 'Sign In',
                          color: primary_blue,
                          onPressed: () async {
                            controller.signInGoogle();
                          },
                          hasBorder: true,
                          iconDirectionIsRight: false,
                          iconSource: 'assets/svg/google_icons.svg',
                          hasIcon: true,
                          isapple: false,
                        ),
                        SigninSocialButton(
                          title: 'Sign In',
                          color: primary_back,
                          onPressed: () async {
                            controller.signinApple();
                          },
                          hasBorder: false,
                          iconDirectionIsRight: false,
                          iconSource: 'assets/svg/apple.svg',
                          hasIcon: true,
                          isapple: true,
                        ),
                      ],
                    ),
                    // SizedBox(height: 15),
                    // GestureDetector(
                    //   child: Text("Login to Vender",
                    //       style: GoogleFonts.poppins(
                    //           color: Colors.blue, fontSize: 18)),
                    //   onTap: () {
                    //     Get.to(() => VendorView());
                    //   },
                    // ),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    // GestureDetector(
                    //   child: Text("Login to Affilate",
                    //       style: GoogleFonts.poppins(
                    //           color: Colors.blue, fontSize: 18)),
                    //   onTap: () {
                    //     Get.to(() => AffiliateView());
                    //   },
                    // ),
                    // SizedBox(height: 20),
                    // GestureDetector(
                    //   child: Text("Login to Event organizer",
                    //       style: GoogleFonts.poppins(
                    //           color: primary_blue, fontSize: 18)),
                    //   onTap: () {
                    //     Get.offNamed(
                    //       Routes.EVENT_ORGANIZER,
                    //     );
                    //   },
                    // ),
                    // GestureDetector(
                    //   child: Text("Login to Delivery",
                    //       style: GoogleFonts.poppins(
                    //           color: Colors.blue, fontSize: 18)),
                    //   onTap: () {
                    //     Get.offNamed(Routes.DELIVERY);
                    //   },
                    // ),
                    SizedBox(height: 20),
                    TextwithTextbutton(
                      text: 'Don’t have an account?',
                      textButton: 'Join',
                      onPressed: () {
                        Get.to(() => RegisterView());
                      },
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
