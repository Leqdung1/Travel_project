import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../widgets/appbar_root.dart';
import 'post_screen.dart';
import 'saved_screen.dart';


class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int? selectedSegment = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      appBar: const AppbarRoot(
        title: 'Khám phá',
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomSlidingSegmentedControl<int>(
            fixedWidth: MediaQuery.sizeOf(context).width * 0.45,
            initialValue: selectedSegment,
            children: {
              1: Text(
                'Đã lưu',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: selectedSegment == 1
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: selectedSegment == 1
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              2: Text(
                'Bảng tin',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: selectedSegment == 2
                      ? FontWeight.bold
                      : FontWeight.normal,
                  color: selectedSegment == 2
                      ? Colors.white
                      : Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            },
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(8),
            ),
            thumbDecoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.15),
                  blurRadius: 4.0,
                  offset: const Offset(
                    0.0,
                    1.0,
                  ),
                ),
              ],
            ),
            duration: const Duration(milliseconds: 280),
            curve: Curves.linear,
            onValueChanged: (v) {
              setState(() {
                selectedSegment = v;
              });
            },
          ),
          const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15,
              horizontal: 15,
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.75,
            child: selectedSegment == 1 ? const SaveScreen() : PostScreen(),
          ),
        ],
      ),
    );
  }
}
