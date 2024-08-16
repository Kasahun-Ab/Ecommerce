import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/socialMediaButton.dart';
import 'package:pazimo/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:pazimo/app/modules/authentication/views/Screen/otp_view.dart';
import 'package:pazimo/theme/themedata.dart';
import '../../../Components/Auth_textfield.dart';
import '../../../Components/Text_with_text_button.dart';
import '../../../Components/header_title.dart';
import '../../../Components/headersubtitle.dart';
import '../../../Components/long_button.dart';
import '../../../home/views/Screen/conditions.dart';
import '../../validator/validator.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  final controller = Get.find<AuthenticationController>();
  RxBool isLoading = false.obs;

  final _formKey = GlobalKey<FormState>();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();

  // final GetStorage _getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.0.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30.h,
              ),
              HeaderTitle(
                title: 'Create an account',
              ),
              HeaderSubtitle(
                title: '',
              ),
              SizedBox(
                height: 15.h,
              ),
              Obx(
                () => Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      AuthTextField(
                        formKey: GlobalKey<FormState>(),
                        label: 'Full Name',
                        hint: 'Enter your full name',
                        validator: (value) => validator[0](value),
                        controller: _fullNameController,
                        textInputType: TextInputType.text,
                        obscureText: false,
                        enabled: !isLoading.value,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      AuthTextField(
                        formKey: GlobalKey<FormState>(),
                        label: 'Phone Number',
                        hint: 'Enter your phone number',
                        validator: (value) => validator[1](value),
                        controller: _phoneNumberController,
                        obscureText: false,
                        textInputType: TextInputType.text,
                        enabled: !isLoading.value,
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
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
                      SizedBox(
                        height: 10.h,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          text: 'By signing up you agree to our ',
                          style: GoogleFonts.poppins(
                              fontSize: 16.sp, color: primary_blue),
                          children: [
                            TextSpan(
                              text: 'Terms',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: primary_blue,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(() => ConditionsPage(
                                      fromregister: true,
                                    )),
                            ),
                            TextSpan(
                              text: ', ',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp, color: primary_blue),
                            ),
                            TextSpan(
                              text: 'Privacy Policy',
                              style: GoogleFonts.poppins(
                                color: primary_blue,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Get.to(
                                    () => ConditionsPage(fromregister: true)),
                            ),
                            TextSpan(
                              text: ', and ',
                              style: GoogleFonts.poppins(
                                  fontSize: 16.sp, color: primary_blue),
                            ),
                            TextSpan(
                              text: 'Cookie Use',
                              style: GoogleFonts.poppins(
                                fontSize: 16.sp,
                                color: primary_blue,
                              ),
                            ),
                            TextSpan(
                              text: '.',
                              style: GoogleFonts.poppins(color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Obx(
                        () => ElevatedButton(
                          onPressed: isLoading.isFalse
                              ? () async {
                                  if (_formKey.currentState!.validate()) {
                                    try {
                                      isLoading(true);
                                      final response =
                                          await controller.register(
                                              _fullNameController.value.text,
                                              _passwordController.value.text,
                                              _phoneNumberController
                                                  .value.text);

                                      if (response.statusCode == 201) {
                                        Get.to(OtpView());
                                      }
                                    } catch (e) {
                                    } finally {
                                      isLoading(false);
                                    }
                                  }
                                }
                              : () {},
                          child: isLoading.isFalse
                              ? Text('Create an Account ',
                                  style: GoogleFonts.poppins(
                                      color: Colors.white,
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600))
                              : CupertinoActivityIndicator(
                                  color: Colors.white,
                                ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: primary_blue,
                            padding: EdgeInsets.symmetric(
                                vertical: 10.h, horizontal: 10.w),
                            textStyle: GoogleFonts.poppins(fontSize: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.r),
                            ),
                            minimumSize: Size(double.infinity, 48.h),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2.6.w,
                            height: 1,
                            color: const Color.fromARGB(127, 158, 158, 158),
                          ),
                          Text(
                            "Or",
                            style: GoogleFonts.poppins(fontSize: 16.sp),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 2.6.w,
                            height: 1,
                            color: const Color.fromARGB(127, 158, 158, 158),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SigninSocialButton(
                            title: 'Sign Up',
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
                              title: 'Sign Up',
                              color: primary_back,
                              onPressed: () async {
                                controller.signInGoogle();
                              },
                              hasBorder: false,
                              iconDirectionIsRight: false,
                              iconSource: 'assets/svg/apple.svg',
                              hasIcon: true,
                              isapple: true),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextwithTextbutton(
                        text: 'Already have an account?',
                        textButton: 'Log In',
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
