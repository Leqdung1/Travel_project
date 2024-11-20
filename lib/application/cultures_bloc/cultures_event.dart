import 'package:equatable/equatable.dart';

abstract class PopularCulturesEvent extends Equatable {
  const PopularCulturesEvent();

  @override
  List<Object?> get props => [];
}

class LoadedPopularCultures extends PopularCulturesEvent {
  const LoadedPopularCultures();

  @override
  List<Object?> get props => [];
}

class LoadedAllCultures extends PopularCulturesEvent {
  const LoadedAllCultures();

  @override
  List<Object?> get props => [];
}

class FilterCultures extends PopularCulturesEvent {
  const FilterCultures();

  @override
  List<Object?> get props => [];
}

class SearchCulturesEvent extends PopularCulturesEvent {
  final String query;

  const SearchCulturesEvent({required this.query});

  @override
  List<Object?> get props => [query];
}
