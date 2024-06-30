// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_module.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskModuleAdapter extends TypeAdapter<TaskModule> {
  @override
  final int typeId = 0;

  @override
  TaskModule read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TaskModule(
      taskTitle: fields[0] as String,
      taskSubTitle: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TaskModule obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.taskTitle)
      ..writeByte(1)
      ..write(obj.taskSubTitle);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskModuleAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
