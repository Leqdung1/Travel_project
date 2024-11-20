import 'package:flutter/material.dart';

import '../../../core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/textStyle.dart';
import '../../widgets/search_bar.dart';
import '../../widgets/title_with_button.dart';
import 'Culture/list_culture_screen.dart';
import 'Culture/popular_cultures_screen.dart';
import 'Destinations/list_destinations_screen.dart';
import 'Destinations/popular_destinations_screen.dart';
import 'Festival/list_festivals_screen.dart';
import 'Festival/popular_festival_screen.dart';
import 'Food/list_foods_screen.dart';
import 'Food/popular_food_screen.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.backGroundColor,
        leading: Image.asset(AppAssets.Marker),
        title: const Text(
          'HanoiVibe',
          style: AppTextStyle.appBarStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        child: ListView(
          children: [
            const Search(),
            TitleWithButton(
              title: 'Popular Destinations',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListDestinationsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const PopularDestinationsScreen(),
            const SizedBox(
              height: 20,
            ),
            TitleWithButton(
              title: 'Popular Festivals',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListFestivalsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const PopularFestivalScreen(),
            const SizedBox(
              height: 20,
            ),
            TitleWithButton(
              title: 'Popular Foods',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListFoodsScreen(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const PopularFoodScreen(),
            const SizedBox(
              height: 20,
            ),
            TitleWithButton(
              title: 'Popular Cultures',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ListCulture(),
                  ),
                );
              },
            ),
            const SizedBox(
              height: 10,
            ),
            const PopularCulturesScreen(),
          ],
        ),
      ),
    );
  }
}
