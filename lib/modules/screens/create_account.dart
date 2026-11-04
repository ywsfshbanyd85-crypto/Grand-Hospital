import 'package:flutter/material.dart'; // دي المكتبة اللي فيها كل الأدوات اللي بنستخدمها في تصميم صفحات فلاتر
import 'login_page.dart'; // هنا بنستدعي صفحة تسجيل الدخول عشان نقدر نروح لها لما المستخدم يدوس على Login

// هنا بنعمل صفحة إنشاء حساب جديد
class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key}); // ده الكونستراكتور بتاع الصفحة

  @override
  State<CreateAccount> createState() => _CreateAccountState(); // هنا بنربط الصفحة بالكلاس اللي هنتحكم فيه في البيانات والتغييرات
}

// هنا بنكتب كل المتغيرات والأكواد اللي بتتحكم في الصفحة
class _CreateAccountState extends State<CreateAccount> {

  bool _isChecked = false; // ده عشان نعرف المستخدم وافق على الشروط ولا لسه
  bool _isPasswordHidden = true; // ده عشان نتحكم في الباسورد يظهر ولا يفضل مخفي

  // ده المتحكم اللي بنستخدمه عشان نعرف الباسورد اللي المستخدم بيكتبه
  final TextEditingController _passwordController =
      TextEditingController();

  String? _passwordError; // هنا بنحفظ رسالة الخطأ لو الباسورد مش مطابق للشروط
  String? _selectedGender; // هنا بنحفظ النوع اللي المستخدم اختاره
  DateTime? _selectedDate; // هنا بنحفظ تاريخ الميلاد اللي المستخدم اختاره

