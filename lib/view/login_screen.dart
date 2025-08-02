import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newgigr/resources/color.dart';
import 'package:newgigr/resources/images.dart';
import 'package:newgigr/view/navbar_screen.dart';
import 'package:newgigr/view/sign_up_screen.dart';

import '../bloc/auth/auth_block.dart';
import '../bloc/auth/auth_event.dart';
import '../bloc/auth/auth_state.dart';
import '../widgets/custome_back_icon.dart';
import '../widgets/custome_button.dart';
import '../widgets/custome_text_field.dart';
import '../widgets/social_media_widget.dart';
import 'forgot_password_screen.dart';
import 'home_screen.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void _login() {
    final email = emailController.text;
    final password = passwordController.text;
    context.read<AuthBloc>().add(LoginRequested(email, password));
    print('check');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const NavBarScreen()),
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
                SizedBox(height: 100.h,),
                CustomTextField(
                  label: "Email Address",
                  hintText: "Enter your email",
                  icon: Icons.email_outlined,
                  controller: emailController,
                ),
                SizedBox(height: 20.h,),
                CustomTextField(
                  label: "Password",
                  hintText: "Enter your email",
                  icon: Iconsax.lock,
                  controller: passwordController,
                ),
                SizedBox(height: 10.h,),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                     onTap: (){
                       print('check print before');
                       Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPasswordScreen(),));
                       print('check print');
                     },
                    child: Text('Forgot Password?',
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6A707C)
                    ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h),
                state is AuthLoading
                    ? Center(child: const CircularProgressIndicator())
                    : CustomeButton(
                  title: 'Login',
                  onTap: _login,
                ),
                SizedBox(height: 20.h,),
                Row(
                  children: [
                    Expanded(child: Divider()),
                    Text('   OR Login   ',
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff6A707C)
                      ),
                    ),
                    Expanded(child: Divider()),
                  ],
                ),
                SizedBox(height: 10.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(child: socialMediaWidget(image: facebook,width: double.infinity,)),
                    SizedBox(width: 20.w,),
                    Expanded(child: socialMediaWidget(image: google,width: double.infinity,)),
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
          Text('Don’t have an account? ',style: TextStyle(
            color: appPrimaryColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w600,

          ),),
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => SignupScreen(),));
            },
            child: Text('Register Now',style: TextStyle(
              color: appSeColor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w800,

            ),),
          ),
        ],
      ),
    );
  }
}




