import 'package:flutter/material.dart';
import 'package:radio_app/utils/radio_stations.dart';

class RadioList extends StatelessWidget {
  const RadioList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: RadioStations.allStations.length,
      itemBuilder: (BuildContext context, int index) {
        final stattion = RadioStations.allStations[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            title: Text(stattion.name),
            horizontalTitleGap: 40,
            leading: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(stattion.imageUrl), fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(10),
                )),
            onTap: () {
              Navigator.pushNamed(context, '/radio', arguments: stattion);
            },
          ),
        );
      },
    );
  }
}
