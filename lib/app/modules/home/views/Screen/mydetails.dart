// ignore_for_file: must_be_immutable

import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../data/Customer.dart' as user;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pazimo/app/data/profile.dart';
import 'package:pazimo/app/modules/Components/gridProductCard.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

import '../../../../../api/Api_Methods/allmethodsapi.dart';
import '../../../../data/Customer.dart';

class UserController extends GetxController {
  HomeController controller = Get.find<HomeController>();

  var imageFile = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();
  var fullName = ''.obs;
  var email = ''.obs;
  var dateOfBirth = DateTime.now().obs;
  var gender = 'Male'.obs;
  var phoneNumber = ''.obs;

  void Intialization() {
    fullName.value = controller.userData!.data.name;
    email.value = controller.userData!.data.email;
    dateOfBirth.value = controller.userData!.data.dateOfBirth == null
        ? DateTime.now()
        : DateFormat('d/M/y').parse("1/3/2010");
    gender.value = controller.userData!.data.gender == null
        ? 'Gender'
        : controller.userData!.data.gender;
    phoneNumber.value = controller.userData!.data.phone.substring(1);
  }

  void updateFullName(String name) {
    fullName.value = name;
  }

  void updateEmail(String email) {
    this.email.value = email;
  }

  void updateDateOfBirth(DateTime date) {
    dateOfBirth.value = date;
  }

  void updateGender(String gender) {
    this.gender.value = gender;
  }

  void updatePhoneNumber(String phoneNumber) {
    this.phoneNumber.value = phoneNumber;
  }

  Future<void> pickImageFromGallery() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }

  Future<void> captureImageWithCamera() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    }
  }
}

class MyDetailsPage extends StatelessWidget {
  final UserController userController = Get.put(UserController());
  Api _api = Api();
  GetStorage _getStorage = GetStorage();
  @override
  Widget build(BuildContext context) {
    updateProfile() async {
      List<String> names = userController.fullName.value.split(' ');
      final Map<String, dynamic> userData = {
        "first_name": names[0],
        "last_name": names[1],
        "gender": userController.gender.value.toString(),
        "date_of_birth": DateFormat('yyyy/MM/dd')
            .format(userController.dateOfBirth.value)
            .toString(),
        "phone": "0${userController.phoneNumber.value.toString()}",
        "email": userController.email.value.toString(),
      };

      final response = await _api.changeProfile(userData);

      if (response!.statusCode == 200) {
        user.Data data = await user.Data.fromJson(response.data['data']);

        Customerdata customer = Customerdata(
            data: data, message: '', token: controller.userData!.token);
        ;

        String _customerData = CustomerdataToJson(customer);

        await _getStorage.write('loginResponse', _customerData);

        final storedData = await _getStorage.read('loginResponse');
        print(storedData);
        if (storedData != null &&
            json.encode(storedData) == json.encode(_customerData)) {
          controller.userData = await controller.getLoginResponse();
          userController.Intialization();
          EasyLoading.dismiss();
        } else {}
      }
    }

    userController.Intialization();
    return Scaffold(
      appBar: AppBar(
        title: Text('My Details'),
        actions: [
          TextButton(
            onPressed: () {
              // Handle logout action
            },
            child: Text(
              'Logout',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Obx(
                    () => Stack(
                      children: [
                        getImage(userController.imageFile.value != null),
                        Positioned(
                            bottom: 0,
                            right: 0,
                            child: InkWell(
                              onTap: () {
                                userController.pickImageFromGallery();
                              },
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor: Colors.grey,
                                child: Icon(size: 14, Icons.add),
                              ),
                            ))
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Full name",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff115DB1)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  inputField(
                    TextInputType.text,
                    "Full Name",
                    userController.fullName.value,
                    (value) => userController.updateFullName(value),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Email",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff115DB1)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  inputField(
                    TextInputType.emailAddress,
                    "Email Address",
                    userController.email.value,
                    (value) => userController.updateEmail(value),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Birth Date",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff115DB1)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Obx(() => TextField(
                        controller: TextEditingController(
                          text: DateFormat('MM/dd/yyyy')
                              .format(userController.dateOfBirth.value),
                        ),
                        decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        onTap: () async {
                          DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: userController.dateOfBirth.value,
                            firstDate: DateTime(1900),
                            lastDate: DateTime.now(),
                          );
                          if (pickedDate != null &&
                              pickedDate != userController.dateOfBirth.value) {
                            userController.updateDateOfBirth(pickedDate);
                          }
                        },
                      )),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Gender",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff115DB1)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Obx(() => Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(width: 1, color: Colors.black)),
                        padding:
                            EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                        width: double.infinity,
                        child: DropdownButton<String>(
                          underline: SizedBox.shrink(),
                          isExpanded: true,
                          value: userController.gender.value,
                          onChanged: (va) {
                            userController.updateGender(va!);
                          },
                          items: <String>['Gender', 'Male', 'Female', 'Other']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      )),
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Phone",
                    style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff115DB1)),
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Obx(() => IntlPhoneField(
                        readOnly: true,
                        style: GoogleFonts.poppins(color: Color(0xff115DB1)),
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 4,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors
                                    .blue), // Border color when not focused
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color:
                                    Color(0xff115DB1)), // Border color when enabled
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Color(0xff115DB1),
                                width: 2), // Border color when focused
                          ),
                        ),
                        initialCountryCode: 'ET',
                        initialValue: userController.phoneNumber.value,
                        onChanged: (phone) {
                          userController
                              .updatePhoneNumber(phone.completeNumber);
                        },
                      )),
                ],
              ),
              SizedBox(height: 32),
              Container(
                width: double
                    .infinity, // Makes the button take full width of its parent
                child: ElevatedButton(
                  onPressed: () {
                    EasyLoading.show(status: 'loading...');
                    updateProfile();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff115DB1), // Background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(3), // Border radius
                    ),
                  ),
                  child: Text(
                    'Submit',
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget inputField(TextInputType type, String hint, String value,
      Function(String) onChanged) {
    return TextField(
      style: GoogleFonts.poppins(
        color: Color(0xff115DB1),
      ),
      keyboardType: type,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          border: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xff115DB1)), // Border color when not focused
          ),
          enabledBorder: OutlineInputBorder(
            borderSide:
                BorderSide(color: Color(0xff115DB1)), // Border color when enabled
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color(0xff115DB1), width: 2), // Border color when focused
          ),
          hintText: hint),
      controller: TextEditingController(text: value),
      onChanged: onChanged,
    );
  }

  Widget getImage(bool hasUserImage) {
    if (hasUserImage) {
      return CircleAvatar(
          radius: 40,
          backgroundImage: FileImage(userController.imageFile.value!));
    } else {
      return ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: FadeInImage(
          height: 80,
          width: 80,
          placeholder: const AssetImage('assets/placeholder.png'),
          image: NetworkImage(
            "https://staging.mytestserver.space/public/themes/shop/default/build/assets/medium-product-placeholder-3b1a7b7d.webp",
          ),
          fadeInDuration: const Duration(milliseconds: 300),
          // errorWidget: (context, error) => const Icon(Icons.error),
        ),
      );
    }
  }
}
