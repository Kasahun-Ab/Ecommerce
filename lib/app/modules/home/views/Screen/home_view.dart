import 'package:flutter/material.dart';
import 'package:pazimo/app/modules/Components/CardTitle_with%20Icon.dart';
import 'package:pazimo/app/modules/Components/product_card.dart';
import 'package:pazimo/app/modules/Components/search_textfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: search()),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(children: [
            SizedBox(
              height: 20.h,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.sp,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              padding: EdgeInsets.symmetric(horizontal: 1),
              height: 120.h,
              child: ImageListWithArrows(
                imageUrls: [
                  "assets/images/tshirt.png",
                  "assets/images/sunscreen.png",
                  "assets/images/phone.png",
                  "assets/images/laptop.png",
                  "assets/images/tshirt.png",
                  "assets/images/sunscreen.png",
                  "assets/images/phone.png",
                  "assets/images/laptop.png",
                ],
                imageNames: [
                  "T-Shirt",
                  "Facial",
                  "Phone",
                  "Laptop",
                  "T-Shirt",
                  "Facial",
                  "Phone",
                  "Laptop",
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Container(
              width: double.infinity,
              height: 120.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/images/banner.png"))),
            ),
            SizedBox(
              height: 20.h,
            ),
            CardTitle_with_icon(
              title: 'Big Save',
              subtitle: 'Top brand’s, price slashed',
            ),
            SizedBox(
              height: 12.h,
            ),
            
            Container(
              height: 255.h,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(right: 8.w),
                      child: ProductCard(
                        ImageSource: 'assets/images/iphone.png',
                        brand: 'Apple',
                        description: 'iPhone 14 Pro 128 GB ',
                        price: 'ETB 78,000 ',
                        oldprice: '80000',
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20.h,
            ),
            CardTitle_with_icon(
                title: "Upcoming Events", subtitle: "Limited time offers")
          ]),
        ),
      ),
    );
  }
}

class ImageListWithArrows extends StatefulWidget {
  final List<String> imageUrls;
  final List<String> imageNames;

  const ImageListWithArrows({
    required this.imageUrls,
    required this.imageNames,
    Key? key,
  }) : super(key: key);

  @override
  _ImageListWithArrowsState createState() => _ImageListWithArrowsState();
}

class _ImageListWithArrowsState extends State<ImageListWithArrows> {
  ScrollController _scrollController = ScrollController();
  double _scrollPosition = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_updateScrollPosition);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _updateScrollPosition() {
    setState(() {
      _scrollPosition = _scrollController.position.pixels;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      padding: EdgeInsets.zero,
      child: Row(
        children: [
          Container(
            width: 30,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            margin: EdgeInsets.zero,
            child: Center(
              child: IconButton(
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollPosition - 100,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.yellow[400],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 15, right: 25, top: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                        width: 40,
                        child: Image.asset(
                          widget.imageUrls[index],
                        ),
                      ),
                      SizedBox(height: 0),
                      Text(
                        widget.imageNames[index],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            width: 30,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            margin: EdgeInsets.zero,
            child: Center(
              child: IconButton(
                onPressed: () {
                  _scrollController.animateTo(
                    _scrollPosition + 100,
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                  );
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.yellow[400],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
