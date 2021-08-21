import 'package:flutter/material.dart';

import 'package:cozy_kos/models/city.dart';
import 'package:cozy_kos/theme.dart';

class CityCard extends StatelessWidget {
  final City city;
  const CityCard(
    this.city, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: SizedBox(
        height: 150,
        width: 120,
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  city.imageUrl ?? "assets/city1.png",
                  width: 120,
                  height: 102,
                  fit: BoxFit.cover,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: city.isPopular
                      ? Container(
                          decoration: BoxDecoration(
                            color: purpleColor,
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(36),
                            ),
                          ),
                          width: 50,
                          height: 30,
                          child: Center(
                            child: Image.asset(
                              'assets/icon_star_active.png',
                              width: 22,
                              height: 22,
                            ),
                          ),
                        )
                      : Container(),
                ),
              ],
            ),
            const SizedBox(height: 11),
            Text(
              city.name ?? "null",
              style: blackTextStyle.copyWith(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
