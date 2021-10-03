import 'package:flutter/material.dart';
import 'package:flutter_todo_app/ui/addTask/add_task.dart';
import 'package:flutter_todo_app/ui/home/widget/button.dart';
import 'package:flutter_todo_app/utils/responsive_text.dart';
import 'package:flutter_todo_app/utils/textStyle.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskBar extends StatelessWidget {
  const TaskBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextResponsive(
                    sizeText: 4,
                    textStyle: subHeadingStyle,
                    textResponsive:
                        DateFormat.yMMMd().format(DateTime.now())),
                TextResponsive(
                    sizeText: 6,
                    textStyle: headingStyle,
                    textResponsive: "Today"),
              ],
            ),
          ),
          MyButton(label: "+ Add Task", onTap: () => Get.to(AddTask())),
        ],
      ),
    );
  }
}
