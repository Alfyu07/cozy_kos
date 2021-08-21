import 'package:cozy_kos/pages/home_page.dart';
import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Image.asset('assets/splash_image.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  "Find Cozy House\nto Stay and Happy",
                  style: blackTextStyle.copyWith(fontSize: 24),
                ),
                const SizedBox(height: 10),
                Text(
                  "Stop membuang banyak waktu\npada tempat yang tidak habitable",
                  style: greyTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 210,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => const HomePage(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      primary: purpleColor,
                      onPrimary: whiteColor,
                    ),
                    child: Text('Explore Now',
                        style: whiteTextStyle.copyWith(fontSize: 18)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
