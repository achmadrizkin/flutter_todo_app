// ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field

import 'package:flutter/material.dart';
import 'package:flutter_todo_app/models/task.dart';
import 'package:flutter_todo_app/services/task_controller.dart';
import 'package:flutter_todo_app/ui/addTask/widget/input_field.dart';
import 'package:flutter_todo_app/ui/home/widget/button.dart';
import 'package:flutter_todo_app/utils/color.dart';
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
  int _selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20, 25, 30];

  String _selectedRepeat = "None";
  List<String> repeatList = ["None", "Daily", "Weekly", "Monthly"];

  int _selectedColor = 0;

  TextEditingController _titleTextEditingController = TextEditingController();
  TextEditingController _noteTextEditingController = TextEditingController();

  TaskController _taskController = Get.put(TaskController());

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
                textEditingController: _titleTextEditingController,
              ),
              InputField(
                label: "Note",
                hintLabel: "Enter your note",
                textSize: 11,
                textEditingController: _noteTextEditingController,
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
              ),
              InputField(
                label: "Remind",
                hintLabel: "$_selectedRemind minutes early",
                textSize: 7,
                widget: DropdownButton(
                  style: subTitleTextStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ),
              ),
              InputField(
                label: "Repeat",
                hintLabel: _selectedRepeat,
                textSize: 7,
                widget: DropdownButton(
                  style: subTitleTextStyle,
                  underline: Container(
                    height: 0,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedRepeat = newValue!;
                    });
                  },
                  items:
                      repeatList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  icon: Icon(Icons.keyboard_arrow_down, color: Colors.grey),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextResponsive(
                          sizeText: 9,
                          textStyle: titleTextStyle,
                          textResponsive: "Color"),
                      Wrap(
                        children: List<Widget>.generate(3, (int index) {
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedColor = index;
                              });
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 8.0, top: 5),
                              child: CircleAvatar(
                                radius: 15,
                                backgroundColor: index == 0
                                    ? primaryClr
                                    : index == 1
                                        ? pinkClr
                                        : yellowClr,
                                child: _selectedColor == index
                                    ? Icon(Icons.done, color: Colors.white)
                                    : Container(),
                              ),
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  MyButton(
                      label: "Create Task",
                      onTap: () {
                        validateData();
                      })
                ],
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

  validateData() {
    if (_titleTextEditingController.text.isNotEmpty &&
        _noteTextEditingController.text.isNotEmpty) {
      // submit data to database
      _addTaskToDB();
      Get.back();
    } else if (_titleTextEditingController.text.isEmpty ||
        _noteTextEditingController.text.isEmpty) {
      print("cannot be empty");
      Get.snackbar("Required", "All fields are required !",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.white,
          colorText: Get.isDarkMode ? Colors.black : Colors.black,
          icon: Icon(
            Icons.warning,
            color: Get.isDarkMode ? Colors.black : Colors.black,
          ));
    }
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

  void _addTaskToDB() async {
    // pass data -> model -> database
    int value = await _taskController.addTask(
      task: Task(
        note: _noteTextEditingController.text,
        title: _titleTextEditingController.text,
        date: DateFormat.yMd().format(_selectedDate),
        startTime: _startTime,
        endTime: _endTime,
        remind: _selectedRemind,
        repeat: _selectedRepeat,
        color: _selectedColor,
        isCompleted: 0,
      ),
    );
    print("My id is $value");
  }
}
