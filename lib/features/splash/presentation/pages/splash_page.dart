import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/features/home/presentation/pages/home.dart';

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  double _containerHeight = 0.0;

  AudioPlayer player = AudioPlayer();
  final _audioPath = "gameboy_bootup.mp3";

  //;

  @override
  void initState() {
    _containerHeight = 0.0;

    Timer(const Duration(milliseconds: 2000), _changeContainerHeight);
    Timer(const Duration(milliseconds: 4500), _goToHome);

    super.initState();
  }

  void _changeContainerHeight() {
    // callback function
    setState(() {
      _containerHeight = 200.0;
    });

    player.play(AssetSource(_audioPath));
  }

  void _goToHome() {
    // callback function
    Navigator.pushReplacement(
        context, CupertinoPageRoute(builder: (context) => const Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffdc0a2d),
      body: _body(context),
    );
  }

  Widget _body(BuildContext context) {
    return Center(
      child: AnimatedContainer(
        duration: const Duration(seconds: 3),
        alignment: Alignment.center,
        curve: Curves.fastLinearToSlowEaseIn,
        height: _containerHeight,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Text(
              'PoKéDeX',
              style: TextStyle(
                fontSize: 44,
                fontFamily: 'Pokemon Solid',
                foreground: Paint()
                  ..style = PaintingStyle.stroke
                  ..strokeWidth = 8
                  ..color = const Color(0xff3868ab),
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(-7.0, 5.0),
                    blurRadius: 10.0,
                    color: Theme.of(context).shadowColor,
                  ),
                ],
              ),
            ),
            const Text(
              'PoKéDeX',
              style: TextStyle(
                  fontSize: 44,
                  fontFamily: 'Pokemon Solid',
                  color: Color(0xfff5e32e)),
            )
          ],
        ),
      ),
    );
  }
}
