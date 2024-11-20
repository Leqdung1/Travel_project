import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../application/festivals_bloc/festival_bloc.dart';
import '../../../../application/festivals_bloc/festival_event.dart';
import '../../../../application/festivals_bloc/festival_state.dart';
import '../../../../application/saved_cubit/saved_festivals_cubit.dart';
import '../../../../core/constant/assets.dart';
import '../../../../core/constant/loading.dart';
import '../../../../data/models/Home/festival_model.dart';
import '../../../widgets/custome_appbar.dart';
import '../../../widgets/detail.dart';
import '../../../widgets/list_page.dart';

class ListFestivalsScreen extends StatelessWidget {
  const ListFestivalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PopularFestivalBloc>().add(const LoadedAllFestival());
    return Scaffold(
      appBar: const CustomeAppbar(
        title: 'Popular Festivals',
      ),
      body: BlocBuilder<PopularFestivalBloc, PopularFestivalState>(
          builder: (context, state) {
        if (state is PopularFestivalLoading) {
          return const Center(child: AppLoading.loading);
        } else if (state is PopularFestivalLoaded) {
          return ListView.builder(
            itemCount: state.festival.length,
            itemBuilder: (context, index) {
              final festivals = state.festival[index];
              return ListPage(
                address: festivals.address,
                image: festivals.image[0],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        title: festivals.title,
                        image: festivals.image,
                        address: festivals.address,
                        description: festivals.description,
                        history: festivals.history,
                        feature: festivals.feature[1],
                      ),
                    ),
                  );
                },
                title: festivals.title,
                widget: Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child:
                        BlocBuilder<SavedFestivalsCubit, List<FestivalModel>>(
                      builder: (context, state) {
                        final isSaved =
                            state.any((item) => item.image == festivals.image);
                        return IconButton(
                          onPressed: () {
                            context
                                .read<SavedFestivalsCubit>()
                                .toogleSave(context, festivals);
                          },
                          icon: isSaved
                              ? SvgPicture.asset(AppAssets.BookMarkFill)
                              : SvgPicture.asset(AppAssets.BookMark),
                        );
                      },
                    ),
                  ),
                ),
              );
            },
          );
        } else if (state is PopularFestivalError) {
          return Center(child: Text(state.message));
        } else {
          return const Center(
            child: Text('No data'),
          );
        }
      }),
    );
  }
}
