import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/widgets/custome_back_icon.dart';
import 'package:newgigr/widgets/custome_text_field.dart';

import '../widgets/custome_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 16.r),
          children: [
            SizedBox(height: 10.h,),
            Align(
                alignment: Alignment.centerLeft,
                child: Custome_back_icon(
                  onTap: (){
                    Navigator.pop(context);
                  },
                )
            ),
            SizedBox(height: 50.h,),
            Text('Forgot Password?',style: TextStyle(
              fontSize: 24.h,
              fontWeight: FontWeight.w600,
            ),),
            Text('Enter your registered email to receive a reset link.',style: TextStyle(
              fontSize: 14.h,
              fontWeight: FontWeight.w400,
              color: textGreyColor
            ),),
            SizedBox(height: 20.h,),
            CustomTextField(
                hintText: 'Enter email..',
                icon: Iconsax.sms,
            ),
            SizedBox(height: 100.h,),
            CustomeButton(
              onTap: (){},
              title: 'Sand Code',
            )
          ],
        ),
      ),
    );
  }
}
