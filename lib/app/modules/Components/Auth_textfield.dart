import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.blue,
          ),
        ),
        SizedBox(height: 8),
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
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  errorStyle: GoogleFonts.poppins(fontSize: 16),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(255, 253, 19, 2)),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: widget.hint,
                  hintStyle: GoogleFonts.poppins(color: Colors.grey),
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
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
                      padding:
                          EdgeInsets.symmetric(horizontal: .0, vertical: 10),
                      child: GestureDetector(
                        onTap: () {
                          showpassword.value = !showpassword.value;
                        },
                        child: showpassword.value == true
                            ? Text(
                                "Show password",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.w400),
                              )
                            : Text(
                                "Hide password",
                                style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    color: Colors.blue,
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
