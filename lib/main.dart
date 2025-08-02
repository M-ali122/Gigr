import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:newgigr/repositories/auth_repositore.dart';
import 'package:newgigr/view/home_screen.dart';
import 'package:newgigr/view/splash_screen.dart';
import 'bloc/auth/auth_block.dart';
import 'bloc/nabbar/nav_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (_) => AuthRepository(),
      child: MultiBlocProvider(
        // create: (context) => AuthBloc(authRepository: context.read<AuthRepository>()),
        providers: [
          BlocProvider<AuthBloc>(
            create: (context) =>
                AuthBloc(authRepository: context.read<AuthRepository>()),
          ),
          BlocProvider<NavBloc>(
            create: (_) => NavBloc(),
          ),
        ],
        child: ScreenUtilInit(
          designSize: const Size(402, 874), // ✅ Set your base design resolution
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Gigr',
              theme: ThemeData(
                fontFamily: 'RobotoFlex',
                scaffoldBackgroundColor: Colors.white,
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
                useMaterial3: true,
                textTheme: TextTheme(
                  headlineLarge: TextStyle(
                    fontSize: 24.sp, // 👈 Use .sp for responsive text
                    fontWeight: FontWeight.bold,
                  ),
                  bodyMedium: TextStyle(
                    fontSize: 16.sp,
                  ),
                ),
              ),
              home: const SplashScreen(),
            );
          },
        ),
      ),
    );
  }
}
