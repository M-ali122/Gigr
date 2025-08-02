import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newgigr/bloc/task/task_event.dart';

import '../../model/my_task_model.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskLoading()) {
    on<LoadTasks>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1));
      emit(TaskLoaded([
        TaskModel(title: "Translate Paragraph", subtitle: "Posted 3 h", trailingInfo: "3d", tag: "Delivery on",price: 'Price \$20'),
        TaskModel(title: "Birthday Greeting", subtitle: "Delivery in 6 h", trailingInfo: "12d", tag: "Delenj",price: 'Price \$40'),
        TaskModel(title: "Thumbnail Design", subtitle: "Posted 12 d", trailingInfo: "\$ 200", tag: "", completed: true,price: ' '),
      ]));
    });
  }
}
