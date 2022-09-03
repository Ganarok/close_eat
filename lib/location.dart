import 'package:location/location.dart';
import 'dart:async';

Location _location = Location();

Future<void> askPermission(int retry) async {
  PermissionStatus permission = await _location.requestPermission();

  print('permission: $permission');
  if (permission != PermissionStatus.granted) askPermission(retry + 1);

  await _location.requestService();
}

Future<LocationData> getLocation() async {
  PermissionStatus hasPermissions = await _location.hasPermission();

  print('hasPermissions: $hasPermissions');
  if (hasPermissions != PermissionStatus.granted) {
    askPermission(0);
  }

  print('All permissions ok, returning location');

  return await _location.getLocation();
}
