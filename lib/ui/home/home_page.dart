// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, prefer_const_constructors

import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todo_app/services/notification_services.dart';
import 'package:flutter_todo_app/services/theme_service.dart';
import 'package:flutter_todo_app/ui/home/widget/date_bar.dart';
import 'package:flutter_todo_app/ui/home/widget/task_bar.dart';
import 'package:flutter_todo_app/utils/color.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  DateTime _selectedDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
    notifyHelper.requestIOSPermissions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TaskBar(),
            SizedBox(
              height: 20,
            ),
            DateBar(
              selectedDate: _selectedDate,
            ),
          ],
        ),
      ),
    );
  }

  /// this is appbar widget
  _appBar() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: context.theme.backgroundColor,
      leading: IconButton(
        onPressed: () {
          ThemeService().switchTheme();
          // display notifications
          notifyHelper.displayNotification(
            title: "Theme Changed",
            body:
                Get.isDarkMode ? "Activated Dark Mode" : "Activated Light Mode",
          );

          notifyHelper.scheduledNotification();
        },
        icon: Icon(
          Get.isDarkMode ? Icons.light_mode : Icons.nightlight_round,
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
