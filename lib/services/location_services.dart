import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';

class LocationServices {
  LocationServices._();

  static final LocationServices _instance = LocationServices._();

  static LocationServices get instance => _instance;

  final Location _location = Location();
  LocationData? locationData;
  bool _serviceEnable = false;
  bool _permissionGranted = false;
  PermissionStatus? permissionStatus;

  Future<bool> checkService() async {
    try {
      _serviceEnable = await _location.serviceEnabled();
      if (!_serviceEnable) {
        _serviceEnable = await _location.requestService();
      }
    } catch (e) {
      debugPrint("Location service error: ${e.toString()}");
      _serviceEnable = false;
      await checkService();
    }
    return _serviceEnable;
  }

  Future<bool> checkPermission() async {
    if (await checkService()) {
      permissionStatus = await _location.hasPermission();
      if (permissionStatus == PermissionStatus.denied) {
        permissionStatus = await _location.requestPermission();
      }
    }
    return permissionStatus == PermissionStatus.granted;
  }

  Future<LocationData?> getLocationData() async {
    if (await checkPermission()) {
      final data = await _location.getLocation();
      locationData = data;
      return data;
    }
    return null;
  }
}
