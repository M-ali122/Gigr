import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/resources/images.dart';

class UserProfile extends StatelessWidget {
  final double? height;
  final double? width;
  const UserProfile({
    super.key,
    this.height,
    this.width
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 50.h,
      width: width ?? 50.w,
      decoration: ShapeDecoration(
          shape: CircleBorder(),
          color: appSeColor,
          image: DecorationImage(image: AssetImage(profile),fit: BoxFit.cover)
      ),
    );
  }
}