import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/pages/detail_page.dart';
import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';

class SpaceCard extends StatelessWidget {
  final Space space;
  const SpaceCard({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => DetailPage(
            space: space,
          ),
        ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: SizedBox(
              width: 130,
              height: 110,
              child: Stack(
                children: [
                  Image.asset(space.imageUrl ?? ""),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: purpleColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(36),
                        ),
                      ),
                      width: 70,
                      height: 30,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/icon_star_active.png',
                            width: 22,
                            height: 22,
                          ),
                          Text(
                            '${space.rating}/5',
                            style: whiteTextStyle.copyWith(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.name ?? "null",
                style: blackTextStyle.copyWith(fontSize: 18),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  text: '\$${space.price}',
                  style: purpleTextStyle.copyWith(fontSize: 16),
                  children: [
                    TextSpan(
                      text: '/ month',
                      style: greyTextStyle.copyWith(fontSize: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '${space.city}, ${space.country}',
                style: greyTextStyle.copyWith(fontSize: 14),
              ),
            ],
          )
        ],
      ),
    );
  }
}
