import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/Components/Auth_textfield.dart';
import 'package:pazimo/app/modules/Components/Text_with_text_button.dart';
import 'package:pazimo/app/modules/Components/headersubtitle.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/authentication/validator/validator.dart';
import 'package:pazimo/app/modules/authentication/views/Screen/forgotpassword_view.dart';

import '../../../Components/header_title.dart';
import 'register.dart';

class LoginView extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
            Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextField(
                    formKey: GlobalKey<FormState>(),
                    label: 'Phone Number',
                    hint: 'Enter your phone number',
                    validator: (value) => validator[1](value),
                    controller: _phoneNumberController, obscureText: false, textInputType: TextInputType.phone,
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
                  ),
                  SizedBox(height: 10),
                  TextwithTextbutton(
                    text: "Forgot your password?",
                    textButton: "Reset your password",
                    onPressed: () {
                      Get.to(()=>ForgotpasswordView());
                    }, 
                  ),
                  SizedBox(height: 25),
                  Button(
                    title: 'Login',
                    color: Colors.blue,
                    onPressed: () {
                   if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(_passwordController.text+_phoneNumberController.text)),
                    );
                  }
                    },
                    hasBorder: false,
                    iconDirectionIsRight: true,
                    hasIcon: false, 
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
                    onPressed: () {},
                    hasBorder: true,
                    iconDirectionIsRight: false,
                    iconSource: 'assets/svg/google_icons.svg',
                    hasIcon: true, 
                  ),
                  SizedBox(height: 15),
                  Button(
                    title: 'Login with Facebook',
                    color: Colors.blue,
                    onPressed: () {},
                    hasBorder: false,
                    iconDirectionIsRight: false,
                    iconSource: 'assets/svg/facebook_icon.svg',
                    hasIcon: true, 
                  ),
                  SizedBox(height: 20),
                  TextwithTextbutton(
                    text: 'Don’t have an account?',
                    textButton: 'Join',
                    onPressed: () {
                      Get.to(()=>RegisterView());
                    },
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
