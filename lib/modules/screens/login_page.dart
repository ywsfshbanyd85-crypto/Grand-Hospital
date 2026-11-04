import 'package:flutter/material.dart'; // دي المكتبة اللي فيها كل الأدوات اللي بنستخدمها في تصميم صفحات فلاتر

// ignore: unused_import
import 'create_account.dart'; // دي الصفحة اللي هنروح لها لما المستخدم يدوس على Create Account

class LoginPage extends StatefulWidget {
  // ده الكلاس المسؤول عن صفحة تسجيل الدخول

  const LoginPage({super.key}); // ده الكونستراكتور بتاع الصفحة

  @override
  State<LoginPage> createState() => _LoginPageState(); // بنربط الصفحة بالكلاس اللي هيتحكم فيها
}

class _LoginPageState extends State<LoginPage> {
  // ده الكلاس اللي فيه محتوى الصفحة والتغييرات اللي بتحصل فيها

  bool isPasswordHidden = true; // ده متغير بيحدد الباسورد مخفي ولا ظاهر، وفي البداية بيكون مخفي

  @override
  Widget build(BuildContext context) {
    // دي الدالة اللي بنكتب جواها شكل الصفحة وكل العناصر اللي هتظهر فيها

    return Scaffold(
      // ده الهيكل الأساسي اللي بنبني جواه الصفحة

      backgroundColor: Colors.white, // هنا بنخلي لون خلفية الصفحة أبيض

      appBar: AppBar(
        // ده الشريط اللي بيظهر فوق الصفحة

        backgroundColor: Colors.white, // هنا بنحدد لون خلفية الشريط

        elevation: 0, // هنا بنشيل الظل اللي تحت الشريط

        title: Text(
          // هنا بنعرض عنوان الصفحة

          "Login",

          style: TextStyle(
            // هنا بنحدد شكل عنوان الصفحة

            color: Colors.black87, // ده لون العنوان

            fontSize: 18, // ده حجم الخط

            fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض
          ),
        ),

        centerTitle: false, // هنا بنخلي العنوان على الشمال
      ),

      body: SafeArea(
        // دي بتحمي محتوى الصفحة من إنه يدخل تحت النوتش أو شريط الحالة

        child: SingleChildScrollView(
          // دي بتخلينا نقدر ننزل ونطلع في الصفحة لو المحتوى أكبر من الشاشة

          padding: const EdgeInsets.all(
            20.0,
          ), // هنا بنسيب مسافة 20 من كل ناحية حوالين محتوى الصفحة

          child: Column(
            // هنا بنرتب كل العناصر تحت بعض بشكل رأسي

            crossAxisAlignment:
                CrossAxisAlignment.start, // هنا بنخلي العناصر تبدأ من الشمال

            children: [
              // هنا بنحط كل العناصر اللي عايزينها تظهر في الصفحة

              Center(
                // هنا بنحط اللوجو في نص الصفحة

                child: CircleAvatar(
                  // دي بتعرض الصورة داخل شكل دائري

                  radius: 50, // هنا بنحدد حجم الدائرة

                  backgroundImage: const AssetImage(
                    'images/logo.png',
                  ), // هنا بنجيب صورة اللوجو من ملف الصور

                  backgroundColor: Colors.white, // ده لون الخلفية اللي ورا اللوجو
                ),
              ),

              const SizedBox(height: 24), // هنا بنسيب مسافة بين اللوجو والعنوان

              const Center(
                // هنا بنحط عنوان الترحيب في نص الصفحة

                child: Text(
                  // هنا بنعرض كلمة الترحيب

                  "Welcome",

                  style: TextStyle(
                    // هنا بنحدد شكل كلمة الترحيب

                    fontSize: 35, // ده حجم الخط

                    fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض

                    color: Colors.black87, // ده لون الخط
                  ),
                ),
              ),

              const SizedBox(
                height: 12,
              ), // هنا بنسيب مسافة بين العنوان والكلام اللي تحته

              const Center(
                // هنا بنحط الكلام التوضيحي في نص الصفحة

                child: Text(
                  // هنا بنعرض الجملة اللي بتظهر تحت Welcome

                  "Log in to keep your care connected.",

                  textAlign: TextAlign.center, // هنا بنخلي الكلام في النص

                  style: TextStyle(
                    // هنا بنحدد شكل الكلام

                    fontSize: 15, // ده حجم الخط

                    color: Colors.black54, // ده لون الخط
                  ),
                ),
              ),

              const SizedBox(height: 30), // هنا بنسيب مسافة قبل خانات تسجيل الدخول

              const Text(
                // هنا بنعرض عنوان خانة الإيميل

                "Email or phoen",

                style: TextStyle(
                  // هنا بنحدد شكل عنوان الخانة

                  fontSize: 14, // ده حجم الخط

                  fontWeight: FontWeight.w500, // هنا بنخلي سمك الخط متوسط

                  color: Colors.black87, // ده لون الخط
                ),
              ),

              const SizedBox(height: 8), // هنا بنسيب مسافة بين العنوان والخانة

              TextField(
                // دي الخانة اللي المستخدم هيكتب فيها الإيميل أو رقم التليفون

                keyboardType:
                    TextInputType.emailAddress, // هنا بنخلي الكيبورد يظهر بشكل مناسب لكتابة الإيميل

                decoration: InputDecoration(
                  // هنا بنظبط شكل خانة الكتابة

                  hintText: "Email or phoen", // ده الكلام اللي بيظهر جوه الخانة قبل ما المستخدم يكتب

                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ), // هنا بنحدد لون الكلام التوضيحي

                  suffixIcon: const Icon(
                    Icons.email_outlined,
                    color: Colors.black45,
                  ), // هنا بنضيف أيقونة الإيميل في آخر الخانة

                  filled: true, // هنا بنفعّل لون خلفية الخانة

                  fillColor: Colors.grey.shade100, // هنا بنحدد لون خلفية الخانة

                  border: OutlineInputBorder(
                    // هنا بنحدد شكل إطار الخانة

                    borderRadius: BorderRadius.circular(
                      12,
                    ), // هنا بنخلي حواف الخانة دائرية

                    borderSide: BorderSide.none, // هنا بنشيل الخط اللي حوالين الخانة
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ), // هنا بنحدد المسافة بين الكلام وحدود الخانة
                ),
              ),

              const SizedBox(
                height: 20,
              ), // هنا بنسيب مسافة بين خانة الإيميل وخانة الباسورد

              const Text(
                // هنا بنعرض عنوان خانة الباسورد

                "Password",

                style: TextStyle(
                  // هنا بنحدد شكل عنوان الخانة

                  fontSize: 14, // ده حجم الخط

                  fontWeight: FontWeight.w500, // هنا بنخلي سمك الخط متوسط

                  color: Colors.black87, // ده لون الخط
                ),
              ),

              const SizedBox(
                height: 8,
              ), // هنا بنسيب مسافة بين العنوان وخانة الباسورد

              TextField(
                // دي الخانة اللي المستخدم هيكتب فيها الباسورد

                obscureText: isPasswordHidden, // هنا بنحدد الباسورد يظهر ولا يفضل مخفي على شكل نقط

                decoration: InputDecoration(
                  // هنا بنظبط شكل خانة الباسورد

                  hintText: "••••••••••••", // ده الشكل اللي بيظهر جوه الخانة

                  hintStyle: const TextStyle(
                    color: Colors.black38,
                  ), // هنا بنحدد لون العلامات اللي جوه الخانة

                  suffixIcon: IconButton(
                    // هنا بنضيف زر العين في آخر خانة الباسورد

                    onPressed: () {
                      // هنا الكود اللي بيتنفذ لما المستخدم يدوس على العين

                      setState(() {
                        // دي بتخلي الصفحة تعمل تحديث بعد ما نغير حالة الباسورد

                        isPasswordHidden = !isPasswordHidden; // هنا بنعكس قيمة المتغير، لو مخفي نخليه ظاهر والعكس
                      });
                    },

                    icon: Icon(
                      // هنا بنحدد شكل أيقونة العين

                      isPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined, // لو الباسورد مخفي بنعرض عين مقفولة ولو ظاهر بنعرض عين مفتوحة

                      color: Colors.black45, // هنا بنحدد لون أيقونة العين
                    ),
                  ),

                  filled: true, // هنا بنفعّل لون خلفية الخانة

                  fillColor: Colors.grey.shade100, // هنا بنحدد لون خلفية خانة الباسورد

                  border: OutlineInputBorder(
                    // هنا بنحدد شكل إطار الخانة

                    borderRadius: BorderRadius.circular(
                      12,
                    ), // هنا بنخلي حواف الخانة دائرية

                    borderSide: BorderSide.none, // هنا بنشيل الخط اللي حوالين الخانة
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 14,
                  ), // هنا بنحدد المسافة جوه الخانة
                ),
              ),

              const SizedBox(height: 10), // هنا بنسيب مسافة قبل زر نسيت الباسورد

              Align(
                // هنا بنحدد مكان زر نسيت الباسورد

                alignment: Alignment.centerLeft, // هنا بنحط الزر على الشمال

                child: TextButton(
                  // هنا بنعمل زر نصي لنسيت الباسورد

                  onPressed: () {}, // دي الوظيفة اللي بتشتغل لما ندوس على الزر ولسه مفيش كود جواها

                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                  ), // هنا بنشيل المسافة الزيادة حوالين الزر

                  child: const Text(
                    // هنا بنكتب الكلام اللي هيظهر على الزر

                    "Forgot Password?",

                    style: TextStyle(
                      // هنا بنحدد شكل الكلام

                      color: Color(0xFF1565C0), // ده لون الكلام الأزرق

                      fontWeight: FontWeight.w600, // هنا بنخلي الخط أتقل شوية

                      fontSize: 14, // ده حجم الخط
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25), // هنا بنسيب مسافة قبل زر تسجيل الدخول

              SizedBox(
                // هنا بنحدد مساحة الزر

                width: double.infinity, // هنا بنخلي الزر ياخد عرض الصفحة كله

                height: 50, // هنا بنحدد ارتفاع الزر

                child: ElevatedButton(
                  // هنا بنعمل زر تسجيل الدخول

                  style: ElevatedButton.styleFrom(
                    // هنا بنظبط شكل الزر

                    backgroundColor: const Color(0xFF194275), // هنا بنحدد لون خلفية الزر الأزرق

                    shape: RoundedRectangleBorder(
                      // هنا بنحدد شكل حواف الزر

                      borderRadius: BorderRadius.circular(
                        12,
                      ), // هنا بنخلي حواف الزر دائرية
                    ),

                    elevation: 0, // هنا بنشيل الظل اللي حوالين الزر
                  ),

                  onPressed: () {}, // دي الوظيفة اللي بتشتغل لما المستخدم يدوس على الزر ولسه مفيش كود جواها

                  child: const Text(
                    // هنا بنكتب الكلام اللي هيظهر جوه الزر

                    "Log In",

                    style: TextStyle(
                      // هنا بنحدد شكل الكلام

                      fontSize: 16, // ده حجم الخط

                      color: Colors.white, // هنا بنخلي لون الخط أبيض

                      fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 30,
              ), // هنا بنسيب مسافة قبل جملة المستخدم الجديد

              const Center(
                // هنا بنحط الجملة في نص الصفحة

                child: Text(
                  // هنا بنعرض جملة المستخدم الجديد

                  "New to Grand Hospital?",

                  style: TextStyle(
                    // هنا بنحدد شكل الجملة

                    color: Colors.black54, // ده لون الخط

                    fontSize: 13, // ده حجم الخط
                  ),
                ),
              ),

              const SizedBox(height: 15), // هنا بنسيب مسافة قبل زر إنشاء الحساب

              SizedBox(
                // هنا بنحدد مساحة زر إنشاء الحساب

                width: double.infinity, // هنا بنخلي الزر ياخد عرض الصفحة كله

                height: 50, // هنا بنحدد ارتفاع الزر

                child: OutlinedButton(
                  // هنا بنعمل زر بإطار خارجي من غير لون خلفية

                  style: OutlinedButton.styleFrom(
                    // هنا بنظبط شكل الزر

                    side: BorderSide(
                      color: Colors.grey.shade300,
                    ), // هنا بنحدد لون الإطار اللي حوالين الزر

                    shape: RoundedRectangleBorder(
                      // هنا بنحدد شكل حواف الزر

                      borderRadius: BorderRadius.circular(
                        12,
                      ), // هنا بنخلي الحواف دائرية
                    ),
                  ),

                  onPressed: () {
                    // هنا الكود اللي بيتنفذ لما المستخدم يدوس على Create Account

                    Navigator.push(
                      // دي بنستخدمها عشان نفتح صفحة جديدة فوق الصفحة الحالية

                      context, // ده بيساعدنا نحدد مكان الصفحة الحالية

                      MaterialPageRoute(
                        // هنا بنحدد الصفحة اللي عايزين نروح لها

                        builder: (context) => const CreateAccount(), // هنا بنفتح صفحة إنشاء حساب جديد
                      ),
                    );
                  },

                  child: const Text(
                    // هنا بنكتب الكلام اللي هيظهر جوه الزر

                    "Create Account",

                    style: TextStyle(
                      // هنا بنحدد شكل الكلام

                      fontSize: 16, // ده حجم الخط

                      color: Color(0xFF1565C0), // ده لون الخط الأزرق

                      fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 35), // هنا بنسيب مسافة قبل جملة الخصوصية

              Row(
                // هنا بنحط أيقونة القفل والكلام جنب بعض في صف واحد

                mainAxisAlignment: MainAxisAlignment.center, // هنا بنخلي العناصر في نص الصفحة

                children: const [
                  // هنا بنحط العناصر اللي هتظهر جوه الصف

                  Icon(
                    Icons.lock_outline, // دي أيقونة القفل
                    size: 14, // هنا بنحدد حجم الأيقونة
                    color: Colors.black45, // هنا بنحدد لون الأيقونة
                  ),

                  SizedBox(width: 6), // هنا بنسيب مسافة صغيرة بين القفل والكلام

                  Text(
                    // هنا بنعرض جملة الخصوصية

                    "Your medical information stays private.",

                    style: TextStyle(
                      // هنا بنحدد شكل الجملة

                      color: Colors.black45, // ده لون الخط

                      fontSize: 12, // ده حجم الخط
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