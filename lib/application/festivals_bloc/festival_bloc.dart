import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/home_repositories/festival_repositories.dart';
import 'festival_event.dart';
import 'festival_state.dart';


class PopularFestivalBloc
    extends Bloc<PopularFestivalEvent, PopularFestivalState> {
  final PopularFestivalRepositories repositories;

  PopularFestivalBloc({required this.repositories})
      : super(const PopularFestivalInitial()) {
    on<LoadedPopularFestival>(_onFetch);
    on<LoadedAllFestival>(_onFetchList);
    on<SearchFestivalsEvent>(_onSearch);
  }

  void _onFetch(
      LoadedPopularFestival event, Emitter<PopularFestivalState> emit) async {
    emit(const PopularFestivalLoading());
    try {
      final festivals = await repositories.getPopularFestivals();
      emit(PopularFestivalLoaded(festivals));
    } catch (e) {
      emit(PopularFestivalError(e.toString()));
    }
  }

  void _onFetchList(
      LoadedAllFestival event, Emitter<PopularFestivalState> emit) async {
    emit(const PopularFestivalLoading());
    try {
      final festivals = await repositories.getListFestival();
      emit(PopularFestivalLoaded(festivals));
    } catch (e) {
      emit(PopularFestivalError(e.toString()));
    }
  }

  void _onSearch(SearchFestivalsEvent event, Emitter<PopularFestivalState> emit) async {
    emit(const PopularFestivalLoading());

    try {
      final festivals = await repositories.SearchFestivalsByTitle(event.query);

      emit(PopularFestivalLoaded(festivals));
   
    } catch(e) {
      emit(PopularFestivalError(e.toString()));
    }
  }
}
