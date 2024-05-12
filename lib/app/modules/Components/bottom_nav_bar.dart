import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar(
      {super.key,
      required this.selectedIndex,
      required this.iconSource,
      required this.label});

  final RxInt selectedIndex;
  final List<String> iconSource;
  final List<String> label;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 50,
      type: BottomNavigationBarType.fixed,
      onTap: (value) => {
        selectedIndex.value = value,
      },
      selectedItemColor: Colors.blue,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconSource[0], // Path to your SVG icon
            width: 20,
           
            // ignore: deprecated_member_use
            color: selectedIndex.value == 0 ? Colors.blue : Colors.black,
            height: 20,
          ),
          label: label[0],
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconSource[1],
            width: 20,
            height: 20,
            // ignore: deprecated_member_use
            color: selectedIndex.value == 1 ? Colors.blue : Colors.black,
          ),
          label: label[1],
        ),
        BottomNavigationBarItem(
            icon: Image.asset(
              iconSource[2],
              fit: BoxFit.fill,
              width: 50,
              height: 20,
            ),
            label: ""),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconSource[3],
            width: 20,
            height: 20,
            // ignore: deprecated_member_use
            color: selectedIndex.value == 3 ? Colors.blue : Colors.black,
          ),
          label: label[2],
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            iconSource[4],
            width: 20,
            height: 20,
            // ignore: deprecated_member_use
            color: selectedIndex.value == 4 ? Colors.blue : Colors.black,
          ),
          label: label[3],
        ),
      ],
      currentIndex: selectedIndex.value,
    );
  }
}
