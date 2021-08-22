import 'package:cozy_kos/pages/home_page.dart';
import 'package:cozy_kos/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/404.png', width: 300),
            const SizedBox(height: 70),
            Text(
              'Where are you going?',
              style: blackTextStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 42),
              child: Text(
                'Seems like the page that you were requested is already gone',
                textAlign: TextAlign.center,
                style: greyTextStyle.copyWith(fontSize: 16),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: 210,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ),
                    (route) => false,
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                  primary: purpleColor,
                  onPrimary: whiteColor,
                ),
                child: Text(
                  'Back to Home',
                  style: whiteTextStyle.copyWith(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
