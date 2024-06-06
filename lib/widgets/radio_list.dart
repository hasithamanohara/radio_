import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/apis/shared_preferences_api.dart';
import 'package:radio_app/models/radio_station.dart';
import 'package:radio_app/provider/radio_provider.dart';
import 'package:radio_app/utils/radio_stations.dart';

import '../apis/radio_Api.dart';

class RadioList extends StatefulWidget {
  const RadioList({super.key});

  @override
  State<RadioList> createState() => _RadioListState();
}

class _RadioListState extends State<RadioList> {
  late RadioStation selectedStation;
  late RadioProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    provider = Provider.of<RadioProvider>(context, listen: false);
    selectedStation = provider.station;
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<RadioProvider>(context, listen: false);
    return ListView.builder(
      itemCount: RadioStations.allStations.length,
      itemBuilder: (BuildContext context, int index) {
        final station = RadioStations.allStations[index];
        bool isSelected = station.name == provider.station.name;
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: isSelected
                    ? const LinearGradient(
                        colors: [
                          Colors.purpleAccent,
                          Colors.blueAccent,
                          Color.fromARGB(255, 95, 173, 211)
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null),
            child: ListTile(
                title: Text(
                  station.name,
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
                  ),
                ),
                horizontalTitleGap: 40,
                leading: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(station.imageUrl),
                          fit: BoxFit.fill),
                      borderRadius: BorderRadius.circular(10),
                    )),
                onTap: () async {
                  provider.setRadioStation(station);
                  SharedPreferencesApi.setStation(station);
                  await RadioApi.changeStation(station);
                  setState(() {
                    selectedStation = station;
                  });
                }),
          ),
        );
      },
    );
  }
}
