import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/constants/hive/hive_constants.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/models/hive/task_module.dart';
import 'package:todo/screens/calender.dart';

import '../components/tiles/task_tile.dart';
import '../components/widgets/my_alert_dialog.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TaskController taskController = TaskController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Good morning"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const MyAlertDialog(),
                    );
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Calender(),
                        ),
                      );
                    },
                    child: const Icon(Icons.calendar_month_outlined)),
              ],
            ),
          ),
        ],
      ),
      body: GetBuilder<TaskController>(
        init: TaskController(),
        builder: (taskControl) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 25),
                const Text(
                  "Howdy, Here is \nyour Task for today",
                  style: TextStyle(fontSize: 30),
                ),
                const SizedBox(height: 20),
                Expanded(
                  child: ValueListenableBuilder(
                    valueListenable: taskModueBox.listenable(),
                    builder: (context, box, widget) {
                      List<TaskModule> taskList = box.values.toList();

                      return taskList.isEmpty
                          ? Expanded(
                              child: Center(
                                child: Column(
                                  // crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      "Lets get started",
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) =>
                                              const MyAlertDialog(),
                                        );
                                      },
                                      child: const Text(
                                        "Create task",
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: taskList.length,
                              itemBuilder: (context, index) {
                                TaskModule task = taskList[index];

                                //return the task tile
                                return TaskTile(
                                  editTapped: (p0) {},
                                  deleteTapped: (contex) {
                                    taskControl.deleteTask(
                                        index); // deleting a specific task
                                  },
                                  onChanged: (value) =>
                                      taskControl.checkBoxTapped(value, index),
                                  value: taskControl.taskCompleted,
                                  title: task.taskTitle,
                                  subtitle: task.taskSubTitle,
                                );
                              },
                            );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
