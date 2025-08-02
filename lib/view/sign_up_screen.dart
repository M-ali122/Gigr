import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/resources/images.dart';

import '../bloc/auth/auth_block.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';
import '../widgets/custome_back_icon.dart';
import '../widgets/custome_button.dart';
import '../widgets/custome_text_field.dart';
import '../widgets/social_media_widget.dart';
import 'home_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _signup() {
    final name = nameController.text.trim();
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    context.read<AuthBloc>().add(SignupRequested(name, email, password));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Sign Up")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              );
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            return ListView(
              children: [
                 Align(
                     alignment: Alignment.centerLeft,
                     child: Custome_back_icon()),
                SizedBox(height: 30.h),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextField(
                        label: "Full Name",
                        hintText: "Enter your name",
                        icon: Icons.person_outline,
                        controller: nameController,
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    Expanded(
                      child: CustomTextField(
                        label: "User Name",
                        hintText: "Enter your user name",
                        icon: Icons.person_outline,
                        controller: emailController,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: "Email Address",
                  hintText: "Enter your email",
                  icon: Icons.email_outlined,
                  controller: emailController,
                ),
                SizedBox(height: 20.h),
                CustomTextField(
                  label: "Password",
                  hintText: "Enter your password",
                  icon: Iconsax.lock,
                  controller: passwordController,
                ),
                SizedBox(height: 20.h),
                state is AuthLoading
                    ? const Center(child: CircularProgressIndicator())
                    : CustomeButton(
                  title: 'Sign Up',
                  onTap: _signup,
                ),
                SizedBox(height: 20.h),
                Row(
                  children: [
                    const Expanded(child: Divider()),
                    Text(
                      '   OR Sign Up with   ',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff6A707C)),
                    ),
                    const Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 10.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: socialMediaWidget(image: facebook, width: double.infinity)),
                    SizedBox(width: 20.w),
                    Expanded(child: socialMediaWidget(image: google, width: double.infinity)),
                  ],
                ),
              ],
            );
          },
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Already have an account? ',
            style: TextStyle(
              color: appPrimaryColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Text(
              'Login Now',
              style: TextStyle(
                color: appSeColor,
                fontSize: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
