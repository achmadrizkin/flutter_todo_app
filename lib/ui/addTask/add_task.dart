// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/ui/addTask/widget/input_field.dart';
import 'package:flutter_todo_app/utils/responsive_text.dart';
import 'package:flutter_todo_app/utils/textStyle.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime _selectedDate = DateTime.now();
  String _startTime = DateFormat("hh:mm a").format(DateTime.now()).toString();
  String _endTime = DateFormat("hh:mm a").format(DateTime.now()).toString();

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
              InputField(
                label: "Date",
                hintLabel: DateFormat.yMd().format(_selectedDate),
                textSize: 11,
                widget: IconButton(
                  onPressed: () {
                    // show calendar
                    _getDateFromUser();
                  },
                  icon: Icon(Icons.calendar_today_outlined, color: Colors.grey),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: InputField(
                      label: "Start Time",
                      hintLabel: _startTime,
                      textSize: 6,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () => _getTimeFromUser(isStartTime: true),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InputField(
                      label: "End Time",
                      hintLabel: _endTime,
                      textSize: 6,
                      widget: IconButton(
                        icon: Icon(
                          Icons.access_time_rounded,
                          color: Colors.grey,
                        ),
                        onPressed: () => _getTimeFromUser(isStartTime: false),
                      ),
                    ),
                  ),
                ],
              )
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

  _getDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2021),
        lastDate: DateTime(2121));

    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print("Something wrong");
    }
  }

  _getTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formattedTime = await pickedTime.format(context);

    if (pickedTime == null) {
      print("Time cancelled");
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formattedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formattedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
        context: context,
        initialTime: TimeOfDay(
            hour: int.parse(_startTime.split(":")[0]),
            minute: int.parse(_startTime.split(":")[1].split(" ")[0])),
        initialEntryMode: TimePickerEntryMode.input);
  }
}
