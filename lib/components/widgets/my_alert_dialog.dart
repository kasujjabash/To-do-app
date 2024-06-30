import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:todo/controllers/task_controller.dart';

import 'my_text_field.dart';

class MyAlertDialog extends StatelessWidget {
  // final int? taskIndex;
  // final String? initialTitle;
  // final String? initialSubtitle;
  const MyAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskController>(
        init: TaskController(),
        builder: (taskcontrol) {
          //   // Set initial text values if editing
          // if (taskIndex != null) {
          //   taskcontrol.taskTitleController.text = initialTitle!;
          //   taskcontrol.taskSubTitleController.text = initialSubtitle!;
          // }

          return AlertDialog(
            title: const Text("Creat new task"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyTextField(
                  controller: taskcontrol.taskTitleController,
                  hintText: "Task title",
                ),
                const SizedBox(
                  height: 20,
                ),
                MyTextField(
                  controller: taskcontrol.taskSubTitleController,
                  hintText: "Task subtitle",
                ),
              ],
            ),
            //action buttons
            actions: [
              // cancel button
              TextButton(
                  onPressed: taskcontrol.cancelTask,
                  child: const Text("Cancel")),
              //save button
              TextButton(
                  onPressed: taskcontrol.addNewTask, child: const Text("Save")),
            ],
          );
        });
  }
}
