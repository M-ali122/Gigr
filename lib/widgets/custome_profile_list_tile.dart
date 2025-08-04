import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/widgets/custome_back_icon.dart';

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