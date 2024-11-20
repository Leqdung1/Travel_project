// Back button
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

// ignore: camel_case_types
class back extends StatelessWidget {
  const back({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          LucideIcons.arrowLeft,
        ),
      ),
    );
  }
}