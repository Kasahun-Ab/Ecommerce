
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

import 'vender_catigories.dart';

class ImagePickerController extends GetxController {
  var selectedImagePath = ''.obs;
  final selectedImae = [].obs;
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      selectedImagePath.value = pickedFile.path;
      selectedImagePath.value = pickedFile.path;
      selectedImae.add(selectedImagePath.value);
    } else {
      selectedImagePath.value = '';
    }
  }
}

class ProductEdit extends StatelessWidget {
  final ImagePickerController controller = Get.put(ImagePickerController());
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController brandController = TextEditingController();
  final InputDecoration textFieldDecoration = InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xff808080)),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xff808080)),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Color(0xff808080)),
    ),
    labelStyle: TextStyle(color: Color(0xff808080)),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My products'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Handle back button action
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Category',
                style: GoogleFonts.poppins(
                    color: Color(0xff808080),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  Get.to(() => CategoryPage());
                },
                child: Container(
                    padding: EdgeInsets.symmetric(vertical: 7, horizontal: 16),
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Category",
                                style: GoogleFonts.poppins(
                                    color: const Color.fromARGB(
                                        211, 255, 255, 255))),
                            Text(
                              "Business Sector",
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.keyboard_arrow_right,
                          color: Color.fromARGB(211, 255, 255, 255),
                        )
                      ],
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff115DB1),
                    )),
              ),
              SizedBox(height: 16),
              Text(
                'Product photos',
                style: GoogleFonts.poppins(
                    color: Color(0xff808080),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Visibility(
                      visible: true,
                      child: Container(
                        height: 90,
                        child: controller.selectedImae.length != 0
                            ? ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: controller.selectedImae.length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.only(right: 15),
                                    height: 90,
                                    width: 90,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: FileImage(controller
                                                .selectedImae[index]))),
                                  );
                                },
                              )
                            : Container(),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12),
                    padding: EdgeInsets.all(6),
                    child: GestureDetector(
                      onTap: () => controller.pickImage(ImageSource.gallery),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        child: Container(
                          height: 75,
                          width: 70,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 8),
              Text(
                'Product First Picture - Is the picture that will be shown first, you can drag to reorder, supported formats are .jpg and .png (must not exceed 5MB)',
                style:
                    GoogleFonts.poppins(fontSize: 13, color: Color(0xff808080)),
              ),
              SizedBox(height: 16),
              Text(
                'Name',
                style: GoogleFonts.poppins(
                    color: Color(0xff808080),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: nameController,
                decoration: textFieldDecoration.copyWith(
                    hintText: 'Iphone 14 pro max',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff808080))),
              ),
              SizedBox(height: 16),
              Text(
                'Price',
                style: GoogleFonts.poppins(
                    color: Color(0xff808080),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: priceController,
                decoration: textFieldDecoration.copyWith(
                    hintText: 'ETB 80,000',
                    hintStyle: GoogleFonts.poppins(color: Color(0xff808080))),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Text(
                'Description',
                style: GoogleFonts.poppins(
                    color: Color(0xff808080),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: descriptionController,
                decoration: textFieldDecoration.copyWith(
                  hintStyle: GoogleFonts.poppins(color: Color(0xff808080)),
                  hintText: 'description on the product',
                ),
              ),
              SizedBox(height: 16),
              Text(
                "Brand",
                style: GoogleFonts.poppins(
                    color: Color(0xff808080),
                    fontSize: 17,
                    fontWeight: FontWeight.w600),
              ),
              TextField(
                controller: brandController,
                decoration: textFieldDecoration.copyWith(
                  hintStyle: GoogleFonts.poppins(color: Color(0xff808080)),
                  hintText: 'Brand of the product',
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Handle Material and care button action
                },
                child: Text('Material and care',
                    style: GoogleFonts.poppins(
                        color: Color.fromARGB(255, 255, 255, 255))),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(),
                  backgroundColor: Color(0xff115DB1),
                  minimumSize: Size(double.infinity, 48),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Handle update button action
                    },
                    child: Text(
                      'Update',
                      style: GoogleFonts.poppins(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Colors.yellow,
                      minimumSize: Size(150, 48),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Handle close button action
                    },
                    child: Text(
                      'Close',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      backgroundColor: Color(0xff115DB1),
                      minimumSize: Size(150, 48),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
