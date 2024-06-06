import 'package:radio_app/models/radio_station.dart';
import 'package:radio_app/utils/radio_stations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesApi {
  static const _key = 'radio_station';
  static Future<RadioStation> getInitialRadioStation() async {
    final prefs = await SharedPreferences.getInstance();

    final stationName = prefs.getString(_key);
    if (stationName == null) {
      return RadioStations.allStations[0];
    }

    return RadioStations.allStations
        .firstWhere((element) => element.name == stationName);
  }

  static Future<void> setStation(RadioStation station) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString(_key, station.name);
  }
}
