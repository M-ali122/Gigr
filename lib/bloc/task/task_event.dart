import '../../model/my_task_model.dart';

abstract class TaskEvent {}
class LoadTasks extends TaskEvent {}

// task_state.dart
abstract class TaskState {}
class TaskLoading extends TaskState {}
class TaskLoaded extends TaskState {
  final List<TaskModel> tasks;
  TaskLoaded(this.tasks);
}