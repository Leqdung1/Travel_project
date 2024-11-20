import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/textStyle.dart';

class AppbarRoot extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppbarRoot({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.backGroundColor,
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        style: AppTextStyle.appBarStyle,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
