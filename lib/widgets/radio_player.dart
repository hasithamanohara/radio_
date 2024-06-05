import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:radio_app/widgets/radio_list.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({super.key});

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> radioOffset;
  late Animation<Offset> radioListOffset;
  bool listEnable = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 01));

    radioListOffset = Tween(begin: const Offset(0, 1.0), end: Offset.zero)
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeOut));

    radioOffset = Tween(begin: const Offset(0, 0.3), end: const Offset(0, 0.0))
        .animate(CurvedAnimation(
            parent: animationController, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Expanded(
          child: SlideTransition(
            position: radioOffset,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Color.fromARGB(255, 2, 238, 254),
                        Color.fromARGB(255, 127, 247, 84),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.list),
                      iconSize: 64,
                      onPressed: () {
                        setState(() {
                          listEnable = !listEnable;
                        });
                        switch (animationController.status) {
                          case AnimationStatus.dismissed:
                            animationController.forward();
                            break;
                          case AnimationStatus.completed:
                            animationController.reverse();
                          default:
                        }
                      },
                      color: listEnable ? Colors.amber : Colors.white,
                    ),
                    IconButton(
                      icon: const Icon(Icons.play_arrow),
                      iconSize: 64,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.volume_down),
                      iconSize: 64,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SlideTransition(
          position: radioListOffset,
          child: Container(
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Radio Stations',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Icon(Icons.favorite),
                    ],
                  ),
                  const Divider(
                    color: Colors.black,
                    thickness: 2,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Expanded(
                      child: Container(height: 300, child: const RadioList())),
                ],
              )),
        ),
      ]),
    );
  }
}
