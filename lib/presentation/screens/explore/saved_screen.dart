import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../application/saved_cubit/saved_cultures_cubit.dart';
import '../../../application/saved_cubit/saved_destinations_cubit.dart';
import '../../../application/saved_cubit/saved_festivals_cubit.dart';
import '../../../application/saved_cubit/saved_foods_cubit.dart';
import '../../../core/constant/assets.dart';
import '../../../data/models/Home/culture_model.dart';
import '../../../data/models/Home/destinations_model.dart';
import '../../../data/models/Home/festival_model.dart';
import '../../../data/models/Home/food_model.dart';
import '../../widgets/detail.dart';
import '../../widgets/list_page.dart';


class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SavedDestinations(),
          SavedCultures(),
          SavedFestivals(),
          SavedFoods(),
        ],
      ),
    );
  }
}

//---------------------- Destinations -----------------------------//

class SavedDestinations extends StatelessWidget {
  const SavedDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedDestinationsCubit, List<DestinationsModels>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text('No saved'),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            final item = state[index];
            return ListPage(
              address: item.address,
              image: item.image[0],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item.title,
                      image: item.image,
                      address: item.address,
                      description: item.description,
                      history: item.history,
                      feature: item.feature[1],
                    ),
                  ),
                );
              },
              title: item.title,
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
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<SavedDestinationsCubit>()
                          .toogleSave(context, item);
                    },
                    icon: SvgPicture.asset(AppAssets.BookMarkFill),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

//---------------------- Cultures -----------------------------//

class SavedCultures extends StatelessWidget {
  const SavedCultures({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedCulturesCubit, List<CultureModel>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text('No saved'),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            final item = state[index];
            return ListPage(
              address: item.address,
              image: item.image[0],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item.title,
                      image: item.image,
                      address: item.address,
                      description: item.description,
                      history: item.history,
                      feature: item.feature[1],
                    ),
                  ),
                );
              },
              title: item.title,
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
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<SavedCulturesCubit>()
                          .toggleSave(context, item);
                    },
                    icon: SvgPicture.asset(AppAssets.BookMarkFill),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

//---------------------- Festivals -----------------------------//

class SavedFestivals extends StatelessWidget {
  const SavedFestivals({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedFestivalsCubit, List<FestivalModel>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text('No saved'),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            final item = state[index];
            return ListPage(
              address: item.address,
              image: item.image[0],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item.title,
                      image: item.image,
                      address: item.address,
                      description: item.description,
                      history: item.history,
                      feature: item.feature[1],
                    ),
                  ),
                );
              },
              title: item.title,
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
                  child: IconButton(
                    onPressed: () {
                      context
                          .read<SavedFestivalsCubit>()
                          .toogleSave(context, item);
                    },
                    icon: SvgPicture.asset(AppAssets.BookMarkFill),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

//---------------------- Foods -----------------------------//

class SavedFoods extends StatelessWidget {
  const SavedFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SavedFoodsCubit, List<FoodModel>>(
      builder: (context, state) {
        if (state.isEmpty) {
          return const Center(
            child: Text('No saved'),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.length,
          itemBuilder: (context, index) {
            final item = state[index];
            return ListPage(
              address: item.address[0],
              image: item.image[0],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: item.title,
                      image: item.image,
                      address: item.address[0],
                      description: item.description,
                      history: item.history,
                      feature: item.feature[1],
                    ),
                  ),
                );
              },
              title: item.title,
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
                  child: IconButton(
                    onPressed: () {
                      context.read<SavedFoodsCubit>().toogleSave(context, item);
                    },
                    icon: SvgPicture.asset(AppAssets.BookMarkFill),
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
