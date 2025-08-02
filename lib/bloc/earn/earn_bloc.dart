import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/my_task_model.dart';
import 'earn_event.dart';
import 'earn_state.dart';

class EarnBloc extends Bloc<EarnEvent, EarnState> {
  EarnBloc() : super(EarnState()) {
    on<FetchSkills>(_onFetchSkills);
    on<DeleteSkill>(_onDeleteSkill);
  }

  void _onFetchSkills(FetchSkills event, Emitter<EarnState> emit) async {
    emit(state.copyWith(isLoading: true));

    await Future.delayed(const Duration(seconds: 1)); // Simulate API delay

    final mockData = [
      TaskModel(id: 1, title: "Write a Poem", price: "\$30/hr"),
      TaskModel(id: 2, title: "Design a Logo", price: "\$200"),
    ];

    emit(state.copyWith(skills: mockData, isLoading: false));
  }

  void _onDeleteSkill(DeleteSkill event, Emitter<EarnState> emit) {
    final updated = state.skills.where((skill) => skill.id != event.id).toList();
    emit(state.copyWith(skills: updated));
  }
}
