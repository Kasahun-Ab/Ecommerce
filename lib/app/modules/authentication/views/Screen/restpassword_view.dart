import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/Components/Auth_textfield.dart';
import 'package:pazimo/app/modules/authentication/validator/validator.dart';

import '../../../Components/header_title.dart';
import '../../../Components/headersubtitle.dart';
import '../../../Components/long_button.dart';
import '../../../Components/popup_dialog.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({Key? key});

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderTitle(title: "Reset Password"),
                    SizedBox(height: 10),
                    HeaderSubtitle(
                        title:
                            "Set the new password for your account so you can login and access all the features"),
                    SizedBox(height: 10),
                    AuthTextField(
                      formKey: _formKey,
                      label: "Password",
                      hint: "Enter your Password",
                      validator: (value) => validator[1](value),
                      controller: _passwordController,
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    SizedBox(height: 10),
                    AuthTextField(
                      formKey: _formKey,
                      label: "Confirm Password",
                      hint: "Enter your Confirm password",
                      validator: (value) => validator[1](value),
                      controller: _confirmPasswordController,
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 32.0),
                  child: Button(
                    title: "Continue",
                    color: Colors.blue,
                    onPressed: () {
                      Get.dialog(
                        popupDialogbox(
                          title: 'Password Changed!',
                          message:
                              'Your can now use your new \npassword to login to your account.',
                          onPressed: () {},
                          buttontitle: 'Login',
                        ),
                      );
                    },
                    hasBorder: false,
                    iconDirectionIsRight: true,
                    hasIcon: false,
                  ),
                ),
                SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
