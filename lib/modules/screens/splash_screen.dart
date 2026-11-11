import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'welcome_started.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // هنا بنجهز شاشة البداية وبنحدد الصفحة اللي هتفتح بعدها
    return AnimatedSplashScreen(
      duration: 2000,
      nextScreen: const WelcomeStarted(),
      splashIconSize: double.infinity,
      backgroundColor: Colors.white,
      splashTransition: SplashTransition.fadeTransition,

      // هنا بنصمم محتويات شاشة السبلاش
      splash: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ),

          // هنا بنرتب العناصر ونوزعها جوه الشاشة
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),

              // هنا بنعرض لوجو المستشفى
              Image.asset(
                'images/logo.png',
                width: 180,
              ),

              const SizedBox(height: 24),

              // هنا بنعرض اسم المستشفى
              const Text(
                'Grand Hospital',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF1E2A38),
                ),
              ),

              const SizedBox(height: 8),

              // هنا بنعرض الجملة التعريفية بالمستشفى
              const Text(
                'Expert care. A healthier tomorrow.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const Spacer(),

              // هنا بنعرض الجملة اللي في آخر الشاشة
              const Padding(
                padding: EdgeInsets.only(
                  bottom: 30.0,
                ),
                child: Text(
                  'Your health, in trusted hands',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}