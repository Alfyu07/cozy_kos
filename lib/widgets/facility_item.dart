import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';

class FacilityItem extends StatelessWidget {
  final String name;
  final String imageUrl;
  final int? total;

  const FacilityItem(
      {Key? key, required this.name, required this.imageUrl, this.total = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(imageUrl, width: 32),
        const SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(
            text: '$total',
            style: purpleTextStyle,
            children: [
              TextSpan(
                text: ' $name',
                style: greyTextStyle,
              ),
            ],
          ),
        )
      ],
    );
  }
}
