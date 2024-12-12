import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/constant/assets.dart';
import '../../core/constant/button.dart';
import '../../core/constant/color.dart';
import '../../core/constant/textStyle.dart';


// ignore: must_be_immutable
class DetailFoodPage extends StatefulWidget {
  String title;
  List<String> image;
  String address;
  String description;
  String history;
  String feature;
  String ingredients;

  DetailFoodPage({
    super.key,
    required this.title,
    required this.image,
    required this.address,
    required this.description,
    required this.history,
    required this.feature,
    required this.ingredients,
  });

  @override
  State<DetailFoodPage> createState() => _DetailFoodPageState();
}

class _DetailFoodPageState extends State<DetailFoodPage> {
  final CollectionReference collectDestinations =
      FirebaseFirestore.instance.collection('Destinations');
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              CachedNetworkImage(
                imageUrl: widget.image[0],
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Image.asset(
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
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const back(),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            AppAssets.BookMark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    widget.title,
                    style: AppTextStyle.headStyle,
                  ),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppAssets.Vn,
                      width: 20,
                      height: 20,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Text(
                        widget.address[1],
                        style: AppTextStyle.bodyStyle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                  ),
                  child: Text(
                    widget.description,
                    style: AppTextStyle.bodyStyle,
                  ),
                ),
                const Text(
                  'Ảnh minh họa',
                  style: AppTextStyle.headLineStyle,
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 120,
                  child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: widget.image[1],
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
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: widget.image[2],
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
                      const SizedBox(
                        width: 10,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: widget.image[3],
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
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    'Lịch sử',
                    style: AppTextStyle.headLineStyle,
                  ),
                ),
                Text(
                  widget.history,
                  style: AppTextStyle.bodyStyle,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    'Nguyên liệu',
                    style: AppTextStyle.headLineStyle,
                  ),
                ),
                Text(
                  widget.ingredients,
                  style: AppTextStyle.bodyStyle,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Text(
                    'Đặc trưng',
                    style: AppTextStyle.headLineStyle,
                  ),
                ),
                Text(
                  widget.feature,
                  style: AppTextStyle.bodyStyle,
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Container(
              margin: const EdgeInsets.symmetric(
                vertical: 30,
              ),
              width: MediaQuery.sizeOf(context).width * 1,
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Center(
                child: Text(
                  'Start a trip',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.1,
          ),
        ],
      ),
    );
  }
}
