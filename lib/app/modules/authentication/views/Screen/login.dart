import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/data/Customer.dart';
import 'package:pazimo/app/modules/Components/Auth_textfield.dart';
import 'package:pazimo/app/modules/Components/Text_with_text_button.dart';
import 'package:pazimo/app/modules/Components/headersubtitle.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:pazimo/app/modules/authentication/validator/validator.dart';
import 'package:pazimo/app/modules/authentication/views/Screen/forgotpassword_view.dart';
import 'package:pazimo/app/modules/home/views/Screen/affiliate.dart';
import 'package:pazimo/app/routes/app_pages.dart';
import '../../../../../theme/themedata.dart';
import '../../../Affiliate/views/affiliate_view.dart';
import '../../../Components/header_title.dart';
import '../../../vendor/views/vendor_view.dart';
import 'register.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final controller = Get.find<AuthenticationController>();
  RxBool isLoading = false.obs;
  final GetStorage _getStorage = GetStorage();
  final dio = Dio();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            HeaderTitle(title: 'Login to your account'),
            HeaderSubtitle(title: 'It’s great to see you again.'),
            SizedBox(height: 15),
            Obx(
              () => Form(
                key: _formKey,
                child: Column(
                  children: [
                    AuthTextField(
                      formKey: GlobalKey<FormState>(),
                      label: 'Phone Number',
                      hint: 'Enter your phone number',
                      validator: (value) => validator[1](value),
                      controller: _phoneNumberController,
                      obscureText: false,
                      textInputType: TextInputType.phone,
                      enabled: !isLoading.value,
                    ),
                    SizedBox(height: 10),
                    AuthTextField(
                      formKey: GlobalKey<FormState>(),
                      label: 'Password',
                      hint: 'Enter your password',
                      validator: (value) => validator[2](value),
                      controller: _passwordController,
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                      enabled: !isLoading.value,
                    ),
                    SizedBox(height: 10),
                    TextwithTextbutton(
                      text: "Forgot your password?",
                      textButton: "Reset your password",
                      onPressed: () {
                        Get.to(() => ForgotpasswordView());
                      },
                    ),
                    SizedBox(height: 25),
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

                                    if (response.statusCode == 200) {
                                      Customerdata customer =
                                          Customerdata.fromJson(response.data);

                                      String _customerData =
                                          CustomerdataToJson(customer);

                                      await _getStorage.write(
                                          'loginResponse', _customerData);

                                      final storedData = await _getStorage
                                          .read('loginResponse');
                                      print(storedData);
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
                            : () => {},
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
                          backgroundColor: Colors.blue,
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          textStyle: GoogleFonts.poppins(fontSize: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          minimumSize: Size(double.infinity, 48),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
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
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width / 2.6,
                          height: 1,
                          color: const Color.fromARGB(127, 158, 158, 158),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Button(
                      title: 'Login with Google',
                      color: Colors.blue,
                      onPressed: () async {
                        controller.signInGoogle();
                      },
                      hasBorder: true,
                      iconDirectionIsRight: false,
                      iconSource: 'assets/svg/google_icons.svg',
                      hasIcon: true,
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      child: Text("Login to Vender",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontSize: 18)),
                      onTap: () {
                        Get.to(() => VendorView());
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      child: Text("Login to Affilate",
                          style: GoogleFonts.poppins(
                              color: Colors.blue, fontSize: 18)),
                      onTap: () {
                        Get.to(() => AffiliateView());
                      },
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      child: Text("Login to Home",
                          style: GoogleFonts.poppins(
                              color: primary_blue, fontSize: 18)),
                      onTap: () {
                        Get.offNamed(
                          Routes.HOME,
                        );
                      },
                    ),
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
