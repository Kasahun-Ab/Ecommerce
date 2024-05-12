import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Components/Auth_textfield.dart';
import '../../../Components/Text_with_text_button.dart';
import '../../../Components/header_title.dart';
import '../../../Components/headersubtitle.dart';
import '../../../Components/long_button.dart';
import '../../validator/validator.dart';
import 'otp_view.dart';

// ignore: must_be_immutable
class RegisterView extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10,),
              HeaderTitle(title: 'Create an account',),
              HeaderSubtitle(title: 'Let’s create your account.',),
      
              const SizedBox(height: 15,),
              Form(
                child: Column(
                  children: [
                    AuthTextField(
                      formKey: _formKey,
                      label: 'Full Name',
                      hint: 'Enter your full name',
                      validator: (value) => validator[0](value),
                      controller: _fullNameController, 
                      textInputType: TextInputType.text, 
                      obscureText: false,
                    ),
                    const SizedBox(height: 10,),
                    AuthTextField(
                      formKey: _formKey,
                      label: 'Phone Number',
                      hint: 'Enter your phone number',
                      validator: (value) => validator[1](value),
                      controller: _phoneNumberController, 
                      obscureText: false, 
                      textInputType: TextInputType.phone,
                    ),
                    const SizedBox(height: 10,),
                    AuthTextField(
                      formKey: _formKey,
                      label: 'Password',
                      hint: 'Enter your password',
                      validator: (value) => validator[2](value),
                      controller: _passwordController,
                      obscureText: true,
                      textInputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      "By signing up you agree to our Terms, Privacy Policy, and Cookie Use",
                      style: GoogleFonts.poppins(fontSize: 16, color: Colors.blue, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 10,),
                    Button(
                      title: 'Create an Account',
                      color: Colors.blue,
                      onPressed: () {
                        if(_formKey.currentState!.validate()){
                             Get.to(OtpView());
                        }
                      },
                      hasBorder: false,
                      iconDirectionIsRight: true,
                      hasIcon: false,  
                    ),
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 10,),
                    Button(
                      title: 'Sign Up with Google',
                      color: Colors.blue,
                      onPressed: () {},
                      hasBorder: true,
                      iconDirectionIsRight: false,
                      iconSource: 'assets/svg/google_icons.svg',
                      hasIcon: true,
                    ),
                    const SizedBox(height: 15,),
                    Button(
                      title: 'Sign Up with Facebook',
                      color: Colors.blue,
                      onPressed: () {},
                      hasBorder: false,
                      iconDirectionIsRight: false,
                      iconSource: 'assets/svg/facebook_icon.svg',
                      hasIcon: true, 
                    ),
                    const SizedBox(height: 10,),
                    TextwithTextbutton(
                      text: 'Already have an account?',
                      textButton: 'Log In',
                      onPressed: () {
                        Get.back();
                      },
                    ),
                    const SizedBox(height: 30,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
