import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newgigr/view/navbar_screen.dart';
import '../bloc/splash/splash_bloc.dart';
import '../bloc/splash/splash_event.dart';
import '../bloc/splash/splash_state.dart';
import '../resources/color.dart';
import '../widgets/custome_nav_bar.dart';
import 'login_screen.dart';
import 'home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc(authRepository: context.read())..add(AppStarted()),
      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashAuthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const NavBarScreen()),
            );
          } else if (state is SplashUnauthenticated) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const LoginScreen()),
            );
          }
        },
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: mainGradientColor
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/app_logo/app_icon.png'),
                Text('GIGR',style: TextStyle(
                  color: Colors.white,
                  fontSize: 40
                ),),
                Text('GIGR — Where Skills Meet Speed.',style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,

                ),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
