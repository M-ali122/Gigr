// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:iconsax_flutter/iconsax_flutter.dart';
// import 'package:newgigr/widgets/custome_button.dart';
// import 'package:newgigr/widgets/custome_text_field.dart';
// import 'package:newgigr/widgets/user_profile.dart';

// class EditProfileScreen extends StatelessWidget {
//   const EditProfileScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile '),
//       ),
//       body: ListView(
//         padding: EdgeInsets.symmetric(horizontal: 16.w),
//         children: [
//           SizedBox(height: 20.h,),
//           Align(
//             alignment: Alignment.center,
//             child: UserProfile(
//               height: 100.h,
//               width: 100.w,
//             ),
//           ),
//           CustomTextField(
//             hintText: 'Email',
//              icon: Icons.email_outlined
//           ),
//           CustomTextField(
//             hintText: 'Name',
//              icon: Icons.person_outline
//           ),
//           CustomTextField(
//             hintText: 'User Name',
//              icon: Icons.person_outline
//           ),
//           CustomTextField(
//             hintText: 'Address',
//              icon: Icons.person_outline
//           ),
          
//           CustomeButton(
//             title: 'Updated Profile', onTap: (){})
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:newgigr/view/login_screen.dart';
import 'package:newgigr/view/navbar_screen.dart';
import 'package:newgigr/widgets/custome_button.dart';
import 'package:newgigr/widgets/custome_text_field.dart';
import 'package:newgigr/widgets/user_profile.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20.h),
                      Align(
                        alignment: Alignment.center,
                        child: UserProfile(
                          height: 100.h,
                          width: 100.w,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomTextField(
                        hintText: 'Email',
                        icon: Icons.email_outlined,
                      ),
                      CustomTextField(
                        hintText: 'Name',
                        icon: Icons.person_outline,
                      ),
                      CustomTextField(
                        hintText: 'User Name',
                        icon: Icons.person_outline,
                      ),
                      CustomTextField(
                        hintText: 'Address',
                        icon: Icons.person_outline,
                      ),
                      Spacer(), // Push the button to the bottom
                      CustomeButton(
                        title: 'Update Profile',
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => NavBarScreen(),));
                        },
                      ),
                      SizedBox(height: 16.h),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
