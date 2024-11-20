import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../application/cultures_bloc/cultures_bloc.dart';
import '../../application/cultures_bloc/cultures_event.dart';
import '../../application/destinations_bloc/destination_event.dart';
import '../../application/destinations_bloc/destnation_bloc.dart';
import '../../application/festivals_bloc/festival_bloc.dart';
import '../../application/festivals_bloc/festival_event.dart';
import '../../application/foods_bloc/food_bloc.dart';
import '../../application/foods_bloc/food_event.dart';
import '../../application/map_cubit/user_location_cubit.dart';
import '../../application/saved_cubit/saved_cultures_cubit.dart';
import '../../application/saved_cubit/saved_destinations_cubit.dart';
import '../../application/saved_cubit/saved_festivals_cubit.dart';
import '../../application/saved_cubit/saved_foods_cubit.dart';
import '../../application/theme_bloc/theme_bloc.dart';
import '../../data/repositories/home_repositories/cultures_repositories.dart';
import '../../data/repositories/home_repositories/destionation_repositories.dart';
import '../../data/repositories/home_repositories/festival_repositories.dart';
import '../../data/repositories/home_repositories/food_repositories.dart';
import '../../presentation/screens/auth/main_page.dart';
import '../constant/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ThemeBloc(),
        ),
        BlocProvider(
          create: (context) => PopularDestnationBloc(
            repositories: PopularDestionationRepositories(),
          )..add(
              const LoadPopularDestination(),
            ),
        ),
        BlocProvider(
          create: (context) => PopularCulturesBloc(
            repositories: PopularCultureRepositories(),
          )..add(
              const LoadedPopularCultures(),
            ),
        ),
        BlocProvider(
          create: (context) => PopularFestivalBloc(
            repositories: PopularFestivalRepositories(),
          )..add(
              const LoadedPopularFestival(),
            ),
        ),
        BlocProvider(
          create: (context) => PopularFoodBloc(
            repositories: PopularFoodRepositories(),
          )..add(
              const LoadedPopularFood(),
            ),
        ),
        BlocProvider(
          create: (context) => SavedCulturesCubit(),
        ),
        BlocProvider(
          create: (context) => SavedDestinationsCubit(),
        ),
        BlocProvider(
          create: (context) => SavedFoodsCubit(),
        ),
        BlocProvider(
          create: (context) => SavedFestivalsCubit(),
        ),
        BlocProvider(
          create: (context) => UserLocationCubit()..getUserLocation(),
        ),
      ],
      child: BlocBuilder<ThemeBloc, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: state,
            home: const MainPage(),
          );
        },
      ),
    );
  }
}
