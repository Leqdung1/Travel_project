import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../data/models/Map/map_models.dart';


class UserLocationCubit extends Cubit<MapState> {
  UserLocationCubit() : super(MapState());

  Future<void> getUserLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }
      final position = await Geolocator.getCurrentPosition(
        // ignore: deprecated_member_use
        desiredAccuracy: LocationAccuracy.high,
      );
      emit(state.copyWith(
          userLocation: LatLng(position.latitude, position.longitude)));
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void onMapMoved(bool isMapMoved) {
    emit(
      state.copyWith(isMapMoved: isMapMoved),
    );
  }
}
