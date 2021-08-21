import 'package:cozy_kos/models/city.dart';
import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/models/tips.dart';
import 'package:cozy_kos/widgets/bottom_navbar_item.dart';
import 'package:cozy_kos/widgets/city_card.dart';
import 'package:cozy_kos/widgets/space_card.dart';
import 'package:cozy_kos/widgets/tips_card.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: edge),
              //* NOTE : TITLE
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Explore Now',
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
              ),
              const SizedBox(height: 2),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Mencari kosan yang cozy',
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 30),
              //* NOTE : POPULER CITIES
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Popular Cities',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    const SizedBox(width: 24),
                    CityCard(
                      City(
                        id: 1,
                        name: 'Jakarta',
                        imageUrl: 'assets/city1.png',
                      ),
                    ),
                    const SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 2,
                        name: 'Bandung',
                        imageUrl: 'assets/city2.png',
                        isPopular: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 3,
                        name: 'Surabaya',
                        imageUrl: 'assets/city3.png',
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              //* NOTE : Recommended Spaces
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Recommended Spaces',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Column(
                  children: [
                    SpaceCard(
                      space: Space(
                        id: 1,
                        name: "Kuretakeso Hott",
                        price: 52,
                        city: "Bandung",
                        country: "Germany",
                        imageUrl: 'assets/space1.png',
                        rating: 4,
                      ),
                    ),
                    SizedBox(height: 30),
                    SpaceCard(
                      space: Space(
                        id: 2,
                        name: "Roemah Nenek",
                        price: 11,
                        city: "Seattle",
                        country: "Bogor",
                        imageUrl: 'assets/space2.png',
                        rating: 5,
                      ),
                    ),
                    SizedBox(height: 30),
                    SpaceCard(
                      space: Space(
                        id: 3,
                        name: "Darrling How",
                        price: 20,
                        city: "Jakarta",
                        country: "Indonesia",
                        imageUrl: 'assets/space3.png',
                        rating: 3,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),
              //* NOTE : Recommended Spaces
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Text(
                  'Tips & Guidance',
                  style: regularTextStyle.copyWith(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: Column(
                  children: [
                    TipsCard(
                      tips: Tips(
                        id: 1,
                        imageUrl: 'assets/tips1.png',
                        title: "City Guidlines",
                        updatedAt: "20 Apr",
                      ),
                    ),
                    const SizedBox(height: 20),
                    TipsCard(
                      tips: Tips(
                        id: 2,
                        imageUrl: 'assets/tips2.png',
                        title: "Jakarta Fairship",
                        updatedAt: "11 Dec",
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50 + edge),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: MediaQuery.of(context).size.width - (2 * edge),
        height: 65,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23),
          color: const Color(0xffF6F7F8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/icon_home',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_mail',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_card',
            ),
            BottomNavbarItem(
              imageUrl: 'assets/icon_love',
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
