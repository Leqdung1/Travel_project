import 'package:flutter/material.dart';

import '../../core/constant/color.dart';
import '../../core/constant/textStyle.dart';

void customSnackBar(BuildContext context, String message) {
  final overlay = OverlayEntry(
    builder: (context) => Positioned(
      top: MediaQuery.of(context).padding.top + 10,
      left: 20,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.backGroundColor,
            borderRadius: BorderRadius.circular(12),
            boxShadow: const [
               BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              message,
              style: AppTextStyle.saved,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    ),
  );

  // Insert the OverlayEntry into the overlay
  Overlay.of(context).insert(overlay);

  // Remove the overlay after a short duration
  Future.delayed(const Duration(seconds: 1), () {
    overlay.remove();
  });
}
