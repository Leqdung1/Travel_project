import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';


import '../../../../application/festivals_bloc/festival_bloc.dart';
import '../../../../application/festivals_bloc/festival_state.dart';
import '../../../../core/constant/assets.dart';
import '../../../../core/constant/loading.dart';
import '../../../widgets/card_popular.dart';
import '../../../widgets/detail.dart';

class PopularFestivalScreen extends StatelessWidget {
  const PopularFestivalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<PopularFestivalBloc,PopularFestivalState> (
      
        builder: (context, state) {
            if (state is PopularFestivalLoading) {
              return const Center(child: AppLoading.loading,);
            } else if (state is PopularFestivalLoaded) {
              return SizedBox(
                height: 220,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: state.festival.length,
                  itemBuilder: (context, index) {
                      final festivals = state.festival[index];
                      return Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailPage(
                                  title: festivals.title,
                                  image: festivals.image,
                                  address: festivals.address,
                                  description: festivals.description,
                                  history: festivals.history,
                                  feature: festivals.feature,
                                ),
                              ),
                            );
                          },
                          child: cardPopular(
                            CachedNetworkImage(
                              imageUrl: festivals.image[0],
                              fit: BoxFit.cover,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) =>
                                      Image.asset(
                                AppAssets.Marker,
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) =>
                                  Image.asset(
                                AppAssets.Marker,
                                fit: BoxFit.cover,
                              ),
                            ),
                            festivals.title,
                            SvgPicture.asset(
                              AppAssets.Vn,
                              width: 20,
                              height: 20,
                            ),
                            festivals.address,
                          ),
                        ),
                      );
                }),
              );
            } else if (state is PopularFestivalError) {
              return Center(child: Text(state.message),);
            } else {
              return const Center(child: Text('OK'));
            }
        },
      
    );
  }
}