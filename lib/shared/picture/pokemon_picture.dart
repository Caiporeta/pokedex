import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class PokemonPicture extends StatelessWidget {
  final double height;
  final String url;

  const PokemonPicture({Key? key, required this.height, required this.url})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Image(
          image: Svg(
        url,
        source: SvgSource.network,
      )),
    );
  }
}
