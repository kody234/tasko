// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_model1.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TaskAdapter extends TypeAdapter<Task> {
  @override
  final int typeId = 0;

  @override
  Task read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Task(
      name: fields[1] as String,
      id: fields[0] as int?,
      doneTasks: (fields[3] as List?)?.cast<Todo>(),
      containerColor: fields[4] as ContainerColor,
      todos: (fields[2] as List?)?.cast<Todo>(),
    );
  }

  @override
  void write(BinaryWriter writer, Task obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.todos)
      ..writeByte(3)
      ..write(obj.doneTasks)
      ..writeByte(4)
      ..write(obj.containerColor);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TaskAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TodoAdapter extends TypeAdapter<Todo> {
  @override
  final int typeId = 1;

  @override
  Todo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Todo(
      title: fields[0] as String,
      date: fields[2] as String,
    )..isDone = fields[1] as bool;
  }

  @override
  void write(BinaryWriter writer, Todo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.isDone)
      ..writeByte(2)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ContainerColorAdapter extends TypeAdapter<ContainerColor> {
  @override
  final int typeId = 2;

  @override
  ContainerColor read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContainerColor(
      r: fields[0] as int,
      g: fields[1] as int,
      b: fields[2] as int,
      a: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ContainerColor obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.r)
      ..writeByte(1)
      ..write(obj.g)
      ..writeByte(2)
      ..write(obj.b)
      ..writeByte(3)
      ..write(obj.a);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContainerColorAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LightThemeAdapter extends TypeAdapter<LightTheme> {
  @override
  final int typeId = 3;

  @override
  LightTheme read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LightTheme()..light = fields[0] as bool;
  }

  @override
  void write(BinaryWriter writer, LightTheme obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.light);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LightThemeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
