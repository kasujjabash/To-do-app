import 'package:hive/hive.dart';
// create an adaptor 
part 'task_module.g.dart';

@HiveType(typeId: 0)
class TaskModule {
  //Task titlefield
  @HiveField(0)
  String taskTitle;

  // Task subtitle
  @HiveField(1)
  String taskSubTitle;

  // initialise the class
  TaskModule({required this.taskTitle, required this.taskSubTitle});

  void save() {}
}
