import 'package:flutter/material.dart';

import '../resources/color.dart';

class CustomeButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Color? color;
  final VoidCallback onTap;
  const CustomeButton({
    super.key,
    required this.title,
    required this.onTap,
    this.color,
    this.width,
    this.height
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? 56,
        width: width ?? double.infinity,
        decoration: BoxDecoration(
          color: color ?? appPrimaryColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(title,style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),),
        ),
      ),
    );
  }
}