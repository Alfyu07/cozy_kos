import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  const DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          Image.asset(
            'assets/space1.png',
            width: MediaQuery.of(context).size.width,
            height: 350,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/btn_back.png', width: 40),
                  Image.asset(
                    'assets/btn_wishlist.png',
                    width: 40,
                  ),
                ],
              ),
            ),
          ),
          ListView(
            children: [
              const SizedBox(height: 280),
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(20),
                  ),
                  color: whiteColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Header
                    buildHeader(),
                    const SizedBox(height: 30),

                    // *Main Facilities
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text('Main Facilities',
                          style: blackTextStyle.copyWith(fontSize: 16)),
                    ),
                    const SizedBox(height: 12),
                    buildFacilities(),
                    const SizedBox(height: 30),

                    //* Photos
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text('Photos',
                          style: blackTextStyle.copyWith(fontSize: 16)),
                    ),
                    const SizedBox(height: 12),
                    buildPhotos(),
                    const SizedBox(height: 30),
                    //* Location
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: Text('Location',
                          style: blackTextStyle.copyWith(fontSize: 16)),
                    ),
                    const SizedBox(height: 12),
                    buildLocation(),
                    const SizedBox(height: 40),
                    //* Button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: edge),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(17),
                            ),
                            primary: purpleColor,
                            onPrimary: whiteColor,
                          ),
                          child: Text(
                            'Book Now',
                            style: whiteTextStyle.copyWith(fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: EdgeInsets.only(
        left: edge,
        right: edge,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
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
            ],
          ),
          buildStars()
        ],
      ),
    );
  }

  Widget buildStars() {
    return Row(
      children: [
        for (num i = 1; i <= 5; i++)
          if (i <= (space.rating ?? 0))
            Container(
              margin: const EdgeInsets.only(right: 2),
              child: Image.asset(
                'assets/icon_star_active.png',
                width: 20,
              ),
            )
          else
            Container(
              margin: const EdgeInsets.only(right: 2),
              child: Image.asset(
                'assets/icon_star.png',
                width: 20,
              ),
            )
      ],
    );
  }

  Widget buildFacilities() => Padding(
        padding: EdgeInsets.symmetric(horizontal: edge),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset('assets/icon_kitchen.png', width: 32),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    text: '2',
                    style: purpleTextStyle,
                    children: [
                      TextSpan(
                        text: ' kitchen',
                        style: greyTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/icon_bed.png', width: 32),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    text: '3',
                    style: purpleTextStyle,
                    children: [
                      TextSpan(
                        text: ' bedroom',
                        style: greyTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/icon_cupboard.png', width: 32),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    text: '3',
                    style: purpleTextStyle,
                    children: [
                      TextSpan(
                        text: ' cupboard',
                        style: greyTextStyle,
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      );

  Widget buildPhotos() {
    return Container(
      height: 110,
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/city1.png',
                width: 110, height: 88, fit: BoxFit.cover),
          ),
          const SizedBox(width: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/city2.png',
                width: 110, height: 88, fit: BoxFit.cover),
          ),
          const SizedBox(width: 18),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/city3.png',
                width: 110, height: 88, fit: BoxFit.cover),
          ),
          const SizedBox(width: 18),
        ],
      ),
    );
  }

  Widget buildLocation() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jln Kappan Sukses No. 20',
                style: regularTextStyle.copyWith(
                  color: const Color(0xff7A7E86),
                ),
              ),
              Text(
                'Palembang',
                style: regularTextStyle.copyWith(
                  color: const Color(0xff7A7E86),
                ),
              ),
            ],
          ),
          Image.asset(
            'assets/btn_wishlist.png',
            width: 40,
          ),
        ],
      ),
    );
  }
}
