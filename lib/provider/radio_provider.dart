import 'package:flutter/material.dart';
import 'package:radio_app/models/radio_station.dart';

class RadioProvider with ChangeNotifier {
  final RadioStation initial_radio_station;

  RadioProvider(this.initial_radio_station);

  RadioStation? _station;
  RadioStation get station => _station ?? initial_radio_station;

  void setRadioStation(RadioStation station) {
    _station = station;
    notifyListeners();
  }
}
