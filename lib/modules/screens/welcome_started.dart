import 'package:flutter/material.dart'; // دي المكتبة اللي فيها كل الأدوات اللي بنستخدمها في تصميم صفحات فلاتر

// ignore: unused_import
import "login_page.dart"; // هنا بنستدعي ملف صفحة تسجيل الدخول عشان نقدر نفتحها من الصفحة دي

class WelcomeStarted extends StatelessWidget {
  // ده الكلاس المسؤول عن صفحة البداية

  const WelcomeStarted({super.key}); // ده الكونستراكتور بتاع الصفحة

  @override
  Widget build(BuildContext context) {
    // دي الدالة اللي بنكتب جواها شكل الصفحة وكل العناصر اللي هتظهر فيها

    return Scaffold(
      // ده الهيكل الأساسي اللي بنبني جواه الصفحة

      backgroundColor: Colors.white, // هنا بنخلي لون خلفية الصفحة أبيض

      body: SafeArea(
        // دي بتحمي محتوى الصفحة من إنه يدخل تحت النوتش أو شريط الحالة

        child: Padding(
          // هنا بنضيف مسافة حوالين محتوى الصفحة

          padding: const EdgeInsets.symmetric(
            horizontal: 24.0,
            vertical: 16.0,
          ), // هنا بنحدد المسافة من اليمين والشمال وفوق وتحت

          child: Column(
            // هنا بنرتب كل العناصر تحت بعض بشكل رأسي

            crossAxisAlignment:
                CrossAxisAlignment.start, // هنا بنخلي العناصر تبدأ من الشمال

            children: [
              // هنا بنحط كل العناصر اللي عايزينها تظهر في الصفحة

              Row(
                // هنا بنحط اللوجو واسم المستشفى جنب بعض في صف واحد

                children: [
                  // دي العناصر اللي هتظهر جوه الصف

                  CircleAvatar(
                    // هنا بنعرض اللوجو داخل شكل دائري

                    radius: 24, // هنا بنحدد حجم الدائرة

                    backgroundImage: AssetImage(
                      'images/logo.png',
                    ), // هنا بنجيب صورة اللوجو من ملفات المشروع

                    backgroundColor:
                        Colors.grey[200], // هنا بنحدد لون الخلفية اللي ورا اللوجو
                  ),

                  const SizedBox(width: 12), // هنا بنسيب مسافة بين اللوجو واسم المستشفى

                  Column(
                    // هنا بنحط اسم المستشفى والجملة اللي تحته فوق بعض

                    crossAxisAlignment:
                        CrossAxisAlignment.start, // هنا بنخلي الكلام يبدأ من الشمال

                    children: const [
                      // هنا بنحط النصوص اللي هتظهر تحت بعض

                      Text(
                        // هنا بنعرض اسم المستشفى

                        'Grand Hospital',

                        style: TextStyle(
                          // هنا بنحدد شكل اسم المستشفى

                          fontSize: 18, // ده حجم الخط

                          fontWeight:
                              FontWeight.bold, // هنا بنخلي الخط عريض

                          color: Colors.black87, // ده لون الخط
                        ),
                      ),

                      Text(
                        // هنا بنعرض الجملة اللي تحت اسم المستشفى

                        'Care that puts you first',

                        style: TextStyle(
                          // هنا بنحدد شكل الجملة

                          fontSize: 12, // ده حجم الخط

                          color: Colors.grey, // ده لون الخط الرمادي
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24), // هنا بنسيب مسافة بين الهيدر والصورة الكبيرة

              Expanded(
                // هنا بنخلي الصورة تاخد المساحة المتاحة ليها في الصفحة

                child: ClipRRect(
                  // هنا بنستخدمه عشان نخلي زوايا الصورة دائرية

                  borderRadius: BorderRadius.circular(
                    16.0,
                  ), // هنا بنحدد درجة دوران زوايا الصورة

                  child: Image.asset(
                    // هنا بنعرض صورة من الصور الموجودة في ملفات المشروع

                    'images/doctor_patient.png', // دي صورة الدكتور والمريض اللي في نص الصفحة

                    width: double.infinity, // هنا بنخلي الصورة تاخد العرض كله

                    fit: BoxFit.cover, // هنا بنخلي الصورة تملأ المساحة من غير ما شكلها يتشوّه
                  ),
                ),
              ),

              const SizedBox(height: 24), // هنا بنسيب مسافة بين الصورة والعنوان

              const Text(
                // هنا بنعرض العنوان الرئيسي في الصفحة

                'Better care starts here.',

                style: TextStyle(
                  // هنا بنحدد شكل العنوان

                  fontSize: 26, // ده حجم الخط

                  fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض

                  color: Colors.black87, // ده لون الخط
                ),
              ),

              const SizedBox(height: 12), // هنا بنسيب مسافة بين العنوان والوصف

              const Text(
                // هنا بنعرض الوصف اللي تحت العنوان

                'Find trusted specialists, book your next visit and manage your care, all in one place.',

                style: TextStyle(
                  // هنا بنحدد شكل الوصف

                  fontSize: 14, // ده حجم الخط

                  color: Colors.grey, // هنا بنخلي لون الخط رمادي

                  height: 1.4, // هنا بنحدد المسافة بين سطور الكلام
                ),
              ),

              const SizedBox(height: 16), // هنا بنسيب مسافة بين الوصف وجزء الأمان

              Row(
                // هنا بنحط أيقونة الأمان والكلام جنب بعض

                children: const [
                  // دي العناصر اللي هتظهر جوه الصف

                  Icon(
                    // هنا بنعرض أيقونة الأمان

                    Icons.security_outlined, // ده شكل الأيقونة

                    size: 18, // هنا بنحدد حجم الأيقونة

                    color: Colors.grey, // هنا بنحدد لون الأيقونة
                  ),

                  SizedBox(width: 8), // هنا بنسيب مسافة بين الأيقونة والكلام

                  Text(
                    // هنا بنعرض جملة الأمان

                    'Secure, personal and always here for you.',

                    style: TextStyle(
                      // هنا بنحدد شكل الجملة

                      fontSize: 12, // ده حجم الخط

                      color: Colors.grey, // ده لون الخط
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24), // هنا بنسيب مسافة قبل الأزرار

              SizedBox(
                // هنا بنحدد مساحة زر Get Started

                width: double.infinity, // هنا بنخلي الزر ياخد عرض الصفحة كله

                height: 50, // هنا بنحدد ارتفاع الزر

                child: ElevatedButton(
                  // هنا بنعمل زر Get Started

                  onPressed: () {
                    // هنا الكود اللي بيتنفذ لما المستخدم يدوس على الزر

                    Navigator.pushReplacement(
                      // دي بنستخدمها عشان ننقل المستخدم لصفحة تانية ونشيل الصفحة الحالية من الرجوع

                      context, // ده بيساعدنا نحدد مكان الصفحة الحالية

                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ), // هنا بنحدد إن الصفحة اللي هتفتح هي صفحة تسجيل الدخول
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    // هنا بنظبط شكل الزر

                    backgroundColor: const Color(
                      0xFF194275,
                    ), // هنا بنحدد لون خلفية الزر الأزرق

                    shape: RoundedRectangleBorder(
                      // هنا بنحدد شكل حواف الزر

                      borderRadius: BorderRadius.circular(
                        12,
                      ), // هنا بنخلي حواف الزر دائرية
                    ),
                  ),

                  child: const Text(
                    // هنا بنكتب الكلام اللي هيظهر جوه الزر

                    'Get Started',

                    style: TextStyle(
                      // هنا بنحدد شكل الكلام

                      fontSize: 16, // ده حجم الخط

                      fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض

                      color: Colors.white, // هنا بنخلي لون الخط أبيض
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16), // هنا بنسيب مسافة بين الزرين

              Center(
                // هنا بنحط جملة تسجيل الدخول في نص الصفحة

                child: RichText(
                  // ده بنستخدمه لما نكون عايزين نعرض أكتر من جزء في النص وكل جزء يكون ليه تنسيق مختلف

                  text: const TextSpan(
                    // هنا بنحدد النص الأساسي والأجزاء اللي جواه

                    text: 'Already have an account? ', // ده الجزء الأول من الكلام

                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ), // هنا بنحدد شكل ولون الجزء الأول

                    children: [
                      // هنا بنضيف الجزء التاني من الكلام

                      TextSpan(
                        // هنا بنحدد كلمة Log In لوحدها عشان نقدر نغير شكلها

                        text: 'Log In',

                        style: TextStyle(
                          // هنا بنحدد شكل كلمة تسجيل الدخول

                          color: Color(0xFF194275), // هنا بنخلي لون الكلمة أزرق

                          fontWeight:
                              FontWeight.bold, // هنا بنخلي الخط عريض
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