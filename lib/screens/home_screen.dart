import 'package:flutter/material.dart';
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
    return const Scaffold(
        body: GradientBackground(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[RadioPlayer()],
        ),
      ),
    ));
  }
}
