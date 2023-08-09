import 'package:flutter/material.dart';
import 'package:sallah_app/Views/Screens/custom_bottom_navigation_bar.dart';
import 'package:sallah_app/Views/Screens/onboarding_screen.dart';

import '../../app_preferences.dart';
import 'Auth/login_screen.dart';

class AppScreens extends StatelessWidget {
  const AppScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: AppPreferences.isLoggedIn,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data == true) {
            return CustomBottomNavigationBar();
          } else {
            return FutureBuilder<bool>(
              future: AppPreferences.hasSeenOnboarding,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  if (snapshot.data == true) {
                    return const LoginScreen();
                  } else {
                    return PageViewScreen(
                      onOnboardingFinished: () {
                        AppPreferences.markOnboardingSeen();
                        AppPreferences.markLoggedIn();
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomBottomNavigationBar(),
                          ),
                        );
                      },
                    );
                  }
                }
              },
            );
          }
        }
      },
    );
  }
}

// Define HomeScreen similarly
