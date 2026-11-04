import 'package:flutter/material.dart'; // دي المكتبة اللي فيها كل الأدوات اللي بنستخدمها في تصميم صفحات فلاتر

import 'package:animated_splash_screen/animated_splash_screen.dart'; // دي المكتبة اللي بتخلينا نعمل شاشة بداية فيها حركة وانتقال

import 'welcome_started.dart'; // هنا بنستدعي ملف الصفحة اللي هتفتح بعد ما شاشة السبلاش تخلص

class SplashScreen extends StatelessWidget {
  // ده الكلاس المسؤول عن شاشة السبلاش اللي بتظهر أول ما التطبيق يفتح

  const SplashScreen({super.key}); // ده الكونستراكتور بتاع الشاشة

  @override // دي بنستخدمها عشان نعيد تعريف الدالة الموجودة في الكلاس الأساسي

  Widget build(BuildContext context) {
    // دي الدالة اللي بنكتب جواها شكل الشاشة والعناصر اللي هتظهر فيها

    return AnimatedSplashScreen(
      // هنا بنعمل شاشة سبلاش فيها حركة وانتقال للصفحة اللي بعدها

      duration: 2000, // هنا بنحدد إن شاشة السبلاش تفضل ظاهرة لمدة ثانيتين

      nextScreen: const WelcomeStarted(), // دي الصفحة اللي هتفتح بعد ما مدة السبلاش تخلص

      splashIconSize: double.infinity, // هنا بنخلي مساحة السبلاش تاخد حجم الشاشة كله

      backgroundColor: Colors.white, // هنا بنحدد لون خلفية شاشة السبلاش أبيض

      splashTransition: SplashTransition.fadeTransition, // هنا بنحدد شكل الانتقال بحيث الصفحة تختفي وتظهر اللي بعدها تدريجي

      splash: Container(
        // ده الكونتينر اللي شايل كل العناصر اللي هتظهر في شاشة السبلاش

        width: double.infinity, // هنا بنخلي عرض الكونتينر ياخد عرض الشاشة كله

        height: double.infinity, // هنا بنخلي ارتفاع الكونتينر ياخد طول الشاشة كله

        color: Colors.white, // هنا بنحدد لون خلفية الكونتينر أبيض

        child: Padding(
          // هنا بنضيف مسافة حوالين العناصر اللي جوه الكونتينر

          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
          ), // هنا بنسيب مسافة من اليمين والشمال

          child: Column(
            // هنا بنرتب العناصر اللي جوه الشاشة تحت بعض

            mainAxisAlignment:
                MainAxisAlignment.center, // هنا بنخلي العناصر في نص الشاشة بشكل رأسي

            children: [
              // هنا بنحط كل العناصر اللي هتظهر في شاشة السبلاش

              const Spacer(), // ده بياخد المساحة الفاضية وبيساعد في توزيع العناصر على الشاشة

              Image.asset(
                // هنا بنعرض صورة اللوجو من الصور الموجودة في ملفات المشروع

                'images/logo.png', // ده مكان صورة اللوجو جوه المشروع

                width: 180, // هنا بنحدد عرض اللوجو
              ),

              const SizedBox(height: 24), // هنا بنسيب مسافة بين اللوجو واسم المستشفى

              const Text(
                // هنا بنعرض اسم المستشفى على الشاشة

                'Grand Hospital',

                style: TextStyle(
                  // هنا بنحدد شكل اسم المستشفى

                  fontSize: 26, // ده حجم الخط

                  fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض

                  color: Color(0xFF1E2A38), // هنا بنحدد لون الخط
                ),
              ),

              const SizedBox(height: 8), // هنا بنسيب مسافة صغيرة بين اسم المستشفى والجملة اللي تحته

              const Text(
                // هنا بنعرض الجملة التوضيحية اللي تحت اسم المستشفى

                'Expert care. A healthier tomorrow.',

                style: TextStyle(
                  // هنا بنحدد شكل الجملة

                  fontSize: 14, // ده حجم الخط

                  color: Colors.grey, // هنا بنخلي لون الخط رمادي
                ),
              ),

              const Spacer(), // هنا بنخلي فيه مساحة فاضية تساعد في توزيع العناصر على الشاشة

              const Padding(
                // هنا بنضيف مسافة حوالين النص اللي موجود تحت الشاشة

                padding: EdgeInsets.only(
                  bottom: 30.0,
                ), // هنا بنسيب مسافة 30 من تحت

                child: Text(
                  // هنا بنعرض الجملة الموجودة في آخر الشاشة

                  'Your health, in trusted hands',

                  style: TextStyle(
                    // هنا بنحدد شكل الجملة

                    fontSize: 13, // ده حجم الخط

                    color: Colors.grey, // هنا بنخلي لون الخط رمادي
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