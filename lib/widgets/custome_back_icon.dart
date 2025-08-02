import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color.dart';

class Custome_back_icon extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? icon;
  final VoidCallback? onTap;
  const Custome_back_icon({
    super.key,
    this.width,
    this.onTap,
    this.height,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 44.h,
        width: height ?? 44.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.r),
            border: Border.all(color: appSeColor)
        ),
        child: Center(child: icon ?? Icon(CupertinoIcons.back,),),
      ),
    );
  }
}