import 'package:flutter/material.dart';
import 'package:flutter_todo_app/services/theme_service.dart';
import 'package:flutter_todo_app/ui/addTask/widget/input_field.dart';
import 'package:flutter_todo_app/utils/responsive_text.dart';
import 'package:flutter_todo_app/utils/textStyle.dart';
import 'package:get/get.dart';

class AddTask extends StatelessWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: _appBar(context),
      body: Container(
        padding: EdgeInsets.only(left: 20, right: 20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextResponsive(
                  sizeText: 4,
                  textStyle: headingStyle,
                  textResponsive: "Add Task"),
              InputField(
                label: "Title",
                hintLabel: "Enter your title",
                textSize: 11,
              ),
              InputField(
                label: "Note",
                hintLabel: "Enter your note",
                textSize: 11,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// this is appbar widget
  _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: context.theme.backgroundColor,
      elevation: 0.0,
      leading: IconButton(
        onPressed: () {
          Get.back();
        },
        icon: Icon(
          Icons.arrow_back_ios,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
      ),
      actions: [
        Icon(
          Icons.person,
          size: 20,
          color: Get.isDarkMode ? Colors.white : Colors.black,
        ),
        SizedBox(
          width: 20,
        ),
      ],
    );
  }
}
