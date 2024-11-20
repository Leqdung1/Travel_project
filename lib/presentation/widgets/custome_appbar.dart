import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constant/color.dart';
import '../../core/constant/textStyle.dart';
import '../screens/home/search_page.dart';

class CustomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomeAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backGroundColor,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          LucideIcons.arrowLeft,
        ),
      ),
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.appBarStyle,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SearchPage(),
              ),
            );
          },
          icon: const Icon(
            LucideIcons.search,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
