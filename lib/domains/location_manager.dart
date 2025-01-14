import 'package:swipezone/repositories/models/location.dart';

class LocationManager {
  static final LocationManager instance = LocationManager._internal();

  LocationManager._internal();

  factory LocationManager() {
    return instance;
  }
  List<Location> wantedLocations = [];
  List<Location> locations = [];
  List<Location> unwantedLocations = [];
  Map<Location, bool> filters = {};

  int currentIndex = 0;

  void Iwant() {
    wantedLocations.add(locations[currentIndex]);

    next();
  }

  void Idontwant() {
    unwantedLocations.add(locations[currentIndex]);
    next();
  }

  void next() {
    if (currentIndex != locations.length - 1) {
      currentIndex++;
    }
  }

  void addLocationToWanted(Location newlocation) {
    if (!wantedLocations.contains(newlocation)) {
      wantedLocations.add(newlocation);
    }
  }
}
