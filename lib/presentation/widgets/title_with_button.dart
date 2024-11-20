import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../core/constant/color.dart';
import '../../core/constant/textStyle.dart';


class TitleWithButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const TitleWithButton({
    super.key,
    required this.title,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyle.headLineStyle,
        ),
        TextButton(
          onPressed: onPressed,
          child: const Row(
            children: [
              Text(
                'View All',
                style: AppTextStyle.viewAllStyle,
              ),
              SizedBox(
                width: 5,
              ),
              Icon(
                LucideIcons.arrowRight,
                color: AppColors.primaryColor,
                size: 18,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
