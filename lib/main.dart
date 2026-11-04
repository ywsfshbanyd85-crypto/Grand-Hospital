import 'package:flutter/material.dart'; // دي المكتبة اللي فيها كل الأدوات اللي بنستخدمها في تصميم صفحات فلاتر
import 'package:grand_hospital_app/modules/screens/splash_screen.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen()
    );
  }
}