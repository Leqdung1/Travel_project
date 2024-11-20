import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../application/theme_bloc/theme_bloc.dart';
import '../../application/theme_bloc/theme_event.dart';
import '../../core/constant/color.dart';
import '../../core/constant/textStyle.dart';

class ListSettings extends StatelessWidget {
  final String leading;
  final String title;
  final VoidCallback onPressed;
  const ListSettings({
    super.key,
    required this.leading,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onPressed;
      },
      leading: SvgPicture.asset(
        leading,
        // ignore: deprecated_member_use
        color: AppColors.iconColor,
        height: 20,
        width: 20,
      ),
      title: Text(
        title,
        style: AppTextStyle.bodyStyle,
      ),
      trailing: title == 'Giao diện'
          ? Switch(
              activeColor: AppColors.primaryColor,
              value: context.read<ThemeBloc>().state == ThemeMode.dark,
              onChanged: (value) {
                context.read<ThemeBloc>().add(
                      ThemeChange(
                        value,
                      ),
                    );
              })
          : const Icon(
              LucideIcons.chevronRight,
              color: AppColors.iconColor,
            ),
    );
  }
}
