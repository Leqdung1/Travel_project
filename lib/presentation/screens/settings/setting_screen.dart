import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../../../core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../widgets/appbar_root.dart';
import '../../widgets/list_settings.dart';
import '../auth/login.dart';


class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: const AppbarRoot(
        title: 'Cài đặt',
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
        ),
        children: [
          ListSettings(
            leading: AppAssets.Person,
            title: 'Thông tin cá nhân',
            onPressed: () {},
          ),
          ListSettings(
            leading: AppAssets.language,
            title: 'Ngôn ngữ',
            onPressed: () {},
          ),
          ListSettings(
            leading: AppAssets.ThemeMode,
            title: 'Giao diện',
          
            onPressed: () {
              
            },
          ),
          ListTile(
            onTap: () {
              pushWithoutNavBar(
                context,
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              );
            },
            leading: SvgPicture.asset(
              AppAssets.Logout,
              // ignore: deprecated_member_use
              color: Colors.red,
              height: 20,
              width: 20,
            ),
            title: const Text(
              'Đăng xuất',
              style: TextStyle(
                color: Colors.red,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
    );
  }
}
