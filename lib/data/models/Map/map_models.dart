import 'package:latlong2/latlong.dart';

class MapState {
  final LatLng? userLocation;
  final bool isMapMoved;

  MapState({this.userLocation, this.isMapMoved = false});

  MapState copyWith({LatLng? userLocation, bool? isMapMoved}) {
    return MapState(
      userLocation: userLocation ?? this.userLocation,
      isMapMoved: isMapMoved ?? this.isMapMoved,
    );
  }
}