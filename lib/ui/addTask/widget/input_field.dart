import 'package:flutter/material.dart';
import 'package:flutter_todo_app/utils/responsive_text.dart';
import 'package:flutter_todo_app/utils/textStyle.dart';
import 'package:get/get.dart';

class InputField extends StatelessWidget {
  const InputField(
      {Key? key,
      required this.label,
      required this.hintLabel,
      this.textEditingController,
      this.widget,
      required this.textSize})
      : super(key: key);

  final String label;
  final String hintLabel;
  final int textSize;
  final TextEditingController? textEditingController;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextResponsive(
              sizeText: textSize,
              textStyle: titleTextStyle,
              textResponsive: label),
          SizedBox(height: 10),
          Container(
            height: MediaQuery.of(context).size.width / 10,
            width: MediaQuery.of(context).size.width - 20,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1.0),
                borderRadius: BorderRadius.circular(10.0)),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0, right: 14.0),
                    child: TextFormField(
                      readOnly: (widget == null) ? false : true,
                      autofocus: false,
                      cursorColor:
                          Get.isDarkMode ? Colors.grey[100] : Colors.grey[700],
                      controller: textEditingController,
                      style: subTitleTextStyle,
                      decoration: InputDecoration(
                        hintText: hintLabel,
                        hintStyle: subTitleTextStyle,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor, width: 0),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: context.theme.backgroundColor, width: 0),
                        ),
                      ),
                    ),
                  ),
                ),
                (widget == null) ? Container() : Container(child: widget),
              ],
            ),
          )
        ],
      ),
    );
  }
}
