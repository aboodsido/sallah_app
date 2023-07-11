import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sallah_app/Views/Screens/city_screen.dart';
import 'package:sallah_app/Views/Screens/signup_screen.dart';
import 'package:sallah_app/constants/colors.dart';

import 'Views/Screens/forgot_pass_screen.dart';
import 'Views/Screens/login_screen.dart';
import 'Views/Screens/pageview_screen.dart';
import 'Views/Screens/splash_screen.dart';

void main() {
  runApp(const SallahApp());
}

class SallahApp extends StatelessWidget {
  const SallahApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Sallah App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: kMainColor,
              primaryIconTheme: IconThemeData(color: kMainColor)),
          initialRoute: '/',
          routes: {
            '/': (context) => const SplashScreen(),
            '/cityScreen': (context) => CityScreen(),
            '/AdsScreen': (context) => const PageViewScreen(),
            '/LoginScreen': (context) => const LoginScreen(),
            '/SignUpScreen': (context) => const SignUpScreen(),
            '/ForgotPassScreen': (context) => const ForgotPassScreen(),
          },
        );
      },
    );
  }
}
