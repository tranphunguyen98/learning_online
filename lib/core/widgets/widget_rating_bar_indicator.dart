import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class WidgetRatingBarIndicator extends StatelessWidget {
  final double star;
  final double? itemSize;
  const WidgetRatingBarIndicator({Key? key, required this.star, this.itemSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RatingBarIndicator(
      rating: star,
      itemBuilder: (context, index) => Icon(
        Icons.star,
        color: Colors.amber,
      ),
      itemCount: 5,
      itemSize: itemSize ?? 20.0,
      unratedColor: Colors.amber.withAlpha(50),
    );
  }
}
