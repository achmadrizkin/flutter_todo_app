import 'package:flutter/material.dart';

class TextResponsive extends StatelessWidget {
  const TextResponsive({
    Key? key,
    required this.sizeText,
    required this.textStyle,
    required this.textResponsive,
  }) : super(key: key);

  /// MediaQuery.of(context).size.width / sizeText
  final int sizeText;
  final TextStyle textStyle;
  final String textResponsive;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width / sizeText,
        child: FittedBox(child: Text(textResponsive, style: textStyle)));
  }
}
