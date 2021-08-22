import 'package:cozy_kos/models/space.dart';
import 'package:cozy_kos/pages/error_page.dart';
import 'package:cozy_kos/providers/space_provider.dart';
import 'package:cozy_kos/theme.dart';
import 'package:cozy_kos/widgets/facility_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailPage extends StatelessWidget {
  final Space space;
  const DetailPage({Key? key, required this.space}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void> _showDialog() async {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Konfirmasi'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Do you want to call the owner?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancel',
                style: regularTextStyle.copyWith(color: Colors.redAccent),
              ),
            ),
            TextButton(
              onPressed: () {
                launch('tel:${space.phone}');
              },
              child: Text(
                'Call',
                style: blackTextStyle.copyWith(color: Colors.blueAccent),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Image.network(
              space.imageUrl ??
                  "https://htmlcolorcodes.com/assets/images/colors/gray-color-solid-background-1920x1080.png",
              width: MediaQuery.of(context).size.width,
              height: 350,
              fit: BoxFit.cover,
            ),
            ListView(
              children: [
                const SizedBox(height: 328),
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
                      buildLocation(context),
                      const SizedBox(height: 40),
                      //* Button
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: edge),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () => _showDialog(),
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
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: edge, vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Image.asset('assets/btn_back.png', width: 40),
                  ),
                  Consumer<SpaceProvider>(
                    builder: (context, spaceProvider, _) => InkWell(
                      onTap: () {
                        final int index = spaceProvider.spaces.indexOf(space);
                        spaceProvider.spaces[index].isWished =
                            !spaceProvider.spaces[index].isWished;
                      },
                      child: Image.asset(
                        space.isWished
                            ? 'assets/btn_wishlist_active.png'
                            : 'assets/btn_wishlist.png',
                        width: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
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
              const SizedBox(height: 30),
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
            FacilityItem(
              name: 'kitchen',
              imageUrl: 'assets/icon_kitchen.png',
              total: space.numberOfKitchens ?? 0,
            ),
            FacilityItem(
              name: 'bedroom',
              imageUrl: 'assets/icon_bed.png',
              total: space.numberOfBedrooms ?? 0,
            ),
            FacilityItem(
                name: 'cupboard',
                imageUrl: 'assets/icon_cupboard.png',
                total: space.numberOfCupboards ?? 0),
          ],
        ),
      );

  Widget buildPhotos() {
    return SizedBox(
      height: 88,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: (space.photos ?? [])
            .map(
              (item) => Container(
                width: 110,
                height: 88,
                margin: EdgeInsets.only(left: edge),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: NetworkImage(item),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  Widget buildLocation(BuildContext context) {
    // ignore: avoid_void_async
    void launchUrl(String urlString) async {
      if (await canLaunch(urlString)) {
        launch(urlString);
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ErrorPage(),
          ),
        );
      }
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: edge),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                space.address ?? "unknown address",
                style: regularTextStyle.copyWith(
                  color: const Color(0xff7A7E86),
                ),
              ),
              Text(
                space.city ?? "unknown address",
                style: regularTextStyle.copyWith(
                  color: const Color(0xff7A7E86),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () async {
              launchUrl(space.mapUrl ?? "");
            },
            child: Image.asset(
              'assets/btn_location.png',
              width: 40,
            ),
          ),
        ],
      ),
    );
  }
}
