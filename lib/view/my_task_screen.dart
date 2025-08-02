import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/task/task_bloc.dart';
import '../bloc/task/task_event.dart';
import '../bloc/task/task_state.dart';
import '../model/my_task_model.dart';
import '../resources/color.dart';
import '../widgets/custome_button.dart';
import '../widgets/my_task_card.dart';

class MyTasksScreen extends StatelessWidget {
  const MyTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TaskBloc()..add(LoadTasks()),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            titleSpacing: 40.w,
            backgroundColor: appPrimaryColor,
            title: Text('My Tasks',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 20.sp
            ),),
            bottom:  TabBar(
              automaticIndicatorColorAdjustment: false,

              tabs: [
                Tab(text: 'Active'),
                Tab(text: 'Completed'),
              ],
              labelColor: appSeColor,
              unselectedLabelColor: Colors.grey,
              indicatorColor: appSeColor,
            ),
          ),
          body: BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              if (state is TaskLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is TaskLoaded) {
                final activeTasks = state.tasks.where((task) => !task.completed!).toList();
                final completedTasks = state.tasks.where((task) => task.completed!).toList();

                return TabBarView(
                  children: [
                    _buildTaskList(activeTasks),
                    _buildTaskList(completedTasks),
                  ],
                );
              } else {
                return const Center(child: Text("Something went wrong"));
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildTaskList(List<TaskModel> tasks) {
    return ListView.builder(
      itemCount: tasks.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final task = tasks[index];
        return TaskCard(task: task);
      },
    );
  }
}