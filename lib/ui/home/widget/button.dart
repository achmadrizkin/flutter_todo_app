import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utils/color.dart';
import 'package:flutter_todo_app/utils/responsive_text.dart';
import 'package:flutter_todo_app/utils/textStyle.dart';

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.label, required this.onTap})
      : super(key: key);

  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width / 4,
        height: MediaQuery.of(context).size.height / 18,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: primaryClr),
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10),
            child: TextResponsive(
          sizeText: 10,
          textResponsive: label,
          textStyle: normalBoldText,
        )),
      ),
    );
  }
}
