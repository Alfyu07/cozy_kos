import 'package:flutter/material.dart';

import 'package:cozy_kos/theme.dart';

class BottomNavbarItem extends StatelessWidget {
  final String? imageUrl;
  final bool isActive;
  const BottomNavbarItem({Key? key, this.imageUrl, this.isActive = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(
          isActive ? '${imageUrl}_active.png' : "$imageUrl.png",
          width: 26,
        ),
        const Spacer(),
        if (isActive)
          Container(
            width: 30,
            height: 4,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(1000)),
              color: purpleColor,
            ),
          )
        else
          Container()
      ],
    );
  }
}
