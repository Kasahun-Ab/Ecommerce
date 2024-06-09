import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/authentication/controllers/authentication_controller.dart';
import 'package:pazimo/app/modules/authentication/views/Screen/otp_view.dart';

import '../../../Components/Auth_textfield.dart';
import '../../../Components/Text_with_text_button.dart';
import '../../../Components/header_title.dart';
import '../../../Components/headersubtitle.dart';
import '../../../Components/long_button.dart';
import '../../validator/validator.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {
  final controller = Get.find<AuthenticationController>();
  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  RxBool isLoading = false.obs;
  // final GetStorage _getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              HeaderTitle(
                title: 'Create an account',
              ),
              HeaderSubtitle(
                title: 'Let’s create your account.',
              ),
              const SizedBox(
                height: 15,
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
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 10,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
                        style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.blue,
                            fontWeight: FontWeight.w500),
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
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                            minimumSize: Size(double.infinity, 48),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      const SizedBox(
                        height: 10,
                      ),
                      Button(
                        title: 'Sign Up with Google',
                        color: Colors.blue,
                        onPressed: () async {
                          controller.signInGoogle();
                        },
                        hasBorder: true,
                        iconDirectionIsRight: false,
                        iconSource: 'assets/svg/google_icons.svg',
                        hasIcon: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Button(
                        title: 'Sign Up with Facebook',
                        color: Colors.blue,
                        onPressed: () {
                          controller.signInWithFacebook();
                        },
                        hasBorder: false,
                        iconDirectionIsRight: false,
                        iconSource: 'assets/svg/facebook_icon.svg',
                        hasIcon: true,
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
