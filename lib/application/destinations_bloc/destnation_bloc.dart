import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/repositories/home_repositories/destionation_repositories.dart';
import 'destination_event.dart';
import 'destination_state.dart';


class PopularDestnationBloc
    extends Bloc<PopularDestinationEvent, PopularDestinationState> {
  final PopularDestionationRepositories repositories;

  PopularDestnationBloc({required this.repositories})
      : super(const PopularDestinationInitial()) {
    on<LoadPopularDestination>(_onFetch);
    on<LoadedAllDestination>(_onFetchList);
    on<SearchDestinationsEvent>(_onSearch);
  }

  // Popular Destinations
  void _onFetch(LoadPopularDestination event,
      Emitter<PopularDestinationState> emit) async {
    emit(const PopularDestinationLoading());
    try {
      final destinations = await repositories.getPopularDestionations();
      emit(PopularDestinationLoaded(destinations));
    } catch (e) {
      emit(PopularDestinationError(e.toString()));
    }
  }

  // List all destionations
  void _onFetchList(
      LoadedAllDestination event, Emitter<PopularDestinationState> emit) async {
    emit(const PopularDestinationLoading());

    try {
      final destinations = await repositories.getListDestinations();
      emit(PopularDestinationLoaded(destinations));
    } catch (e) {
      emit(
        PopularDestinationError(e.toString()),
      );
    }
  }

  // Search
  void _onSearch(SearchDestinationsEvent event, Emitter<PopularDestinationState> emit) async {
    emit(const PopularDestinationLoading());

    try {
      final destinations = await repositories.SearchDestinationsByTitle(event.query);

      emit(PopularDestinationLoaded(destinations));
      
    } catch(e) {
      emit(PopularDestinationError(e.toString()));
    }
  }
}
