import 'package:flutter/material.dart';
// ignore: unused_import
import 'create_account.dart';

// =====================================================
// إنشاء صفحة تسجيل الدخول (Login Page)
// StatefulWidget لأن الصفحة تحتوي على متغير يتغير
// وهو المسؤول عن إظهار وإخفاء كلمة المرور
// =====================================================
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  // متغير للتحكم في إظهار وإخفاء كلمة المرور
  // true تعني إخفاء كلمة المرور
  // false تعني إظهار كلمة المرور
  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {

    // تجهيز الهيكل الأساسي لصفحة تسجيل الدخول
    return Scaffold(
      backgroundColor: Colors.white,

      // =================================================
      // الشريط العلوي للصفحة (AppBar)
      // =================================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        // عنوان الصفحة
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: false,
      ),

      // =================================================
      // محتوى الصفحة
      // SafeArea لحماية المحتوى من النوتش
      // SingleChildScrollView للسماح بالتمرير
      // =================================================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),

          // ترتيب عناصر الصفحة بشكل رأسي
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // =================================================
              // عرض لوجو المستشفى في منتصف الصفحة
              // =================================================
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: const AssetImage('images/logo.png'),
                  backgroundColor: Colors.white,
                ),
              ),

              const SizedBox(height: 24),

              // عنوان الترحيب بالمستخدم
              const Center(
                child: Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // رسالة توضيحية أسفل عنوان الترحيب
              const Center(
                child: Text(
                  "Log in to keep your care connected.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black54,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // =================================================
              // عنوان حقل البريد الإلكتروني أو رقم الهاتف
              // =================================================
              const Text(
                "Email or phoen",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // حقل إدخال البريد الإلكتروني أو رقم الهاتف
              TextField(
                // تحديد نوع لوحة المفاتيح المناسبة للإدخال
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                  hintText: "Email or phoen",

                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ),

                  // أيقونة البريد الإلكتروني داخل الحقل
                  suffixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black45,
                  ),

                  // تنسيق خلفية الحقل وحوافه
                  filled: true,
                  fillColor: Colors.grey.shade100,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),

                  // تحديد المسافات الداخلية للحقل
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =================================================
              // عنوان حقل كلمة المرور
              // =================================================
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 8),

              // حقل إدخال كلمة المرور
              TextField(

                // تحديد حالة إظهار أو إخفاء كلمة المرور
                obscureText: isPasswordHidden,

                decoration: InputDecoration(
                  hintText: "••••••••••••",

                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ),

                  // =================================================
                  // زر العين للتحكم في إظهار وإخفاء كلمة المرور
                  // =================================================
                  suffixIcon: IconButton(

                    // تغيير حالة المتغير عند الضغط على الأيقونة
                    onPressed: () {
                      setState(() {
                        isPasswordHidden = !isPasswordHidden;
                      });
                    },

                    // تغيير شكل الأيقونة حسب حالة كلمة المرور
                    icon: Icon(
                      isPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.black45,
                    ),
                  ),

                  // تنسيق خلفية حقل كلمة المرور
                  filled: true,
                  fillColor: Colors.grey.shade100,

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),

                  // المسافات الداخلية للحقل
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // =================================================
              // زر استعادة كلمة المرور (Forgot Password)
              // =================================================
              Align(
                alignment: Alignment.centerLeft,

                child: TextButton(
                  onPressed: () {},

                  // إزالة المسافات الافتراضية للزر
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ),

                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color(0xFF1565C0),
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),

              // =================================================
              // زر تسجيل الدخول (Log In)
              // =================================================
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(

                  // تنسيق الزر من حيث اللون والحواف والظل
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF194275),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    elevation: 0,
                  ),

                  // تنفيذ عملية تسجيل الدخول عند الضغط
                  onPressed: () {},

                  // النص الموجود داخل الزر
                  child: const Text(
                    "Log In",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // =================================================
              // رسالة للمستخدم الذي لا يمتلك حساباً
              // =================================================
              const Center(
                child: Text(
                  "New to Grand Hospital?",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 13,
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // =================================================
              // زر الانتقال إلى صفحة إنشاء حساب جديد
              // =================================================
              SizedBox(
                width: double.infinity,
                height: 50,

                child: OutlinedButton(

                  // تنسيق الزر بإطار خارجي وحواف دائرية
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  // الانتقال إلى صفحة إنشاء حساب جديد
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CreateAccount(),
                      ),
                      // (route) => false,
                    );
                  },

                  // النص الموجود داخل الزر
                  child: const Text(
                    "Create Account",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF1565C0),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35),

              // =================================================
              // رسالة توضح للمستخدم أن بياناته الطبية خاصة
              // =================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [

                  // أيقونة القفل للتعبير عن الخصوصية
                  Icon(
                    Icons.lock_outline,
                    size: 14,
                    color: Colors.black45,
                  ),

                  SizedBox(width: 6),

                  // نص رسالة الخصوصية
                  Text(
                    "Your medical information stays private.",
                    style: TextStyle(
                      color: Colors.black45,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}