import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class categoryShimmer extends StatelessWidget {
  const categoryShimmer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: double.infinity,
        child: ListView.builder(
            padding: const EdgeInsets.only(right: 0),
            scrollDirection: Axis.horizontal,
            itemCount: 7,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Shimmer.fromColors(
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 230, 227, 227)),
                          ),
                          baseColor: Color.fromARGB(255, 230, 227, 227),
                          highlightColor: Color.fromARGB(220, 204, 197, 197)),
                      SizedBox(
                        height: 10,
                      ),
                      Shimmer.fromColors(
                          child: Container(
                            height: 5,
                            width: 50,
                            color: Color.fromARGB(255, 230, 227, 227),
                          ),
                          baseColor: Color.fromARGB(255, 230, 227, 227),
                          highlightColor: Color.fromARGB(220, 204, 197, 197))
                    ],
                  ),
                ),
              );
            }));
  }
}
