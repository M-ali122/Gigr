import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/resources/svg_icons.dart';
import 'package:newgigr/view/edit_profile_screen.dart';
import 'package:newgigr/widgets/custome_back_icon.dart';
import 'package:newgigr/widgets/user_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            Row(
              children: [
                UserProfile(),
                SizedBox(width: 10.w,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MUHAMMAD ALI',style: TextStyle(fontSize: 16.sp,),),
                    Text('Flutter Developer',style: TextStyle(fontSize: 12.sp,color: textGreyColor),),
                  ],
                )
              ],
            ),
              SizedBox(height: 10.h,),
            Divider(),
            SizedBox(height: 40.h,),
            CustomeProfileListTile(
              icon: SvgIcons.person,
              text: 'Profile',
              onTap: (){
                Navigator.push(
                  context,
                   MaterialPageRoute(builder: (context) => EditProfileScreen(),)
                );
              },
            ),
            SizedBox(height: 5.h,),
            CustomeProfileListTile(
              icon: SvgIcons.mytask,
              text: 'My Task',
            ),
            SizedBox(height: 5.h,),
            CustomeProfileListTile(
              icon: SvgIcons.earning,
              text: 'Earning',
            ),      
            SizedBox(height: 5.h,),
            CustomeProfileListTile(
              icon: SvgIcons.setting,
              text: 'Setting',
            ),
            SizedBox(height: 5.h,),
            CustomeProfileListTile(
              icon: SvgIcons.logOut,
              text: 'Log Out',
            ),        
          ],
        ),
      ),
    );
  }
}

class CustomeProfileListTile extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback? onTap;
  const CustomeProfileListTile({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Custome_back_icon(
        icon: SvgPicture.string(icon),
      ),
      title: Text(text,style: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.w600,color: textGreyColor),),
      trailing: Icon(Icons.arrow_forward_ios_rounded,size: 16.sp,color: textGreyColor,),
    );
  }
}