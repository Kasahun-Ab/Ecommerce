import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';

class savedItemsView extends StatelessWidget {
  savedItemsView({super.key});
  final HomeController controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    // Define lists for names, descriptions, and image paths
    final List<String> names = [
      'APPLE',
      'Iphone',
      'NIKE',
      'Adidas',
      'Jacket',
      'Electronics'
    ];
    final List<String> descriptions = [
      'Mapbook Pro 512gb',
      'iPhone 14 Pro 128 GB ',
      'Black Half sleve shirt',
      'Blue shirt  ',
      'Description 5',
      'Description 6'
    ];
    final List<String> imagePaths = [
      'assets/images/tv.png', // Example asset paths, replace with your actual asset paths
      'assets/images/iphone.png',
      'assets/images/japoni.png',
      'assets/images/blueblack.png', // Example asset paths, replace with your actual asset paths
      'assets/images/jacket.jpg',
      'assets/images/elec.png',
      // Add more image paths as needed
    ];
    // Define lists of prices
    final List<List<List<String>>> prices = [
      // Prices for the first row items
      [
        [
          '18000 ETB',
          '20000 ETB'
        ], // Prices for the first item in the first row
        [
          '25000 ETB',
          '27000 ETB'
        ], // Prices for the second item in the first row
      ],
      // Prices for the second row items
      [
        ['3000 ETB', '8400 ETB'], // Prices for the first item in the second row
        [
          '4000 ETB',
          '9600 ETB'
        ], // Prices for the second item in the second row
      ],
      // Prices for the third row items
      [
        ['9000 ETB', '2800 ETB'], // Prices for the first item in the third row
        [
          '12000 ETB',
          '3500 ETB'
        ], // Prices for the second item in the third row
      ],
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.blue),
        centerTitle: true,
        title: Text(
          'Saved Items',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.w500, fontSize: 24.sp, color: Colors.blue),
        ),
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(
            3, // Total number of rows
            (rowIndex) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: CardItem(
                      name: names[rowIndex * 2],
                      description: descriptions[rowIndex * 2],
                      prices: prices[rowIndex],
                      imagePath: imagePaths[rowIndex * 2],
                    ),
                  ),
                  SizedBox(width: 8), // Add space between cards
                  Expanded(
                    child: CardItem(
                      name: names[rowIndex * 2 + 1],
                      description: descriptions[rowIndex * 2 + 1],
                      prices: prices[rowIndex],
                      imagePath: imagePaths[rowIndex * 2 + 1],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String name;
  final String description;
  final List<List<String>> prices;
  final String imagePath;

  CardItem({
    required this.name,
    required this.description,
    required this.prices,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[200],
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 14,
                  child: Image.asset(
                    imagePath,
                    // Ensure the image covers the entire space
                  ),
                ),
              ),
            ),
            Positioned(
                top: 20.h,
                right: 20.w,
                child: InkWell(
                  radius: 20.r,
                  onTap: () {
                    print("liked");
                  },
                  child: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Center(
                      child: SvgPicture.asset("assets/svg/like.svg"),
                    ),
                  ),
                )),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    color: Colors.grey[500]),
              ),
              Text(
                description,
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: Colors.grey[600]),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Text(
                            prices[0][
                                1], // Use the second price from the list for the first item
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w800,
                              color: Color(0xff4D4D4D),
                            ),
                          ),
                          SizedBox(width: 10), // Add space between prices
                          Text(
                            prices[0][
                                0], // Use the first price from the list for the first item
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w800,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
