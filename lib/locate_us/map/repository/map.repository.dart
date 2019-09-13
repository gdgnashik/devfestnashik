import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class MapRepository {
  LatLng currentLocation;

  Future<LatLng> fetchCurrentLocation() async {
    await checkIfLocationIsOn();
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.medium);
    currentLocation = LatLng(position.latitude, position.longitude);
    return currentLocation;
  }

  checkIfLocationIsOn() async {
    ServiceStatus serviceStatus =
        await PermissionHandler().checkServiceStatus(PermissionGroup.location);
    bool enabled = (serviceStatus == ServiceStatus.enabled);
    if (!enabled) await openLocationSetting();
    return;
  }

  Future openLocationSetting() async {
    if (Platform.isAndroid) {
      final AndroidIntent intent = new AndroidIntent(
        action: 'android.settings.LOCATION_SOURCE_SETTINGS',
      );
      return await intent.launch();
    }
  }
  showRoute(LatLng originLatLng, LatLng destinationLatLng) async {
    String origin =
        "${originLatLng.latitude},${originLatLng.longitude}"; // lat,long like 123.34,68.56
    String destination =
        "${destinationLatLng.latitude},${destinationLatLng.longitude}";
    if (Platform.isAndroid) {
      //open in maps app
      final AndroidIntent intent = new AndroidIntent(
          action: 'action_view',
          data: Uri.encodeFull(
              "https://www.google.com/maps/dir/?api=1&origin=" +
                  origin +
                  "&destination=" +
                  destination +
                  "&travelmode=driving&dir_action=navigate"),
          package: 'com.google.android.apps.maps');
      intent.launch();
    } else {
      //open in browser
      String url = "https://www.google.com/maps/dir/?api=1&origin=" +
          origin +
          "&destination=" +
          destination +
          "&travelmode=driving&dir_action=navigate";
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        //something went wrong
        throw 'Could not launch $url';
      }
    }
  }
}
