import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/models/hive/task_module.dart';
import '../constants/hive/hive_constants.dart';

class TaskController extends GetxController {
  //controllers
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskSubTitleController = TextEditingController();

  //checkbox
  bool taskCompleted = false;

  // check the checkbox when tapped
  void checkBoxTapped(bool? value, int index) {
    var task = taskModueBox.getAt(index);
    taskCompleted = !taskCompleted;
    task!.save();

    update();
  }

  //save the new task
  void addNewTask() async {
    // checking if the fields are empty
    if (taskTitleController.text.isEmpty ||
        taskSubTitleController.text.isEmpty) {
      Get.snackbar("Error", "Fields can't be empty",
          backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }
    try {
      TaskModule taskmodule = TaskModule(
          taskTitle: taskTitleController.text,
          taskSubTitle: taskSubTitleController.text);

      await taskModueBox.add(taskmodule);

      //Clear the controllers
      taskTitleController.clear();
      taskSubTitleController.clear();

      //poping the dialog box after add the task
      Get.back();

      //shaw snack on successfull addition
      Get.snackbar("Sucess", "Task added sucessfully",
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      //catch the
      Get.snackbar("Error", "$e",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  //cancel task addition
  void cancelTask() {
    //Pop the window on cancel
    Get.back();
  }

  //delete task
  void deleteTask(int index) async {
    await taskModueBox.deleteAt(index);
    update();
  }

  //Edit the existing task
  void editExistingTask(int index, String newTitle, String newSubtile) {
    var task = taskModueBox.getAt(index);

    task?.taskTitle = newTitle;
    task?.taskSubTitle = newSubtile;

   // Clear the controllers
    taskTitleController.clear();
    taskSubTitleController.clear();

    // Pop the dialog box after updating the task
    Get.back();

    // Show a snack on successful update
    Get.snackbar("Success", "Task updated successfully",
        backgroundColor: Colors.green, colorText: Colors.white);
    update();
  }
}
