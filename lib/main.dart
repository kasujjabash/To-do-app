import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/constants/hive/hive_constants.dart';
import 'package:todo/models/hive/task_module.dart';

import 'screens/home.dart';

Future<void> main() async {
  await Hive.initFlutter(); //Initialise flutter at the beginning
  Hive.registerAdapter<TaskModule>(
      TaskModuleAdapter()); //registering the the module with an adaptor
  taskModueBox = await Hive.openBox('tasks'); //open the box to work with it
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
