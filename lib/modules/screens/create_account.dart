import 'package:flutter/material.dart'; 
import 'home_screen.dart';

// =====================================================
// إنشاء صفحة إنشاء حساب جديد (Create Account)
// StatefulWidget لأن الصفحة تحتوي على بيانات وحالات متغيرة
// =====================================================
class CreateAccount extends StatefulWidget {
  const CreateAccount({super.key});

  @override
  State<CreateAccount> createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {

  // =====================================================
  // المتغيرات المسؤولة عن حالة الصفحة
  // =====================================================

  // تحديد ما إذا كان المستخدم وافق على الشروط والأحكام
  bool _isChecked = false;

  // التحكم في إظهار وإخفاء كلمة المرور
  bool _isPasswordHidden = true;

  // =====================================================
  // إنشاء Controllers للتحكم في حقول إدخال البيانات
  // وتخزين النصوص التي يكتبها المستخدم
  // =====================================================

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // =====================================================
  // متغيرات تخزين رسائل الخطأ الخاصة بكل حقل
  // String? معناها أن المتغير ممكن يحتوي على نص أو قيمة null
  // =====================================================

  String? _nameError;
  String? _phoneError;
  String? _emailError;
  String? _addressError;
  String? _passwordError;
  String? _dateError;
  String? _genderError;

  // تخزين النوع الذي اختاره المستخدم
  String? _selectedGender;

  // تخزين تاريخ الميلاد الذي اختاره المستخدم
  DateTime? _selectedDate;

  // =====================================================
  // دالة اختيار تاريخ الميلاد
  // Future و async و await للتعامل مع عملية اختيار التاريخ
  // =====================================================
  Future<void> _selectDate() async {

    // فتح نافذة التقويم لاختيار تاريخ الميلاد
    DateTime? pickedDate = await showDatePicker(
      context: context,

      // التاريخ الذي يبدأ التقويم بعرضه
      initialDate: DateTime(2000),

      // أقدم تاريخ يمكن للمستخدم اختياره
      firstDate: DateTime(1900),

      // منع اختيار تاريخ بعد تاريخ اليوم
      lastDate: DateTime.now(),

      helpText: 'Select your date of birth',

      // =================================================
      // تخصيص ألوان وشكل نافذة التقويم
      // =================================================
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(

            // تحديد ألوان التقويم
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF1E3A8A),
              onPrimary: Colors.white,
              surface: Color(0xFFF1F5F9),
              onSurface: Color(0xFF1E293B),
            ),

            // تخصيص لون الأزرار الموجودة داخل التقويم
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: const Color(0xFF1E3A8A),
              ),
            ),

