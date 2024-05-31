import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/Components/headersubtitle.dart';

import 'package:pazimo/app/modules/components/header_title.dart';
import 'package:pazimo/app/modules/components/long_button.dart';
import 'package:pazimo/app/modules/authentication/views/Screen/restpassword_view.dart';
import 'package:pazimo/app/modules/authentication/validator/validator.dart';

import '../../../Components/Auth_textfield.dart';

class ForgotpasswordView extends StatelessWidget {
  ForgotpasswordView({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HeaderTitle(title: "Forgot password"),
                  SizedBox(height: 10),
                  HeaderSubtitle(
                      title:
                          "Enter your email for the verification process. We will send 4 digits code to your email."),
                  SizedBox(height: 10),
                  AuthTextField(
                    formKey: _formKey,
                    label: "Phone number",
                    hint: "Enter your phone number",
                    validator: (value) => validator[1](value),
                    controller: _phoneNumberController,
                    obscureText: false,
                    textInputType: TextInputType.phone, enabled: true,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 32.0),
                child: Button(
                  title: "Send Code",
                  color: Colors.blue,
                  onPressed: () {
                    Get.to(ResetPassword());
                  },
                  hasBorder: false,
                  iconDirectionIsRight: true,
                  hasIcon: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
