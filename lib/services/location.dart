import 'package:geolocator/geolocator.dart';

class Location {

  double latitude, longitude;
  
  Future<void> getCurrentLocation() async {
    try {
      Position position = await GeolocatorPlatform.instance.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      print(position);
      latitude=position.latitude;
      longitude=position.longitude;
    } catch (e) {
      print(e);
      latitude=0;
      longitude=0;
    }
  }
  
}
