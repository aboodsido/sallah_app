import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sallah_app/Views/Screens/city_screen.dart';
import 'package:sallah_app/constants/colors.dart';

import 'Views/Screens/Auth/forgot_pass_screen.dart';
import 'Views/Screens/Auth/login_screen.dart';
import 'Views/Screens/Auth/signup_screen.dart';
import 'Views/Screens/navigator_screen.dart';
import 'Views/Screens/onboarding_screen.dart';
import 'Views/Screens/splash_screen.dart';
import 'Views/Screens/custom_bottom_navigation_bar.dart';
import 'Views/Screens/welcome_screen.dart';

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
          home: CustomBottomNavigationBar(),
          initialRoute: '/splashScreen',
          routes: {
            '/splashScreen': (context) => const SplashScreen(),
            '/cityScreen': (context) => const CityScreen(),
            '/NavigatorScreen': (context) => AppScreens(),
            '/LoginScreen': (context) => const LoginScreen(),
            '/SignUpScreen': (context) => const SignUpScreen(),
            '/ForgotPassScreen': (context) => const ForgotPassScreen(),
            '/WelcomeScreen': (context) => const WelcomeScreen(),
            '/CustomBottomNavigationBar': (context) =>
                CustomBottomNavigationBar(),
          },
        );
      },
    );
  }
}
