import 'package:flutter/material.dart';
import 'package:newgigr/resources/color.dart';

class CustomTextField extends StatelessWidget {
  final String? label;
  final String hintText;
  final IconData icon;
  final bool isPassword;
  final TextEditingController? controller;
  final ValueChanged<String>? onChange;

  const CustomTextField({
    Key? key,
     this.label,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    this.onChange,
     this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label ?? '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: TextField(
            controller: controller,
            obscureText: isPassword,
            onChanged: onChange,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: appPrimaryColor),
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey.shade500),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
            style: const TextStyle(fontSize: 16),
            cursorColor: Colors.deepPurple,
          ),
        ),
      ],
    );
  }
}
