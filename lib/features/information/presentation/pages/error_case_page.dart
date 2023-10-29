import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

import '../../../../shared/error_message.dart';

class ErrorCasePage extends StatelessWidget {
  const ErrorCasePage({Key? key}) : super(key: key);

  final double _padding = 16.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(_padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Flexible(flex: 2, child: _picture(context)),
              Flexible(flex: 2, child: _overview())
            ],
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }

  Widget _picture(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Material(
        clipBehavior: Clip.antiAlias,
        shadowColor: Theme.of(context).shadowColor,
        elevation: 6.0,
        shape: BeveledRectangleBorder(
            side: BorderSide(color: Theme.of(context).cardColor, width: 4.0),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15.0),
              // topRight: Radius.circular(20.0)
            )),
        child: Container(
          color: Colors.white,
          alignment: Alignment.center,
          child: const Center(
              child: Image(
                  image: Svg(
            'assets/pokeball.svg',
            source: SvgSource.asset,
          ))),
        ),
      ),
    );
  }

  Widget _overview() {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _pokemonName(),
          const SizedBox(
            height: 16.0,
          ),
          _statement()
        ],
      ),
    );
  }

  Widget _pokemonName() {
    const TextStyle _textStyle = TextStyle(
        fontSize: 24.0,
        fontFamily: 'Antique',
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Colors.white);

    return const ErrorMessage(textColor: Colors.white, fontSize: 24.0);
  }

  Widget _statement() {
    const TextStyle _textStyle = TextStyle(
        fontSize: 16.0,
        fontFamily: 'Antique',
        fontWeight: FontWeight.bold,
        letterSpacing: 2.0,
        color: Colors.white);

    String _statement = "Humm... What can I say about this one...";

    return Text(
      _statement,
      style: _textStyle,
    );
  }
}
