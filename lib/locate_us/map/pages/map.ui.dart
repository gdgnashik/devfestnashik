
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gdg_nashik/locate_us/map/blocs/map.bloc.dart';
import 'package:gdg_nashik/locate_us/map/events/map.event.dart';
import 'package:gdg_nashik/locate_us/map/states/map.state.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapUi extends StatefulWidget {
  @override
  _MapUiState createState() => _MapUiState();
}

class _MapUiState extends State<MapUi> {
  startLocating(MapBloc mapBloc) {
    // start location service from here
    mapBloc?.dispatch(FetchLocationEvent());
  }

  drawPolyLine(MapBloc mapBloc, LatLng targetLocation) {
    //draw line on map to user's tapped location
    mapBloc?.dispatch(DrawRouteEvent(targetLocation));
  }

  @override
  Widget build(BuildContext context) {
    MapBloc _mapBloc = BlocProvider.of<MapBloc>(context);
    startLocating(_mapBloc);
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      appBar: AppBar(
        title: Text("Map"),
      ),
      body: Center(
        child: BlocBuilder<MapBloc, MapState>(builder: (context, state) {
          if (state is LocationUnInitializedState) {
            return Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                CircularProgressIndicator(),
                SizedBox(
                  width: 16,
                ),
                Text("Getting your location...",
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blue.shade900,
                        letterSpacing: 2)),
              ],
            );
          } else if (state is LocationEmptyState) {
            //when you don't get location
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Can't Set Current Location",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade900,
                    letterSpacing: 1.5),
              ),
            );
          } else if (state is LocationEmptyState) {
            //when you get some error in locating user
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Something went wrong",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.blue.shade900,
                    letterSpacing: 1.5),
              ),
            );
          } else if (state is LocationLoadingState) {
            //show loader till app gets user's location
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is LocationFetchedState) {
            return Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                      // if there is no polyline then ask user to select a location
                      //if there is polyline then ask user to tap on marker to get route between current location and marker
                      state.polyLine.length == 0
                          ? "Tap anywhere on screen to draw line"
                          : "Tap on any marker to get route",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.blue.shade900,
                          letterSpacing: 1.5)),
                ),
                Expanded(
                  child: GoogleMap(
                    myLocationEnabled: true,
                    myLocationButtonEnabled: true,
                    rotateGesturesEnabled: true,
                    mapType: MapType.normal,
                    initialCameraPosition: CameraPosition(
                      target: state.currentLocation,
                      zoom: 14,
                    ),
                    onTap: (targetLocation) {
                      drawPolyLine(_mapBloc, targetLocation);
                    },
                    markers: state.markers.toSet(),
                    polylines: state.polyLine.toSet(),
                  ),
                ),
              ],
            );
          } else
            //when there is unidentified state then return a blank screen
            return SizedBox();
        }),
      ),
    );
  }
}