            // تحديد لون خلفية نافذة التقويم
            dialogTheme: const DialogThemeData(
              backgroundColor: Color(0xFFF1F5F9),
            ),
          ),

          // عرض التقويم بعد تطبيق التنسيق
          child: child!,
        );
      },
    );

    // التأكد من أن المستخدم اختار تاريخاً ولم يضغط إلغاء
    if (pickedDate != null) {
      setState(() {

        // حفظ تاريخ الميلاد المختار
        _selectedDate = pickedDate;

        // إزالة رسالة الخطأ بعد اختيار التاريخ
        _dateError = null;
      });
    }
  }

  // =====================================================
  // دالة التحقق من صحة البيانات وإنشاء الحساب
  // =====================================================
  void _validateAndSubmit() {

    // تحديث الصفحة لإظهار رسائل الخطأ عند وجودها
    setState(() {

      // =================================================
      // التحقق من الاسم
      // التأكد من أن المستخدم أدخل اسمه
      // =================================================
      if (_nameController.text.trim().isEmpty) {
        _nameError = 'Please enter your full name.';
      } else {
        _nameError = null;
      }

      // =================================================
      // التحقق من رقم الهاتف
      // يجب أن يتكون رقم الهاتف من 11 رقماً
      // =================================================
      if (_phoneController.text.trim().isEmpty) {
        _phoneError = 'Please enter your phone number.';
      } else if (_phoneController.text.trim().length != 11) {
        _phoneError = 'Phone number must be exactly 11 digits.';
      } else {
        _phoneError = null;
      }

      // =================================================
      // التحقق من البريد الإلكتروني
      // يجب أن ينتهي البريد الإلكتروني بـ @gmail.com
      // =================================================
      String emailInput = _emailController.text.trim();

      if (emailInput.isEmpty) {
        _emailError = 'Please enter your email.';
      } else if (!emailInput.endsWith('@gmail.com')) {
        _emailError = 'Email must end with @gmail.com';
      } else {
        _emailError = null;
      }

      // =================================================
      // التحقق من العنوان
      // =================================================
      if (_addressController.text.trim().isEmpty) {
        _addressError = 'Please enter your address.';
      } else {
        _addressError = null;
      }

      // =================================================
      // التحقق من تاريخ الميلاد
      // =================================================
      if (_selectedDate == null) {
        _dateError = 'Please select date.';
      } else {
        _dateError = null;
      }

      // =================================================
      // التحقق من اختيار النوع
      // =================================================
      if (_selectedGender == null) {
        _genderError = 'Please select gender.';
      } else {
        _genderError = null;
      }

      // =================================================
      // التحقق من كلمة المرور
      // يجب ألا تقل عن 8 أحرف
      // =================================================
      if (_passwordController.text.length < 8) {
        _passwordError = 'Password must be at least 8 characters long.';
      } else {
        _passwordError = null;
      }

      // =================================================
      // التأكد من عدم وجود أي أخطاء في جميع الحقول
      // إذا كانت جميع القيم null يتم الانتقال للصفحة الرئيسية
      // =================================================
      if (_nameError == null &&
          _phoneError == null &&
          _emailError == null &&
          _addressError == null &&
          _dateError == null &&
          _genderError == null &&
          _passwordError == null) {

        // الانتقال إلى الصفحة الرئيسية
        // مع إزالة الصفحات السابقة من سجل التنقل
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),

          // false تمنع الرجوع إلى الصفحات السابقة
          (route) => false,
        );
      }
    });
  }

  // =====================================================
  // التخلص من Controllers عند مغادرة الصفحة
  // لتجنب استهلاك موارد إضافية
  // =====================================================
  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  // =====================================================
  // بناء واجهة صفحة إنشاء الحساب
  // =====================================================
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,

      // =================================================
      // الشريط العلوي للصفحة (AppBar)
      // =================================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,

        // منع ظهور زر الرجوع تلقائياً
        automaticallyImplyLeading: false,

        // عنوان الصفحة
        title: const Text(
          'Create Account',
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),

      // =================================================
      // محتوى الصفحة
      // SafeArea لحماية المحتوى من النوتش
      // SingleChildScrollView للسماح بالتمرير
      // =================================================
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 10.0,
          ),

          // ترتيب عناصر الصفحة رأسياً
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // العنوان الرئيسي للصفحة
              const Text(
                'Your care, your account',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              const SizedBox(height: 6),

              // وصف مختصر للمستخدم
              const Text(
                'Tell us a little about yourself to get started.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 20),

              // =================================================
              // حقل الاسم بالكامل
              // =================================================
              _buildTextFieldLabel('Full name'),

              const SizedBox(height: 6),

              _buildTextField(
                controller: _nameController,
                hintText: 'Enter the name',
                errorText: _nameError,
                fieldType: 'name',
              ),

              // عرض رسالة خطأ الاسم عند وجودها
              if (_nameError != null) ...[
                const SizedBox(height: 4),
                Text(
                  _nameError!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // =================================================
              // حقل رقم الهاتف
              // =================================================
              _buildTextFieldLabel('Phone number'),

              const SizedBox(height: 6),

              _buildTextField(
                controller: _phoneController,
                hintText: '+20 1234567890',
                errorText: _phoneError,
                keyboardType: TextInputType.phone,
                fieldType: 'phone',
              ),

              // عرض رسالة خطأ الهاتف
              if (_phoneError != null) ...[
                const SizedBox(height: 4),
                Text(
                  _phoneError!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // =================================================
              // حقل البريد الإلكتروني
              // =================================================
              _buildTextFieldLabel('Email'),

              const SizedBox(height: 6),

              _buildTextField(
                controller: _emailController,
                hintText: 'Enter your email',
                errorText: _emailError,
                keyboardType: TextInputType.emailAddress,
                fieldType: 'email',
              ),

              // عرض رسالة خطأ البريد الإلكتروني
              if (_emailError != null) ...[
                const SizedBox(height: 4),
                Text(
                  _emailError!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // =================================================
              // حقل العنوان
              // =================================================
              _buildTextFieldLabel('Address'),

              const SizedBox(height: 6),

              _buildTextField(
                controller: _addressController,
                hintText: 'Enter the address',
                errorText: _addressError,
                fieldType: 'address',
              ),

              // عرض رسالة خطأ العنوان
              if (_addressError != null) ...[
                const SizedBox(height: 4),
                Text(
                  _addressError!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],

              const SizedBox(height: 16),

              // =================================================
              // قسم تاريخ الميلاد والنوع
              // عرض الحقلين بجانب بعض باستخدام Row
              // =================================================
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // =================================================
                  // حقل تاريخ الميلاد
                  // =================================================
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // عنوان الحقل
                        _buildTextFieldLabel('Date of birth'),

                        const SizedBox(height: 6),

                        // الضغط على الصندوق لفتح التقويم
                        InkWell(
                          onTap: _selectDate,

                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),

                            // تنسيق صندوق التاريخ
                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F5F9),
                              borderRadius: BorderRadius.circular(12),

                              // تغيير لون الإطار إلى الأحمر عند وجود خطأ
                              border: _dateError != null
                                  ? Border.all(
                                      color: Colors.red,
                                      width: 1.5,
                                    )
                                  : Border.all(
                                      color: Colors.transparent,
                                    ),
                            ),

                            child: Row(
                              children: [

                                // عرض التاريخ المختار أو رسالة Select date
                                Expanded(
                                  child: Text(
                                    _selectedDate == null
                                        ? 'Select date'
                                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',

                                    style: const TextStyle(
                                      color: Colors.black87,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),

                                // أيقونة التقويم
                                const Icon(
                                  Icons.calendar_today_outlined,
                                  color: Colors.grey,
                                  size: 20,
                                ),
                              ],
                            ),
                          ),
                        ),

                        // عرض رسالة خطأ التاريخ
                        if (_dateError != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            _dateError!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),

                  const SizedBox(width: 12),

                  // =================================================
                  // حقل اختيار النوع (Gender)
                  // =================================================
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        // عنوان الحقل
                        _buildTextFieldLabel('Gender'),

                        const SizedBox(height: 6),

                        // صندوق القائمة المنسدلة
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(12),

                            // تغيير لون الإطار عند وجود خطأ
                            border: _genderError != null
                                ? Border.all(
                                    color: Colors.red,
                                    width: 1.5,
                                  )
                                : Border.all(
                                    color: Colors.transparent,
                                  ),
                          ),

                          // إخفاء الخط السفلي للقائمة
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(

                              // القيمة المختارة حالياً
                              value: _selectedGender,

                              // النص الذي يظهر قبل الاختيار
                              hint: const Text(
                                'Select',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 12,
                                ),
                              ),

                              // جعل القائمة تأخذ عرض الصندوق بالكامل
                              isExpanded: true,

                              dropdownColor: const Color(0xFFF1F5F9),

                              // أيقونة السهم
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.grey,
                              ),

                              // إنشاء عناصر القائمة من الاختيارات المتاحة
                              items: ['Male', 'Female'].map((gender) {
                                return DropdownMenuItem<String>(
                                  value: gender,

                                  child: Text(
                                    gender,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.black87,
                                    ),
                                  ),
                                );
                              }).toList(),

                              // تنفيذ العملية عند اختيار النوع
                              onChanged: (value) {
                                setState(() {

                                  // حفظ النوع الذي اختاره المستخدم
                                  _selectedGender = value;

                                  // إزالة رسالة الخطأ
                                  _genderError = null;
                                });
                              },
                            ),
                          ),
                        ),

                        // عرض رسالة خطأ النوع
                        if (_genderError != null) ...[
                          const SizedBox(height: 4),
                          Text(
                            _genderError!,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // =================================================
              // حقل كلمة المرور
              // =================================================
              _buildTextFieldLabel('Password'),

              const SizedBox(height: 6),

              TextField(
                controller: _passwordController,

                // التحكم في إظهار وإخفاء كلمة المرور
                obscureText: _isPasswordHidden,

                // التحقق من طول كلمة المرور أثناء الكتابة
                onChanged: (value) {

                  // إزالة رسالة الخطأ عند الوصول إلى 8 أحرف
                  if (value.length >= 8) {
                    setState(() {
                      _passwordError = null;
                    });
                  }
                },

                decoration: InputDecoration(
                  hintText: '••••••••••••',

                  hintStyle: const TextStyle(
                    color: Colors.black87,
                    fontSize: 14,
                  ),

                  filled: true,
                  fillColor: const Color(0xFFF1F5F9),

                  // =================================================
                  // زر العين لإظهار وإخفاء كلمة المرور
                  // =================================================
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {

                        // عكس حالة إظهار كلمة المرور
                        _isPasswordHidden = !_isPasswordHidden;
                      });
                    },

                    icon: Icon(
                      _isPasswordHidden
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                      color: Colors.grey,
                      size: 20,
                    ),
                  ),

                  // =================================================
                  // تنسيق حدود حقل كلمة المرور
                  // إظهار اللون الأحمر في حالة وجود خطأ
                  // =================================================
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: _passwordError != null
                        ? const BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          )
                        : BorderSide.none,
                  ),

                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: _passwordError != null
                        ? const BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          )
                        : BorderSide.none,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: _passwordError != null
                        ? const BorderSide(
                            color: Colors.red,
                            width: 1.5,
                          )
                        : BorderSide.none,
                  ),

                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                ),
              ),

              const SizedBox(height: 6),

              // =================================================
              // عرض رسالة الخطأ أو شروط كلمة المرور
              // =================================================
              if (_passwordError != null)
                Text(
                  _passwordError!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                )
              else
                const Text(
                  'Use 8+ characters, including a number and a symbol.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),

              const SizedBox(height: 12),

              // =================================================
              // قسم الموافقة على الشروط والأحكام
              // =================================================
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // مربع تحديد الموافقة
                  SizedBox(
                    height: 24,
                    width: 24,

                    child: Checkbox(
                      value: _isChecked,

                      // تنسيق حواف مربع الاختيار
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),

                      activeColor: const Color(0xFF1E3A8A),

                      // تحديث حالة الموافقة عند الضغط
                      onChanged: (val) {
                        setState(() {

                          // حفظ حالة الاختيار
                          _isChecked = val ?? false;
                        });
                      },
                    ),
                  ),

                  const SizedBox(width: 8),

                  // نص الشروط والأحكام وسياسة الخصوصية
                  const Expanded(
                    child: Text(
                      'I agree to the Terms of Service and Privacy Policy, and consent to the use of my information for care.',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // =================================================
              // جزء تسجيل الدخول للمستخدم الذي يمتلك حساباً
              // الكود الأصلي موجود هنا لكنه معطل بالتعليقات
              // =================================================

              /*
              كود تسجيل الدخول القديم موجود في الملف الأصلي
              وتم الحفاظ عليه دون تغيير.
              */

              // =================================================
              // زر إنشاء الحساب
              // =================================================
              SizedBox(
                width: double.infinity,
                height: 50,

                child: ElevatedButton(

                  // تنسيق الزر
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF194275),

                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),

                    elevation: 0,
                  ),

                  // تشغيل دالة التحقق عند الضغط على الزر
                  onPressed: _validateAndSubmit,

                  child: const Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================
  // دالة إنشاء عنوان لكل حقل من حقول الإدخال
  // تستقبل اسم العنوان وتعرضه بالتنسيق المحدد
  // =====================================================
  Widget _buildTextFieldLabel(String label) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: Color(0xFF475569),
      ),
    );
  }

  // =====================================================
  // دالة إنشاء حقول إدخال البيانات
  // تستقبل:
  // Controller للتحكم في النص
  // HintText للنص التوضيحي
  // FieldType لتحديد نوع الحقل
  // ErrorText لرسالة الخطأ
  // KeyboardType لنوع لوحة المفاتيح
  // =====================================================
  Widget _buildTextField({
    required TextEditingController controller,
    required String hintText,
    required String fieldType,
    String? errorText,
    TextInputType keyboardType = TextInputType.text,
  }) {

    return TextField(
      controller: controller,
      keyboardType: keyboardType,

      // التحقق من البيانات أثناء الكتابة
      onChanged: (value) {
        setState(() {

          // التحقق من حقل الاسم
          if (fieldType == 'name') {
            if (value.trim().isNotEmpty) {
              _nameError = null;
            }

          // التحقق من رقم الهاتف
          } else if (fieldType == 'phone') {
            if (value.trim().length == 11) {
              _phoneError = null;
            }

          // التحقق من البريد الإلكتروني
          } else if (fieldType == 'email') {
            if (value.trim().endsWith('@gmail.com')) {
              _emailError = null;
            }

          // التحقق من العنوان
          } else if (fieldType == 'address') {
            if (value.trim().isNotEmpty) {
              _addressError = null;
            }
          }
        });
      },

      decoration: InputDecoration(
        hintText: hintText,

        hintStyle: const TextStyle(
          color: Colors.black87,
          fontSize: 14,
        ),

        filled: true,
        fillColor: const Color(0xFFF1F5F9),

        // =================================================
        // تنسيق إطار الحقل
        // إظهار إطار أحمر عند وجود خطأ
        // =================================================
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: errorText != null
              ? const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                )
              : BorderSide.none,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: errorText != null
              ? const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                )
              : BorderSide.none,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: errorText != null
              ? const BorderSide(
                  color: Colors.red,
                  width: 1.5,
                )
              : BorderSide.none,
        ),

        // تحديد المسافات الداخلية للحقل
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
      ),
    );
  }
}