  // دي الدالة اللي بنستخدمها عشان نفتح التقويم ونختار تاريخ الميلاد
  Future<void> _selectDate() async {

    // هنا بنفتح التقويم عشان المستخدم يختار تاريخ ميلاده
    DateTime? pickedDate = await showDatePicker(
      context: context, // ده عشان التقويم يظهر فوق الصفحة الحالية
      initialDate: DateTime(2000), // ده التاريخ اللي التقويم هيبدأ يعرضه أول ما يفتح
      firstDate: DateTime(1900), // ده أقدم تاريخ المستخدم يقدر يختاره
      lastDate: DateTime.now(), // هنا بنخلي آخر تاريخ ممكن يختاره هو تاريخ النهارده
      helpText: 'Select your date of birth', // دي الجملة اللي بتظهر فوق التقويم

      // هنا بنظبط ألوان التقويم عشان تناسب ألوان التطبيق
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith( // هنا بناخد شكل الصفحة ونغير فيه ألوان التقويم
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1E3A8A), // ده اللون الأساسي اللي بيظهر في التقويم
              onPrimary: Colors.white, // ده لون الكلام اللي بيظهر فوق اللون الأساسي
              surface: Color(0xFFF1F5F9), // ده لون خلفية التقويم
              onSurface: Color(0xFF1E293B), // ده لون الكلام والتواريخ اللي جوه التقويم
            ),

            // هنا بنغير لون الأزرار اللي جوه التقويم
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1E3A8A), // ده لون الكلام بتاع الأزرار
              ),
            ), dialogTheme: DialogThemeData(backgroundColor: const Color(0xFFF1F5F9)), // ده لون الخلفية بتاعة نافذة التقويم
          ),
          child: child!, // هنا بنعرض التقويم بعد ما غيرنا ألوانه
        );
      },
    );

    // هنا بنشوف المستخدم اختار تاريخ ولا ضغط إلغاء
    if (pickedDate != null) {
      setState(() { // دي عشان الصفحة تعمل تحديث ويظهر التاريخ الجديد
        _selectedDate = pickedDate; // هنا بنحفظ التاريخ اللي المستخدم اختاره
      });
    }
  }

  // دي الدالة اللي بنستخدمها عشان نتأكد إن الباسورد مناسب
  void _validateAndSubmit() {
    setState(() { // هنا بنخلي الصفحة تعمل تحديث عشان رسالة الخطأ تظهر لو موجودة

      // هنا بنشوف الباسورد كام حرف
      if (_passwordController.text.length < 8) {
        _passwordError =
            'Password must be at least 8 characters long.'; // لو أقل من 8 حروف بنظهر رسالة الخطأ دي
      } else {
        _passwordError = null; // لو الباسورد 8 حروف أو أكتر بنشيل رسالة الخطأ
      }
    });
  }

  @override
  void dispose() {
    _passwordController.dispose(); // هنا بنقفل المتحكم بتاع الباسورد لما نخلص من الصفحة
    super.dispose(); // ده بيكمل عملية إغلاق الصفحة بالطريقة العادية
  }

  @override
  Widget build(BuildContext context) { // دي الدالة اللي بنكتب جواها شكل الصفحة
    return Scaffold( // دي الهيكل الأساسي اللي بنبني جواه الصفحة
      backgroundColor: Colors.white, // هنا بنخلي خلفية الصفحة بيضاء

      // ده الشريط اللي بيظهر فوق الصفحة
      appBar: AppBar(
        backgroundColor: Colors.white, // ده لون خلفية الشريط
        elevation: 0, // هنا بنشيل الظل اللي تحت الشريط
        automaticallyImplyLeading: false, // هنا بنمنع ظهور زرار الرجوع بشكل تلقائي
        title: const Text(
          'Create Account', // ده عنوان الصفحة اللي بيظهر فوق
          style: TextStyle(
            color: Colors.black87, // ده لون العنوان
            fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض
            fontSize: 20, // ده حجم الخط
          ),
        ),
      ),

      // هنا بنبدأ نحط محتويات الصفحة
      body: SafeArea( // دي عشان المحتوى ميدخلش تحت النوتش أو شريط الموبايل
        child: SingleChildScrollView( // دي عشان نقدر ننزل ونطلع في الصفحة لو المحتوى طويل
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0, // هنا بنسيب مسافة من اليمين والشمال
            vertical: 10.0, // وهنا بنسيب مسافة من فوق وتحت
          ),

          child: Column( // هنا بنرتب كل العناصر تحت بعض
            crossAxisAlignment: CrossAxisAlignment.start, // هنا بنخلي العناصر تبدأ من ناحية الشمال
            children: [
              const Text(
                'Your care, your account', // دي الجملة الرئيسية اللي بتظهر للمستخدم
                style: TextStyle(
                  fontSize: 24, // ده حجم الخط
                  fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض
                  color: Colors.black87, // ده لون الكلام
                ),
              ),

              const SizedBox(height: 6), // دي مسافة صغيرة بين الجملتين

              const Text(
                'Tell us a little about yourself to get started.', // دي جملة بتوضح للمستخدم إنه يكتب بياناته
                style: TextStyle(
                  fontSize: 14, // ده حجم الخط
                  color: Colors.grey, // ده لون الكلام
                ),
              ),

              const SizedBox(height: 20), // هنا بنسيب مسافة قبل أول خانة

              // هنا بنحط عنوان خانة الاسم
              _buildTextFieldLabel('Full name'),
              const SizedBox(height: 6), // دي مسافة بين العنوان والخانة
              _buildTextField(hintText: 'Enter the name'), // دي خانة كتابة الاسم

              const SizedBox(height: 16), // دي مسافة قبل خانة رقم التليفون

              // هنا بنحط عنوان خانة رقم التليفون
              _buildTextFieldLabel('Phone number'),
              const SizedBox(height: 6), // دي مسافة بين العنوان والخانة
              _buildTextField(hintText: '+20 1234567890'), // دي خانة كتابة رقم التليفون

              const SizedBox(height: 16), // دي مسافة قبل خانة الإيميل

              // هنا بنحط عنوان خانة الإيميل
              _buildTextFieldLabel('Email'),
              const SizedBox(height: 6), // دي مسافة بين العنوان والخانة
              _buildTextField(
                hintText: 'Enter your email', // دي خانة كتابة الإيميل
              ),

              const SizedBox(height: 16), // دي مسافة قبل خانة العنوان

              // هنا بنحط عنوان خانة العنوان
              _buildTextFieldLabel('Address'),
              const SizedBox(height: 6), // دي مسافة بين العنوان والخانة
              _buildTextField(
                hintText: 'Enter the address', // دي خانة كتابة العنوان
              ),

              const SizedBox(height: 16), // هنا بنسيب مسافة قبل تاريخ الميلاد والنوع

              // هنا بنحط تاريخ الميلاد والنوع جنب بعض
              Row(
                children: [
                  // ده الجزء الخاص بتاريخ الميلاد
                  Expanded( // هنا بنخلي الجزء ده ياخد المساحة المتاحة
                    child: Column( // هنا بنحط عنوان تاريخ الميلاد والخانة تحت بعض
                      crossAxisAlignment: CrossAxisAlignment.start, // هنا بنخلي العناصر تبدأ من الشمال
                      children: [
                        _buildTextFieldLabel('Date of birth'), // ده عنوان خانة تاريخ الميلاد
                        const SizedBox(height: 6), // دي مسافة بين العنوان والخانة

                        // هنا بنعمل الخانة اللي المستخدم هيدوس عليها عشان يختار التاريخ
                        InkWell(
                          onTap: _selectDate, // لما المستخدم يدوس هنا بنفتح التقويم
                          child: Container( // ده الصندوق اللي هيظهر فيه تاريخ الميلاد
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16, // دي مسافة من اليمين والشمال
                              vertical: 16, // ودي مسافة من فوق وتحت
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9), // ده لون خلفية الخانة
                              borderRadius: BorderRadius.circular(12), // هنا بنخلي أطراف الخانة دائرية
                            ),

                            // هنا بنحط التاريخ وأيقونة التقويم جنب بعض
                            child: Row(
                              children: [
                                Expanded( // هنا بنخلي التاريخ ياخد المساحة المتاحة
                                  child: Text(
                                    _selectedDate == null // هنا بنشوف المستخدم اختار تاريخ ولا لأ
                                        ? 'Select date' // لو لسه مختارش بنعرض Select date
                                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}', // لو اختار بنعرض اليوم والشهر والسنة
                                    style: const TextStyle(
                                      color: Colors.black87, // ده لون التاريخ
                                      fontSize: 14, // ده حجم الخط
                                    ),
                                  ),
                                ),

                                // دي أيقونة التقويم اللي بتظهر جنب التاريخ
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.grey, // ده لون الأيقونة
                                  size: 20, // ده حجم الأيقونة
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 12), // دي مسافة بين خانة التاريخ وخانة النوع

                  // ده الجزء الخاص باختيار النوع
                  Expanded( // هنا بنخلي الجزء ده ياخد المساحة المتاحة
                    child: Column( // هنا بنحط العنوان والقائمة تحت بعض
                      crossAxisAlignment: CrossAxisAlignment.start, // هنا بنخلي العناصر تبدأ من الشمال
                      children: [
                        _buildTextFieldLabel('Gender'), // ده عنوان خانة النوع
                        const SizedBox(height: 6), // دي مسافة بين العنوان والقائمة

                        // ده الصندوق اللي جواه قائمة اختيار النوع
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12, // دي مسافة من اليمين والشمال
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9), // ده لون خلفية الصندوق
                            borderRadius: BorderRadius.circular(12), // هنا بنخلي أطراف الصندوق دائرية
                          ),

                          // هنا بنخفي الخط اللي تحت القائمة
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>( // دي القائمة اللي المستخدم هيختار منها النوع
                              value: _selectedGender, // هنا بنعرض النوع اللي المستخدم اختاره

                              hint: const Text(
                                'Select', // دي الكلمة اللي بتظهر قبل ما المستخدم يختار
                                style: TextStyle(
                                  color: Colors.black87, // ده لون الكلام
                                  fontSize: 12, // ده حجم الخط
                                ),
                              ),

                              isExpanded: true, // هنا بنخلي القائمة تاخد عرض الصندوق كله

                              // ده لون خلفية القائمة لما المستخدم يفتحها
                              dropdownColor: const Color(0xFFF1F5F9),

                              // ده شكل السهم اللي جنب القائمة
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey, // ده لون السهم
                              ),

                              // هنا بنحط الاختيارات اللي المستخدم يقدر يختار منها
                              items: ['Male', 'Female'].map((gender) {
                                return DropdownMenuItem<String>(
                                  value: gender, // هنا بنحدد قيمة الاختيار
                                  child: Text(
                                    gender, // هنا بنعرض اسم النوع
                                    style: const TextStyle(
                                      fontSize: 12, // ده حجم الخط
                                      color: Colors.black87, // ده لون الكلام
                                    ),
                                  ),
                                );
                              }).toList(), // هنا بنحول الاختيارات لقائمة عشان نعرضها في DropdownButton

                              // دي بتشتغل لما المستخدم يختار نوع من القائمة
                              onChanged: (value) {
                                setState(() { // هنا بنخلي الصفحة تعمل تحديث عشان الاختيار الجديد يظهر
                                  _selectedGender = value; // هنا بنحفظ النوع اللي المستخدم اختاره
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16), // دي مسافة قبل خانة الباسورد

              // هنا بنحط عنوان خانة الباسورد
              _buildTextFieldLabel('Password'),
              const SizedBox(height: 6), // دي مسافة بين العنوان والخانة

              // دي خانة كتابة الباسورد
              TextField(
                controller: _passwordController, // هنا بنربط الخانة بالمتغير اللي بيقرأ الباسورد
                obscureText: _isPasswordHidden, // لو القيمة true الباسورد هيظهر مخفي

                decoration: InputDecoration(
                  hintText: '••••••••••••', // دي العلامات اللي بتظهر مكان الباسورد

                  hintStyle: const TextStyle(
                    color: Colors.black87, // ده لون العلامات
                    fontSize: 14, // ده حجمها
                  ),

                  filled: true, // هنا بنخلي للخانة لون خلفية
                  fillColor: const Color(0xFFF1F5F9), // ده لون خلفية خانة الباسورد

                  // دي العين اللي بندوس عليها عشان نظهر الباسورد أو نخفيه
                  suffixIcon: IconButton(
                    onPressed: () { // دي بتشتغل لما المستخدم يدوس على العين
                      setState(() { // هنا بنخلي الصفحة تعمل تحديث
                        _isPasswordHidden = !_isPasswordHidden; // هنا بنعكس القيمة، لو مخفي نخليه ظاهر ولو ظاهر نخفيه
                      });
                    },

                    // هنا بنغير شكل العين حسب الباسورد ظاهر ولا مخفي
                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off_outlined // دي العين اللي بتظهر لما الباسورد يكون مخفي
                          : Icons.visibility_outlined, // ودي العين اللي بتظهر لما الباسورد يكون ظاهر
                      color: Colors.grey, // ده لون العين
                      size: 20, // ده حجم العين
                    ),
                  ),

                  // هنا بنظبط شكل إطار خانة الباسورد
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12), // هنا بنخلي أطراف الخانة دائرية
                    borderSide: _passwordError != null // هنا بنشوف فيه رسالة خطأ ولا لأ
                        ? const BorderSide(
                            color: Colors.red, // لو فيه خطأ بنخلي الإطار أحمر
                            width: 1.5, // ده سمك الإطار
                          )
                        : BorderSide.none, // لو مفيش خطأ مش بنظهر إطار
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16, // دي المسافة جوه الخانة من اليمين والشمال
                    vertical: 16, // ودي المسافة من فوق وتحت
                  ),
                ),
              ),

              const SizedBox(height: 6), // دي مسافة بين خانة الباسورد والكلام اللي تحتها

              // هنا بنشوف فيه رسالة خطأ ولا لأ
              if (_passwordError != null)
                Text(
                  _passwordError!, // لو فيه خطأ بنعرض رسالة الخطأ هنا
                  style: const TextStyle(
                    fontSize: 12, // ده حجم الخط
                    color: Colors.red, // ده لون رسالة الخطأ
                    fontWeight: FontWeight.w500, // هنا بنخلي الخط أوضح شوية
                  ),
                )
              else
                const Text(
                  'Use 8+ characters, including a number and a symbol.', // لو مفيش خطأ بنعرض للمستخدم شروط الباسورد
                  style: TextStyle(
                    fontSize: 12, // ده حجم الخط
                    color: Colors.grey, // ده لون الكلام
                  ),
                ),

              const SizedBox(height: 12), // دي مسافة قبل مربع الموافقة على الشروط

              // ده الجزء الخاص بالموافقة على الشروط والأحكام
              Row(
                crossAxisAlignment: CrossAxisAlignment.start, // هنا بنخلي العناصر تبدأ من فوق
                children: [
                  SizedBox(
                    height: 24, // ده ارتفاع مربع الاختيار
                    width: 24, // ده عرض مربع الاختيار

                    // ده مربع الاختيار اللي المستخدم بيدوس عليه
                    child: Checkbox(
                      value: _isChecked, // هنا بنشوف المستخدم حاطط علامة صح ولا لأ

                      // هنا بنخلي أطراف مربع الاختيار دائرية
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),

                      activeColor: const Color(0xFF1E3A8A), // ده اللون اللي بيظهر لما المستخدم يعلم على المربع

                      // دي بتشتغل لما المستخدم يدوس على مربع الاختيار
                      onChanged: (val) {
                        setState(() { // هنا بنخلي الصفحة تعمل تحديث
                          _isChecked = val ?? false; // هنا بنحفظ المستخدم علم على المربع ولا شال العلامة
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 8), // دي مسافة بين مربع الاختيار والكلام

                  const Expanded( // هنا بنخلي الكلام ياخد المساحة المتاحة
                    child: Text(
                      'I agree to the Terms of Service and Privacy Policy, and consent to the use of my information for care.', // ده الكلام اللي المستخدم بيوافق عليه
                      style: TextStyle(
                        fontSize: 12, // ده حجم الخط
                        color: Colors.black54, // ده لون الكلام
                        height: 1.4, // دي المسافة بين السطور
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16), // دي مسافة قبل جزء تسجيل الدخول

              // ده الجزء اللي بيظهر لو المستخدم عنده حساب بالفعل
              Center( // هنا بنخلي الكلام والزرار في نص الصفحة
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center, // هنا بنحط الكلام والزرار في المنتصف
                  children: [
                    const Text(
                      'Already registered? ', // دي الجملة اللي بتسأل المستخدم لو عنده حساب
                      style: TextStyle(
                        color: Colors.grey, // ده لون الكلام
                        fontSize: 14, // ده حجم الخط
                      ),
                    ),

                    // ده الزرار اللي المستخدم بيدوس عليه عشان يروح لصفحة تسجيل الدخول
                    TextButton(
                      onPressed: () { // دي بتشتغل لما المستخدم يدوس على Log In
                        Navigator.push( // هنا بننقل المستخدم لصفحة تانية
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(), // هنا بنحدد إن الصفحة الجديدة هي صفحة تسجيل الدخول
                          ),
                        );
                      },

                      // هنا بنظبط شكل الزرار والمسافات بتاعته
                      style: TextButton.styleFrom(
                        padding: EdgeInsets.zero, // هنا بنشيل المسافة اللي حوالين الكلام
                        minimumSize: Size.zero, // هنا بنخلي أقل حجم للزرار صفر
                        tapTargetSize:
                            MaterialTapTargetSize.shrinkWrap, // هنا بنخلي مساحة الضغط على قد حجم الزرار
                      ),

                      child: const Text(
                        'Log In', // ده الكلام اللي بيظهر على الزرار
                        style: TextStyle(
                          color: Color(0xFF1E3A8A), // ده لون الكلام
                          fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض
                          fontSize: 14, // ده حجم الخط
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24), // دي مسافة قبل زرار إنشاء الحساب

              // ده زرار إنشاء الحساب
              SizedBox(
                width: double.infinity, // هنا بنخلي الزرار ياخد عرض الصفحة كله
                height: 50, // ده ارتفاع الزرار

                child: ElevatedButton(
                  // هنا بنظبط شكل الزرار
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF194275), // ده لون خلفية الزرار

                    // هنا بنخلي أطراف الزرار دائرية
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    elevation: 0, // هنا بنشيل الظل اللي تحت الزرار
                  ),

                  onPressed: _validateAndSubmit, // لما المستخدم يدوس على الزرار بنشغل دالة التأكد من الباسورد

                  child: const Text(
                    'Create Account', // ده الكلام اللي بيظهر جوه الزرار
                    style: TextStyle(
                      fontSize: 16, // ده حجم الخط
                      fontWeight: FontWeight.bold, // هنا بنخلي الخط عريض
                      color: Colors.white, // ده لون الكلام أبيض
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20), // دي مسافة في آخر الصفحة
            ],
          ),
        ),
      ),
    );
  }

  // دي الدالة اللي بنستخدمها عشان نعمل عنوان فوق كل خانة
  Widget _buildTextFieldLabel(String label) {
    return Text(
      label, // هنا بنعرض اسم الخانة اللي بعتناه للدالة
      style: const TextStyle(
        fontSize: 13, // ده حجم الخط
        fontWeight: FontWeight.w600, // هنا بنخلي الخط عريض شوية
        color: Color(0xFF475569), // ده لون عنوان الخانة
      ),
    );
  }

  // دي الدالة اللي بنستخدمها عشان نعمل خانات الكتابة بنفس الشكل
  Widget _buildTextField({required String hintText}) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText, // هنا بنعرض الكلام اللي بيظهر جوه الخانة قبل ما المستخدم يكتب

        hintStyle: const TextStyle(
          color: Colors.black87, // ده لون الكلام اللي جوه الخانة
          fontSize: 14, // ده حجم الخط
        ),

        filled: true, // هنا بنخلي للخانة لون خلفية
        fillColor: const Color(0xFFF1F5F9), // ده لون خلفية الخانة

        // هنا بنظبط شكل إطار الخانة
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12), // هنا بنخلي أطراف الخانة دائرية
          borderSide: BorderSide.none, // هنا بنشيل الإطار اللي حوالين الخانة
        ),

        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16, // دي المسافة من اليمين والشمال جوه الخانة
          vertical: 16, // ودي المسافة من فوق وتحت جوه الخانة
        ),
      ),
    );
  }
}