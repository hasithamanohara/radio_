import 'package:flutter/material.dart';
import 'package:radio_app/apis/radio_Api.dart';
import 'package:radio_app/widgets/gradient_background.dart';
import 'package:radio_app/widgets/radio_player.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GradientBackground(
      child: FutureBuilder(
          future: RadioApi.initPlayer(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                ),
              );
            }
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[RadioPlayer()],
              ),
            );
          }),
    ));
  }
}
