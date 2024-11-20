import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../../core/constant/assets.dart';
import '../../core/constant/textStyle.dart';


class SearchWidget extends StatelessWidget {
  final String title;
  final String image;
  final String address;
  final VoidCallback onPressed;
  const SearchWidget({
    super.key,
    required this.onPressed,
    required this.image,
    required this.title,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListTile(
        onTap: () {
          onPressed();
        },
        leading: SizedBox(
          height: MediaQuery.sizeOf(context).height * 1,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              15,
            ),
            child: CachedNetworkImage(
              imageUrl: image,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Image.asset(
                AppAssets.Marker,
                fit: BoxFit.cover,
              ),
              errorWidget: (context, url, error) => Image.asset(
                AppAssets.Marker,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          title,
          style: AppTextStyle.headLineStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Text(
                address,
                style: AppTextStyle.bodyStyle,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        trailing: const Icon(
          LucideIcons.chevronRight,
        ),
      ),
    );
  }
}
