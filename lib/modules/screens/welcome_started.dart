import 'package:flutter/material.dart';
// ignore: unused_import
import "login_page.dart";

// =====================================================
// إنشاء صفحة البداية (Welcome Screen)
// StatelessWidget لأن محتويات الصفحة لا تتغير أثناء الاستخدام
// =====================================================
class WelcomeStarted extends StatelessWidget {
  const WelcomeStarted({super.key});

  @override
  Widget build(BuildContext context) {

    // تجهيز الهيكل الأساسي للصفحة
    return Scaffold(
      backgroundColor: Colors.white,

      // SafeArea لحماية المحتوى من التداخل مع النوتش وشريط الحالة
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ),

          // ترتيب جميع عناصر الصفحة بشكل رأسي
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =================================================
              // الجزء العلوي: لوجو المستشفى واسمها
              // =================================================
              Row(
                children: [

                  // عرض لوجو المستشفى داخل دائرة
                  CircleAvatar(
                    radius: 24,
                    backgroundImage: AssetImage('images/logo.png'),
                    backgroundColor: Colors.grey[200],
                  ),

                  const SizedBox(width: 12),

                  // اسم المستشفى والجملة التعريفية
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [

                      // اسم المستشفى
                      Text(
                        'Grand Hospital',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),

                      // الجملة التعريفية بالمستشفى
                      Text(
                        'Care that puts you first',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // =================================================
              // عرض الصورة الرئيسية للدكتور والمريض
              // Expanded لجعل الصورة تشغل المساحة المتاحة
              // ClipRRect لإضافة حواف دائرية للصورة
              // =================================================
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    'images/doctor_patient.png',
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // =================================================
              // العنوان الرئيسي للصفحة
              // =================================================
              const Text(
                'Better care starts here.',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 12),

              // وصف مختصر يوضح الخدمات التي يقدمها التطبيق
              const Text(
                'Find trusted specialists, book your next visit and manage your care, all in one place.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 16),

              // =================================================
              // رسالة توضيحية للمستخدم عن أمان بياناته
              // =================================================
              Row(
                children: const [

                  // أيقونة الأمان
                  Icon(
                    Icons.security_outlined,
                    size: 18,
                    color: Colors.grey,
                  ),

                  SizedBox(width: 8),

                  // نص رسالة الأمان
                  Text(
                    'Secure, personal and always here for you.',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // =================================================
              // زر Get Started للانتقال إلى صفحة تسجيل الدخول
              // =================================================
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(

                  // تنفيذ عملية الانتقال عند الضغط على الزر
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },

                  // تنسيق الزر من حيث اللون والحواف
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF194275),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  // النص الموجود داخل الزر
                  child: const Text(
                    'Get Started',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // =================================================
              // رسالة للمستخدم الذي يمتلك حساباً بالفعل
              // RichText يسمح بتنسيق أجزاء مختلفة من النص
              // =================================================
              Center(
                child: RichText(
                  text: const TextSpan(

                    // النص الأول
                    text: 'Already have an account? ',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),

                    // الجزء الثاني من النص
                    children: [
                      TextSpan(
                        text: 'Log In',
                        style: TextStyle(
                          color: Color(0xFF194275),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
