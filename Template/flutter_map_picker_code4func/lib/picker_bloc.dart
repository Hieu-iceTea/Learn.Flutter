import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_map_picker_code4func/location.dart';

class PickerBloc with ChangeNotifier {
  StreamController<Location> locationController =
      StreamController<Location>.broadcast();
  Location? currentLocation;
  static const mapKey = 'AIzaSyD1yiGZX0U5g_T_9vrHUFs7lH5fZStryZc';

  static PickerBloc? _instance;

  static PickerBloc getInstance() {
    if (_instance == null) {
      _instance = PickerBloc._internal();
    }
    return _instance!;
  }

  PickerBloc._internal();

  Future<List<Location>> search(String query) async {
    String url =
        "https://maps.googleapis.com/maps/api/place/textsearch/json?query=$query&key=$mapKey";
    Response response = await Dio().get(url);
    return Location.parseLocationList(response.data);
  }

  void locationSelected(Location location) {
    locationController.sink.add(location);
  }

  void setLocationByMovingMap(Location location) {
    currentLocation = location;
  }

  void dispose() {
    print('close');
    _instance = null;
    locationController.close();
  }
}
