import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import '../../core/constant/assets.dart';
import '../../core/constant/color.dart';
import '../../core/constant/textStyle.dart';

class ListPage extends StatelessWidget {
  final String title;
  final String image;
  final String address;
  final VoidCallback onPressed;
  final Widget widget;
  const ListPage({
    super.key,
    required this.address,
    required this.image,
    required this.onPressed,
    required this.title,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        color: AppColors.backGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    progressIndicatorBuilder:
                        (context, url, downloadProgress) => Image.asset(
                      AppAssets.Marker,
                      fit: BoxFit.cover,
                      height: 150,
                      width: MediaQuery.sizeOf(context).width * 1,
                    ),
                    errorWidget: (context, url, error) => Image.asset(
                      AppAssets.Marker,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                widget,
                // Positioned(
                //   top: 10,
                //   right: 10,
                //   child: Container(
                //     height: 40,
                //     width: 40,
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       shape: BoxShape.circle,
                //     ),
                //     child: IconButton(
                //       onPressed: () {
                //           onSaved;
                //       },
                //       icon: SvgPicture.asset(AppAssets.BookMark),
                //     ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              title,
              style: AppTextStyle.headLineStyle,
            ),
            Row(
              children: [
                SvgPicture.asset(
                  AppAssets.Vn,
                  width: 20,
                  height: 20,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 20,
                    ),
                    child: Text(
                      address,
                      style: AppTextStyle.bodyStyle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
