import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/theme/themedata.dart';

// ignore: must_be_immutable
class AuthTextField extends StatefulWidget {
  AuthTextField(
      {Key? key,
      required GlobalKey<FormState> formKey,
      required this.label,
      required this.hint,
      required this.validator,
      required this.controller,
      required this.obscureText,
      required this.textInputType,
      required this.enabled})
      : super(key: key);

  final String label;
  final String hint;
  final String? Function(String?) validator;
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  bool enabled;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  late RxBool _isValid;
  late RxBool _first;
  RxBool showpassword = false.obs;
  void initState() {
    if (widget.obscureText) {
      showpassword.value = widget.obscureText;
    }
    super.initState();
    _isValid = true.obs;
    _first = true.obs;
    widget.controller.addListener(() {
      _isValid.value = widget.validator(widget.controller.text) == null;
      if (_first.value) {
        _first.value = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: GoogleFonts.poppins(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: primary_back,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(
          () => Column(
            children: [
              TextFormField(
                enabled: widget.enabled,
                keyboardType: widget.textInputType,
                obscureText: widget.obscureText == true
                    ? showpassword.value
                    : widget.obscureText,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(59, 85, 85, 85)),
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  errorStyle: GoogleFonts.poppins(fontSize: 16.sp),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 253, 19, 2)),
                    borderRadius: BorderRadius.circular(30.sp),
                  ),
                  hintText: widget.hint,
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.0.w, vertical: 10.0.h),
                  errorMaxLines: 2,
                  suffixIcon: _first.value
                      ? null
                      : (_isValid.value
                          ? Icon(Icons.done, color: Colors.green)
                          : Icon(Icons.error, color: Colors.red)),
                ),
                validator: widget.validator,
                controller: widget.controller,
              ),
              if (widget.obscureText == true)
                Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 0.0.w, vertical: 10.h),
                      child: GestureDetector(
                        onTap: () {
                          showpassword.value = !showpassword.value;
                        },
                        child: showpassword.value == true
                            ? Text(
                                "Show password",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    color: Color(0xff115DB1),
                                    fontWeight: FontWeight.w400),
                              )
                            : Text(
                                "Hide password",
                                style: GoogleFonts.poppins(
                                    fontSize: 16.sp,
                                    color: Color(0xff115DB1),
                                    fontWeight: FontWeight.w400),
                              ),
                      ),
                    ))
            ],
          ),
        ),
      ],
    );
  }
}
