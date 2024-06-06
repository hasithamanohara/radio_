import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:radio_app/apis/radio_Api.dart';
import 'package:radio_app/provider/radio_provider.dart';
import 'package:radio_app/widgets/radio_list.dart';
import 'package:volume_controller/volume_controller.dart';

class RadioPlayer extends StatefulWidget {
  const RadioPlayer({super.key});

  @override
  State<RadioPlayer> createState() => _RadioPlayerState();
}

class _RadioPlayerState extends State<RadioPlayer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late VolumeController volumeController;

  late Animation<Offset> radioOffset;
  late Animation<Offset> radioListOffset;

  bool listEnable = false;
  bool isPlaying = true;
  bool isMuted = true;

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

    RadioApi.player.stateStream.listen((event) {
      setState(() {
        isPlaying = event;
      });
    });

    volumeController = VolumeController();
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
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 0, 0, 0), width: 2.0),
                  ),
                  child:
                      Consumer<RadioProvider>(builder: (context, value, child) {
                    return Image.network(
                      value.station.imageUrl,
                      fit: BoxFit.fill,
                    );
                  }),
                ),
                const SizedBox(height: 10),
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
                      icon: Icon(isPlaying ? Icons.stop : Icons.play_arrow),
                      iconSize: 64,
                      color: Colors.white,
                      onPressed: () {
                        setState(() {
                          isPlaying
                              ? RadioApi.player.stop()
                              : RadioApi.player.play();
                          isPlaying = !isPlaying;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(isMuted ? Icons.volume_off : Icons.volume_up),
                      iconSize: 64,
                      color: Colors.white,
                      onPressed: () {
                        if (isMuted) {
                          volumeController.setVolume(0.5);
                        } else {
                          volumeController.muteVolume();
                        }
                        setState(() {
                          isMuted = !isMuted;
                        });
                      },
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
