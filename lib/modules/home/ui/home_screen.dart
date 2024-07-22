import 'package:flutter/material.dart';
import 'package:test_project/core/utils/app_color.dart';
import 'package:test_project/modules/home/widgets/feature_bike_container.dart';
import 'package:test_project/modules/home/widgets/home_header.dart';
import 'package:test_project/modules/home/widgets/icon_buttons_row.dart';

import '../widgets/promo_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.bottomCenter,
        children: [
          Image.asset('assets/images/Rectangle 474.png'),
          const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(top: 50, left: 10, right: 10, bottom: 20),
              child: Column(
                children: [
                  HomeHeader(
                    image: 'assets/icons/Vector.png',
                    text: 'Choose Your Bike',
                    isActionIcon: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  PromoContainer(),
                  SizedBox(
                    height: 20,
                  ),
                  IconButtonsRow(),
                  FeaturedBikeContainer(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
