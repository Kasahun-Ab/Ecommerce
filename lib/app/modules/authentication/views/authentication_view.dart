
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/authentication/views/Screen/login.dart';
import '../controllers/authentication_controller.dart';
// import 'Screen/login.dart';

class AuthenticationView extends GetView<AuthenticationController> {
   AuthenticationView({super.key});

   @override
     final controller=Get.put(AuthenticationController());
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: LoginView(),
    );
  }
}
