import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class gridproductCardShimmer extends StatelessWidget {
  gridproductCardShimmer({super.key, this.length = 4});
  int length;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125 * length.toDouble(),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 8.0,
          childAspectRatio: 0.69,
        ),
        itemCount: length,
        itemBuilder: (context, index) {
          return Container(
            width: double.infinity,
            child: Column(
              children: [
                Shimmer.fromColors(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 230, 227, 227),
                          borderRadius: BorderRadius.circular(10)),
                      height: 190,
                      width: double.infinity,
                    ),
                    baseColor: Color.fromARGB(255, 230, 227, 227),
                    highlightColor: Color.fromARGB(220, 204, 197, 197)),
                SizedBox(
                  height: 5,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Shimmer.fromColors(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 230, 227, 227),
                              borderRadius: BorderRadius.circular(3)),
                          height: 10,
                          width: 160,
                        ),
                        baseColor: Color.fromARGB(255, 230, 227, 227),
                        highlightColor: Color.fromARGB(220, 204, 197, 197)),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Shimmer.fromColors(
                            child: Container(
                              decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 230, 227, 227),
                                  borderRadius: BorderRadius.circular(3)),
                              height: 10,
                              width: 90,
                            ),
                            baseColor: Color.fromARGB(255, 230, 227, 227),
                            highlightColor: Color.fromARGB(220, 204, 197, 197)),
                        SizedBox(
                          width: 20,
                        ),
                        Shimmer.fromColors(
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(3)),
                                height: 10,
                                width: 50),
                            baseColor: Color.fromARGB(255, 230, 227, 227),
                            highlightColor: Color.fromARGB(220, 204, 197, 197)),
                      ],
                    )
                  ],
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
