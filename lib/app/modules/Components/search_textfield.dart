import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pazimo/app/modules/home/views/Screen/search_view.dart';

class search extends StatelessWidget {
  const search({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              width: 30,
              height: 30,
              child: Image.asset(
                "assets/images/logo.png",
                width: 30,
                height: 30,
              ),
            ),
          ),
          Text(
            "|",
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: TextField(
                onTap: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                  Get.to(() => SearchView());
                },
                decoration: InputDecoration(
                  hintText: "Search for clothes....",
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 53,
              height: 32,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Colors.blue,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Icon(
                Icons.search,
                size: 28,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Colors.black,
                    offset: Offset(0, 0),
                    blurRadius: 5,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
