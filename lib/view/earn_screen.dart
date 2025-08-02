import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../bloc/earn/earn_bloc.dart';
import '../bloc/earn/earn_event.dart';
import '../bloc/earn/earn_state.dart';
import '../resources/color.dart';

class EarnScreen extends StatelessWidget {
  const EarnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EarnBloc()..add(FetchSkills()),
      child: BlocBuilder<EarnBloc, EarnState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: const Text('Earn With Skill', style: TextStyle(color: Colors.black)),
              // centerTitle: true,
              elevation: 0,
            ),
            body: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: appPrimaryColor),
                    ),
                    child: const Center(
                      child: Text("List Your Skill", style: TextStyle(fontWeight: FontWeight.w600)),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  state.isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : Expanded(
                    child: ListView.separated(
                      itemCount: state.skills.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        final skill = state.skills[index];
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(skill.title ?? 'check',
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, fontSize: 16)),
                                    Text(skill.price ?? '2', style: const TextStyle(fontSize: 14)),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  context.read<EarnBloc>().add(DeleteSkill(skill.id ?? 0));
                                },
                                child: Text(
                                  skill.title!.contains('Poem') ? 'Edit' : 'Delete',
                                  style: TextStyle(color: appPrimaryColor),
                                ),
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
