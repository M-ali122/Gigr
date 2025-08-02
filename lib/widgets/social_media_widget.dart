import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../resources/color.dart';
import '../resources/images.dart';

class socialMediaWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final String image;
  const socialMediaWidget({
    super.key,
    this.height,
    this.width,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 112.w,
      height: height ?? 60.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(color: appSeColor)
      ),
      child: Center(
        child: Image.asset(image,height: 28.h,width: 28.w,),
      ),
    );
  }
}