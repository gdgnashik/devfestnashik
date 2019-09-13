import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:gdg_nashik/locate_us/map/events/map.event.dart';
import 'package:gdg_nashik/locate_us/map/repository/map.repository.dart';
import 'package:gdg_nashik/locate_us/map/states/map.state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  final MapRepository mapRepository;

  MapBloc() : mapRepository = MapRepository();

  //start with uninitialized state
  @override
  MapState get initialState => LocationUnInitializedState();

  @override
  Stream<MapState> mapEventToState(MapEvent event) async* {
    if (event is FetchLocationEvent) {
      LatLng currentLocation = await mapRepository.fetchCurrentLocation();
      yield LocationFetchedState(currentLocation: currentLocation);
    } else if (event is DrawRouteEvent) {
      LocationFetchedState locationFetchedState = LocationFetchedState.instance;
      locationFetchedState.polyLine.add(Polyline(
          polylineId:
              PolylineId(locationFetchedState.polyLine.length.toString()),
          points: [event.targetLatLng, locationFetchedState.currentLocation],
          width: 4,
          color: Colors.indigo.shade900,
          zIndex: 3,
          //start,end line shape
          endCap: Cap.roundCap,
          startCap: Cap.roundCap,
          patterns: [
            PatternItem.dot,
            PatternItem.dash(2),
            PatternItem.gap(4)
          ]));
      locationFetchedState.markers.addAll([
        Marker(
            markerId: MarkerId(event.targetLatLng.hashCode.toString()),
            position: event.targetLatLng,
            onTap: () {
              dispatch(OpenRoute(
                  locationFetchedState.currentLocation, event.targetLatLng));
            })
      ]);

      //show loading till you feed new data

      yield LocationLoadingState();
      yield LocationFetchedState.getClone(locationFetchedState);
    } else if (event is OpenRoute) {
      mapRepository.showRoute(event.originLatLng, event.destinationLatLng);
    }
  }
}
