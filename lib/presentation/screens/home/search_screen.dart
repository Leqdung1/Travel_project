import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../application/cultures_bloc/cultures_bloc.dart';
import '../../../application/cultures_bloc/cultures_event.dart';
import '../../../application/cultures_bloc/cultures_state.dart';
import '../../../application/destinations_bloc/destination_event.dart';
import '../../../application/destinations_bloc/destination_state.dart';
import '../../../application/destinations_bloc/destnation_bloc.dart';
import '../../../application/festivals_bloc/festival_bloc.dart';
import '../../../application/festivals_bloc/festival_event.dart';
import '../../../application/festivals_bloc/festival_state.dart';
import '../../../application/foods_bloc/food_bloc.dart';
import '../../../application/foods_bloc/food_event.dart';
import '../../../application/foods_bloc/food_state.dart';
import '../../../core/constant/assets.dart';
import '../../../core/constant/color.dart';
import '../../../core/constant/loading.dart';
import '../../widgets/detail.dart';
import '../../widgets/search_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (mounted) {
      context
          .read<PopularCulturesBloc>()
          .add(SearchCulturesEvent(query: query));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(LucideIcons.arrowLeft),
                    ),
                    Expanded(
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromRGBO(246, 246, 246, 1),
                        ),
                        child: TextField(
                          controller: _searchController,
                          onChanged: _onSearchChanged,
                          decoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 15),
                            border: InputBorder.none,
                            prefixIcon: const Icon(
                              LucideIcons.search,
                              size: 18,
                              color: Color.fromRGBO(165, 165, 165, 1),
                            ),
                            hintText: 'Tìm kiếm...',
                            hintStyle: const TextStyle(
                              fontSize: 16,
                              color: Color.fromRGBO(165, 165, 165, 1),
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                AppAssets.Filter,
                                // ignore: deprecated_member_use
                                color: const Color.fromRGBO(165, 165, 165, 1),
                                width: 18,
                                height: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20, left: 15),
                  child: Text(
                    'Most Popular Search',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SearchDestinations(),
                const SearchFestivals(),
                const SearchFoods(),
                const SearchCultures(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//---------------------- Destinations -----------------------------//

class SearchDestinations extends StatelessWidget {
  const SearchDestinations({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PopularDestnationBloc>().add(const LoadedAllDestination());

    return BlocBuilder<PopularDestnationBloc, PopularDestinationState>(
        builder: (context, state) {
      if (state is PopularDestinationLoading) {
        return const Center(child: AppLoading.loading);
      } else if (state is PopularDestinationLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.destination.length,
          itemBuilder: (context, index) {
            final destinations = state.destination[index];
            return SearchWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: destinations.title,
                      image: destinations.image,
                      address: destinations.address,
                      description: destinations.description,
                      history: destinations.history,
                      feature: destinations.feature,
                    ),
                  ),
                );
              },
              image: destinations.image[0],
              title: destinations.title,
              address: destinations.address,
            );
          },
        );
      } else if (state is PopularDestinationLoaded &&
          state.destination.isEmpty) {
        return const Text(
          'No reulst',
        );
      } else if (state is PopularDestinationError) {
        return const Center(child: Text('Error'));
      } else {
        return const Center(child: Text('No Data'));
      }
    });
  }
}

//---------------------- Festivals -----------------------------//

class SearchFestivals extends StatelessWidget {
  const SearchFestivals({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PopularFestivalBloc>().add(const LoadedAllFestival());

    return BlocBuilder<PopularFestivalBloc, PopularFestivalState>(
        builder: (context, state) {
      if (state is PopularFestivalLoading) {
        return const Center(child: AppLoading.loading);
      } else if (state is PopularFestivalLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.festival.length,
          itemBuilder: (context, index) {
            final festival = state.festival[index];
            return SearchWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: festival.title,
                      image: festival.image,
                      address: festival.address,
                      description: festival.description,
                      history: festival.history,
                      feature: festival.feature,
                    ),
                  ),
                );
              },
              image: festival.image[0],
              title: festival.title,
              address: festival.address,
            );
          },
        );
      } else if (state is PopularFestivalLoaded && state.festival.isEmpty) {
        return const Text(
          'No reulst',
        );
      } else if (state is PopularFestivalError) {
        return const Center(
          child: Text('Error'),
        );
      } else {
        return const Center(
          child: Text('No Data'),
        );
      }
    });
  }
}

//---------------------- Foods -----------------------------//

class SearchFoods extends StatelessWidget {
  const SearchFoods({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PopularFoodBloc>().add(
          const LoadedAllFoods(),
        );

    return BlocBuilder<PopularFoodBloc, PopularFoodState>(
        builder: (context, state) {
      if (state is PopularFoodLoading) {
        return const Center(child: AppLoading.loading);
      } else if (state is PopularFoodLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.food.length,
          itemBuilder: (context, index) {
            final foods = state.food[index];
            return SearchWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: foods.title,
                      image: foods.image,
                      address: foods.address[0],
                      description: foods.description,
                      history: foods.history,
                      feature: foods.feature,
                    ),
                  ),
                );
              },
              image: foods.image[0],
              title: foods.title,
              address: foods.address[0],
            );
          },
        );
      } else if (state is PopularFoodLoaded && state.food.isEmpty) {
        return const Text(
          'No reulst',
        );
      } else if (state is PopularFoodError) {
        return const Center(
          child: Text('Error'),
        );
      } else {
        return const Center(
          child: Text('No Data'),
        );
      }
    });
  }
}

//---------------------- Cultures -----------------------------//

class SearchCultures extends StatelessWidget {
  const SearchCultures({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PopularCulturesBloc>().add(
          const LoadedAllCultures(),
        );

    return BlocBuilder<PopularCulturesBloc, PopularCultureState>(
        builder: (context, state) {
      if (state is PopularCultureLoading) {
        return const Center(child: AppLoading.loading);
      } else if (state is PopularCultureLoaded) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: state.culture.length,
          itemBuilder: (context, index) {
            final cultures = state.culture[index];
            return SearchWidget(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(
                      title: cultures.title,
                      image: cultures.image,
                      address: cultures.address,
                      description: cultures.description,
                      history: cultures.history,
                      feature: cultures.feature[1],
                    ),
                  ),
                );
              },
              image: cultures.image[0],
              title: cultures.title,
              address: cultures.address,
            );
          },
        );
      } else if (state is PopularCultureLoaded && state.culture.isEmpty) {
        return const Text(
          'No reulst',
        );
      } else if (state is PopularCultureError) {
        return const Center(
          child: Text('Error'),
        );
      } else {
        return const Center(
          child: Text('No Data'),
        );
      }
    });
  }
}
