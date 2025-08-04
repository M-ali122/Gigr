import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/resources/svg_icons.dart';
import 'package:newgigr/view/about_us.dart';
import 'package:newgigr/view/terms_condition.dart';
import 'package:newgigr/view/change_password_screen.dart';
import 'package:newgigr/view/privacy_policy.dart';
import 'package:newgigr/widgets/custome_profile_list_tile.dart';
import 'package:newgigr/widgets/user_profile.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

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
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'MUHAMMAD ALI',
                      style: TextStyle(
                        fontSize: 16.sp,
                      ),
                    ),
                    Text(
                      'Flutter Developer',
                      style: TextStyle(fontSize: 12.sp, color: textGreyColor),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Divider(),
            CustomeProfileListTile(
              icon: SvgIcons.lock,
              text: 'Change Password',
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChangePasswordScreen(),
                    ));
              },
            ),
            CustomeProfileListTile(
              icon: SvgIcons.privacy,
              text: 'Privacy Policy',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PrivacyPolicyScreen()),
                );
              },
            ),
            CustomeProfileListTile(
              icon: SvgIcons.condition,
              text: 'Terms & Conditions',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const TermsConditionsScreen()),
                );
              },
            ),
            CustomeProfileListTile(
              icon: SvgIcons.aboutUs,
              text: 'About Us',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const AboutUsScreen()),
                );
              },
            ),
            // CustomeProfileListTile(
            //   icon: SvgIcons.setting,
            //   text: 'Rate Us',
            // ),
            CustomeProfileListTile(
              icon: SvgIcons.delete,
              text: 'Account Delete',
            ),
          ],
        ),
      ),
    );
  }
}
