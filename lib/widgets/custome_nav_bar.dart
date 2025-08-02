import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/resources/svg_icons.dart';

import '../bloc/nabbar/nav_bloc.dart';
import '../bloc/nabbar/nav_event.dart';
import '../bloc/nabbar/nav_state.dart';

class CustomBottomNav extends StatelessWidget {
  const CustomBottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBloc, NavState>(
      builder: (context, state) {
        final currentIndex = state.selectedIndex;

        // return BottomNavigationBar(
        //   backgroundColor: Colors.red,
        //   currentIndex: currentIndex,
        //   onTap: (index) => context.read<NavBloc>().add(NavItemSelected(index)),
        //   type: BottomNavigationBarType.fixed,
        //   selectedItemColor: Colors.blue,
        //   unselectedItemColor: Colors.grey,
        //   items: [
        //     _buildBarItem(SvgIcons.homeIcon, "Home", 0, currentIndex),
        //     _buildBarItem(SvgIcons.post, "Profile", 1, currentIndex),
        //     _buildBarItem(SvgIcons.mytask, "Settings", 2, currentIndex),
        //   ],
        // );
        return Padding(
          padding:  EdgeInsets.all(20.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.r),
                topRight: Radius.circular(50.r),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: BottomNavigationBar(
                backgroundColor: appPrimaryColor,
                currentIndex: currentIndex,
                onTap: (index) =>
                    context.read<NavBloc>().add(NavItemSelected(index)),
                type: BottomNavigationBarType.fixed,
                selectedItemColor: appSeColor,
                unselectedItemColor: Colors.grey,
                items: [
                  _buildBarItem(SvgIcons.homeIcon, "Home", 0, currentIndex),
                  _buildBarItem(SvgIcons.post, "Post", 1, currentIndex),
                  _buildBarItem(SvgIcons.mytask, "My Task", 2, currentIndex),
                  _buildBarItem(SvgIcons.person, "Profile", 3, currentIndex),
                ],
              ),
            ),
          ),
        );

      },
    );
  }

  BottomNavigationBarItem _buildBarItem(
      String iconPath,
      String label,
      int index,
      int selectedIndex,
      ) {
    return BottomNavigationBarItem(
      icon: SvgPicture.string(
        iconPath,
        color: index == selectedIndex ? appSeColor : Colors.grey,
        height: 24,
        width: 24,
      ),
      label: label,
    );
  }
}
