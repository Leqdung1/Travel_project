import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:toan_project/core/constant/textStyle.dart';
import '../../core/constant/assets.dart';

Widget cardPopular(
  Widget image,
  String title,
  SvgPicture flag,
  String address,
 
) {
  return SizedBox(
    width: 220,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              height: 140,
              width: 220,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  child: image,
                  ),
            ),
            // save
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(AppAssets.BookMark),
                ),
              ),
            ),
            
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: AppTextStyle.headLineStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            flag,
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                address,
                style: AppTextStyle.bodyStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        )
      ],
    ),
  );
}
