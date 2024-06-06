import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/apis/shared_preferences_api.dart';
import 'package:radio_app/models/radio_station.dart';
import 'package:radio_app/screens/home_screen.dart';

import 'provider/radio_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final radioStation = await SharedPreferencesApi.getInitialRadioStation();
  runApp(RadioApp(
    initialRadioStation: radioStation,
  ));
}

class RadioApp extends StatelessWidget {
  final RadioStation initialRadioStation;
  const RadioApp({super.key, required this.initialRadioStation});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RadioProvider(initialRadioStation),
        ),
      ],
      child: MaterialApp(
        title: 'Radio',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
