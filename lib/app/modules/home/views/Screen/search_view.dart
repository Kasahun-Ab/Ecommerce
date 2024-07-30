import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pazimo/app/modules/Components/Item_not_found.dart';
import 'package:pazimo/app/modules/Components/Seggestion.dart';
import 'package:pazimo/app/modules/Components/filter_and_sort_button.dart';
import 'package:pazimo/app/modules/Components/finlter_button.dart';
import 'package:pazimo/app/modules/Components/long_button.dart';
import 'package:pazimo/app/modules/Components/search_items.dart';
import 'package:pazimo/app/modules/home/controllers/home_controller.dart';
import 'package:pazimo/theme/themedata.dart';

class SearchView extends StatelessWidget {
  SearchView({super.key});
  final HomeController controller = Get.find<HomeController>();
  RxInt SortingIndex = 0.obs;
  RxBool isSegestion = false.obs;

  @override
  Widget build(BuildContext context) {
    List<String> SortingmethodList = [
      "Recommended",
      "Recently Added",
      "Price: Low to High",
      "Price: High to Low",
      "Top rated",
    ];
    RxString _selectedItem = "L".obs;
    List<String> listofbrand = [
      "All",
      "Addidas",
      "iPhone",
      "Samsung",
      "HP",
    ];
    List<String> ColorList = [
      "All",
      "Blue",
      "Red",
      "Green",
      "Gray",
    ];
    final List<String> _dropdownItems = ['L', 'M', 'X', 'XX'];
    List<String> suggestion = [
      "Jeans",
      "Casual clothes",
      "Hoodie",
      "Nike shoes black",
      "V-neck tshirt",
      "Winter clothes"
    ];
    RxBool ishadData = false.obs;
    Size size = MediaQuery.of(context).size;
    TextEditingController textController = TextEditingController();
    
    return Scaffold(
      backgroundColor: primary_white,
      appBar: AppBar(
        backgroundColor: primary_white,
        centerTitle: true,
        title: Text("Search",style: GoogleFonts.poppins(fontSize: 24,color: primary_blue,fontWeight: FontWeight.w500),),
        bottom:  PreferredSize(
          preferredSize: Size.fromHeight(56.0),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 3,horizontal: 16),
            child: Container(
              height: 46,
              padding: EdgeInsets.symmetric(vertical: 3,horizontal: 6),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 1,color: primary_back),),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: 'Search...',
                        filled: true,
                        fillColor: Colors.white,
                      
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                            color: Color.fromARGB(0, 255, 255, 255), // Set the border color to black
                            width: 2.0, // Set the border width
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(0, 0, 0, 0), // Set the border color to black
                            width: 2.0, // Set the border width
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(25.0)),
                          borderSide: BorderSide(
                            color: const Color.fromARGB(0, 0, 0, 0), // Set the border color to black
                            width: 2.0, // Set the border width
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                      ),
                    ),
                  ),
                ElevatedButton(

                   style: ElevatedButton.styleFrom(
                    
                    backgroundColor:primary_blue, // Set the button color to blue
                  ),
                  onPressed: () {  },
                   child: Icon(Icons.search,color: primary_white,),)
                ],
              ),
            ),
          ),
        ),),
     
     
     
      body: SingleChildScrollView(
        
       child:  Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
      
                        SearchButton(
                          size: size,
                          title: "Sort By",
                          bg: Colors.amber,
                          textcolor: Colors.black,
                          icon: "assets/svg/sort.svg",
                          tap: () {
                            Get.bottomSheet(Sorts(size, SortingmethodList));
                          },
                        ),
                        // Filter button
                        SearchButton(
                          size: size,
                          title: "Filter",
                          bg: Color(0xff115DB1),
                          textcolor: Colors.white,
                          icon: "assets/svg/filter.svg",
                          tap: () {
                            Get.bottomSheet(Filters(size, listofbrand, ColorList, _selectedItem, _dropdownItems));
                          },
                        ),
                      ],
                    ),
                  ),
                 seggestion(suggestion: suggestion)
                    
                ],
              ),
            ),
        
        
     
      ),
    );
  }

  Widget _buildSearchField(BuildContext context, TextEditingController textController) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          hintText: 'Search...',
          filled: true,
          fillColor: const Color.fromARGB(255, 207, 203, 203),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide.none,
          ),
          prefixIcon: Icon(Icons.search),
        ),
        onChanged: (value) {
          // Implement search logic here
        },
      ),
    );
  }

  Container Sorts(Size size, List<String> SortingmethodList) {
    return Container(
      height: 350.h,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), 
          topRight: Radius.circular(20)
        )
      ),
      child: Column(children: [
        SizedBox(height: 20.h),
        Center(
          child: Container(
            color: Colors.grey,
            width: 100.w,
            height: 3.h,
          ),
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Sort By",
              style: GoogleFonts.poppins(
                fontSize: 20.sp,
                color: Colors.black38,
                fontWeight: FontWeight.w500
              ),
            ),
            Icon(Icons.close, color: Color(0xff115DB1)),
          ],
        ),
        Divider(color: Color.fromARGB(20, 0, 0, 0)),
        SizedBox(height: 7.h),
        Container(
          height: 200.h,
          child: ListView.builder(
            itemCount: SortingmethodList.length,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              return Obx(
                () => Column(
                  children: [
                    InkWell(
                      onTap: () {
                        SortingIndex.value = index;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            SortingmethodList[index],
                            style: GoogleFonts.poppins(
                              fontSize: 18, 
                              fontWeight: FontWeight.w600
                            ),
                          ),
                          Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black, 
                                width: 2
                              )
                            ),
                            child: Center(
                              child: SortingIndex.value == index
                                  ? Container(
                                      height: 12,
                                      width: 12,
                                      decoration: BoxDecoration(
                                        color: const Color.fromARGB(255, 0, 0, 0),
                                        shape: BoxShape.circle,
                                      ),
                                    )
                                  : Container()
                            )
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 15)
                  ],
                ),
              );
            },
          ),
        )
      ])
    );
  }

  Container Filters(
    Size size,
    List<String> listofbrand,
    List<String> ColorList,
    RxString _selectedItem,
    List<String> _dropdownItems
  ) {
    return Container(
      height: 600.h,
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), 
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        children: [
          SizedBox(height: 20.h),
          Center(
            child: Container(
              color: Colors.grey,
              width: 100.w,
              height: 3.h,
            ),
          ),
          SizedBox(height: 20.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Filters",
                style: GoogleFonts.poppins(
                  fontSize: 20.sp,
                  color: Color(0xff115DB1),
                  fontWeight: FontWeight.w500
                ),
              ),
              Icon(Icons.close, color: Color(0xff115DB1)),
            ],
          ),
          Divider(color: Color.fromARGB(20, 0, 0, 0)),
          SizedBox(height: 7.h),
          Column(
            children: [
              filterButton(
                title: 'Brand',
                buttonTitle: '',
                tap: () {},
                listofItems: listofbrand,
                selectedIndex: controller.brandSelectedIndex,
                listoflist: 0,
              ),
              SizedBox(height: 7.h),
              filterButton(
                title: 'Color',
                buttonTitle: '',
                tap: () {},
                listofItems: ColorList,
                selectedIndex: controller.colorSelectedIndex,
                listoflist: 1,
              ),
              SizedBox(height: 4.h),
              Divider(color: Color.fromARGB(20, 0, 0, 0)),
              SizedBox(height: 5.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Price", style: GoogleFonts.poppins(fontSize: 20.sp)),
                ],
              ),
              // Add more filter options here if needed
            ],
          ),
        ],
      ),
    );
  }
}
