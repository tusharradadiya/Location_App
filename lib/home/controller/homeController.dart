import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Placemark> placeList = <Placemark>[].obs;
  Rx<Position> position = Position(
          longitude: 00,
          latitude: 00,
          timestamp: DateTime.now(),
          accuracy: 0,
          altitude: 0,
          heading: 0,
          speed: 0,
          speedAccuracy: 0)
      .obs;

}
