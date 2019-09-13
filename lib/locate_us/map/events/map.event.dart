import 'package:equatable/equatable.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class MapEvent extends Equatable {
  MapEvent([List props = const []]) : super(props);
}

//fetch location event
class FetchLocationEvent extends MapEvent {
  @override
  String toString() => 'FetchLocation';
}

class DrawRouteEvent extends MapEvent {
  // get target latlng to draw line from current location
  final LatLng targetLatLng;

  DrawRouteEvent(this.targetLatLng);

  @override
  String toString() => 'DrawRoute';
}

//show route in map
class OpenRoute extends MapEvent {
  final LatLng originLatLng;
  final LatLng destinationLatLng;

  OpenRoute(this.originLatLng, this.destinationLatLng);

  @override
  String toString() => 'OpenRoute';
}
