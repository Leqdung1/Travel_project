import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:toan_project/presentation/screens/home/home_screen.dart';
import '../../core/constant/assets.dart';
import '../../core/constant/color.dart';
import 'explore/explore_screen.dart';
import 'map/map_screen.dart';
import 'settings/setting_screen.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  SelectPageState createState() => SelectPageState();
}

class SelectPageState extends State<SelectPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: AppColors.backGroundColor,
      home: PersistentTabView(
        onTabChanged: (value) {
          setState(() {
            currentPageIndex = value;
          });
        },
        tabs: [
          PersistentTabConfig(
            screen: const HomePage(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                currentPageIndex == 0 ? AppAssets.HomeFill : AppAssets.Home,
              ),
              title: "Trang chủ",
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen: const ExploreScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                currentPageIndex == 1 ? AppAssets.NewsFill : AppAssets.News,
              ),
              title: "Khám phá",
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen: MapScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                currentPageIndex == 2 ? AppAssets.MapFill : AppAssets.Map,
              ),
              title: "Bản đồ",
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
          PersistentTabConfig(
            screen: const SettingScreen(),
            item: ItemConfig(
              icon: SvgPicture.asset(
                currentPageIndex == 3
                    ? AppAssets.SettingsFill
                    : AppAssets.Settings,
              ),
              title: "Cài đặt",
              activeForegroundColor: AppColors.primaryColor,
            ),
          ),
        ],
        navBarBuilder: (navBarConfig) => Style1BottomNavBar(
          navBarDecoration: const NavBarDecoration(
            color: AppColors.backGroundColor,
          ),
          navBarConfig: navBarConfig,
        ),
      ),
    );
  }
}
