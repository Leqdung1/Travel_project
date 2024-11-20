import 'package:equatable/equatable.dart';

import '../../data/models/Home/festival_model.dart';

abstract class PopularFestivalState extends Equatable {
  const PopularFestivalState();

  @override
  List<Object> get props => [];
}

class PopularFestivalInitial extends PopularFestivalState {
  const PopularFestivalInitial();

  @override
  List<Object> get props => [];
}

class PopularFestivalLoading extends PopularFestivalState {
  const PopularFestivalLoading();

  @override
  List<Object> get props => [];
}

class PopularFestivalLoaded extends PopularFestivalState {
  final List<FestivalModel> festival;

  const PopularFestivalLoaded(this.festival);

  @override
  List<Object> get props => [festival];
}

class PopularFestivalError extends PopularFestivalState {
  final String message;
  const PopularFestivalError(this.message);

  @override
  List<Object> get props => [message];
}
