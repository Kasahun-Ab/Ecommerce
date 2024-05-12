import 'package:get/get.dart';
import "package:dio/dio.dart";
class AuthenticationController extends GetxController {

 RxBool isvalidated=false.obs;
 
   Dio dio = Dio();
  Login(){
     dio.post("", data:{} );
  }
  Register(){
 dio.post("", data:{} );
  }

  Forgotpassword(){
 dio.post("", data:{} );
  }
  ResetPassword(){
 dio.post("", data:{} );
  }



}
