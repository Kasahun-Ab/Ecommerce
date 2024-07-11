import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ratingwithProgressbar extends StatelessWidget {
  const ratingwithProgressbar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          child: RatingBar.builder(
            itemSize: 18,
            initialRating: 4,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (rating) {},
          ),
        ),
        Container(
            width: size.width / 1.7,
            child: LinearProgressIndicator(
              value: 4,
              color: Color(0xff115DB1),
              backgroundColor: Color(0xffE5E5E5),
            )),
      ],
    );
  }
}
