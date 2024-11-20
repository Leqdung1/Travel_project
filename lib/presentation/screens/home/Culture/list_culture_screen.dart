import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../application/cultures_bloc/cultures_bloc.dart';
import '../../../../application/cultures_bloc/cultures_event.dart';
import '../../../../application/cultures_bloc/cultures_state.dart';
import '../../../../application/saved_cubit/saved_cultures_cubit.dart';
import '../../../../core/constant/assets.dart';
import '../../../../core/constant/loading.dart';
import '../../../../data/models/Home/culture_model.dart';
import '../../../widgets/custome_appbar.dart';
import '../../../widgets/detail.dart';
import '../../../widgets/list_page.dart';

class ListCulture extends StatelessWidget {
  const ListCulture({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<PopularCulturesBloc>().add(const LoadedAllCultures());
    return Scaffold(
      appBar: const CustomeAppbar(
        title: 'Popular Cultures',
      ),
      body: BlocBuilder<PopularCulturesBloc, PopularCultureState>(
        builder: (context, state) {
          if (state is PopularCultureLoading) {
            return const Center(
              child: AppLoading.loading,
            );
          } else if (state is PopularCultureLoaded) {
            return ListView.builder(
              itemCount: state.culture.length,
              itemBuilder: (context, index) {
                final culture = state.culture[index];
                return ListPage(
                  address: culture.address,
                  image: culture.image[0],
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          title: culture.title,
                          image: culture.image,
                          address: culture.address,
                          description: culture.description,
                          history: culture.history,
                          feature: culture.feature[1],
                        ),
                      ),
                    );
                  },
                  title: culture.title,
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
                          BlocBuilder<SavedCulturesCubit, List<CultureModel>>(
                        builder: (context, state) {
                          final isSaved =
                              state.any((item) => item.image == culture.image);
                          return IconButton(
                            onPressed: () {
                              context
                                  .read<SavedCulturesCubit>()
                                  .toggleSave(context, culture);
                              
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
          } else if (state is PopularCultureError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(
              child: Text('No data available.'),
            );
          }
        },
      ),
    );
  }
}
