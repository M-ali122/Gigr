

import '../../model/my_task_model.dart';

class EarnState {
  final List<TaskModel> skills;
  final bool isLoading;

  EarnState({this.skills = const [], this.isLoading = false});

  EarnState copyWith({
    List<TaskModel>? skills,
    bool? isLoading,
  }) {
    return EarnState(
      skills: skills ?? this.skills,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
