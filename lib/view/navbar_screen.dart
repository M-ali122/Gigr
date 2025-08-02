import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newgigr/view/earn_screen.dart';
import 'package:newgigr/view/post_screen.dart';
import 'package:newgigr/view/profile.dart';

import '../bloc/nabbar/nav_bloc.dart';
import '../bloc/nabbar/nav_state.dart';
import '../widgets/custome_nav_bar.dart';
import 'home_screen.dart';
import 'my_task_screen.dart';

class NavBarScreen extends StatelessWidget {
  const NavBarScreen({super.key});

  final List<Widget> _screens = const [
    HomeScreen(),
    PostScreen(),
    MyTasksScreen(),
    Profile(),

  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        return Scaffold(
          body: _screens[state.selectedIndex], // ✅ actual screen
          bottomNavigationBar: const CustomBottomNav(), // ✅ this shows bottom nav bar
        );
      },
    );
  }
}
