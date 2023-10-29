import 'package:flutter/material.dart';

class BasicLayout extends StatefulWidget {
  final Widget body;

  const BasicLayout({Key? key, required this.body}) : super(key: key);

  @override
  State<BasicLayout> createState() => _BasicLayoutState();
}

class _BasicLayoutState extends State<BasicLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
        appBar: AppBar(
            shadowColor: Theme
                .of(context)
                .shadowColor,
            backgroundColor: Theme
                .of(context)
                .backgroundColor,
            title: _appBarTitle(context)


        ),
        body: widget.body
    );
  }

  Widget _appBarTitle(BuildContext context) {
    const double _fontSize = 24.0;

    return Stack(
      children: [
        Text(
          'PoKéDeX',
          style: TextStyle(
              fontSize: _fontSize,
              fontFamily: 'Pokemon Solid',
              shadows: <Shadow>[
                Shadow(
                  offset: const Offset(-7.0, 5.0),
                  blurRadius: 10.0,
                  color: Theme
                      .of(context)
                      .shadowColor,
                ),
              ],
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 8
                ..color = const Color(0xff3868ab)),
        ),
        const Text(
          'PoKéDeX',
          style: TextStyle(
              fontSize: _fontSize,
              fontFamily: 'Pokemon Solid',
              color: Color(0xfff5e32e)),
        ),
      ],
    );
  }

}



