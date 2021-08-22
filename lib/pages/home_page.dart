import 'package:cozy_kos/api/bwa_api.dart';
import 'package:cozy_kos/models/city.dart';
import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/models/tips.dart';
import 'package:cozy_kos/providers/space_provider.dart';
import 'package:cozy_kos/widgets/bottom_navbar_item.dart';
import 'package:cozy_kos/widgets/city_card.dart';
import 'package:cozy_kos/widgets/space_card.dart';
import 'package:cozy_kos/widgets/tips_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final spaceProvider = Provider.of<SpaceProvider>(context);

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
                    const SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 4,
                        name: 'Palembang',
                        imageUrl: 'assets/city4.png',
                      ),
                    ),
                    const SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 5,
                        name: 'Aceh',
                        imageUrl: 'assets/city5.png',
                        isPopular: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    CityCard(
                      City(
                        id: 6,
                        name: 'Bogor',
                        imageUrl: 'assets/city6.png',
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
              const SizedBox(height: 12),
              Padding(
                padding: EdgeInsets.only(left: edge),
                child: FutureBuilder(
                  future: BwaApi.getRecommendedSpace(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final List<Space>? spaces = snapshot.data as List<Space>?;

                      final provider = Provider.of<SpaceProvider>(context);
                      provider.setSpaces(spaces!);
                      return Column(
                        children: spaces
                            .map(
                              (e) => Container(
                                margin: EdgeInsets.only(
                                  top: e == spaces.first ? 0 : 30,
                                ),
                                child: SpaceCard(space: e),
                              ),
                            )
                            .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
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
