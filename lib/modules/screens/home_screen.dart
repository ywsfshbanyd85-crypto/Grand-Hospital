
import 'package:flutter/material.dart';
import 'package:grand_hospital_app/modules/color.dart';

// استدعاء الصفحات التي يتم الانتقال إليها من الصفحة الرئيسية
import 'medical_specialties.dart';
import 'doctors_list_1.dart'; 
import 'doctors_list_2.dart'; 
import 'doctors_list_3.dart'; 
import 'doctors_list_4.dart'; 

// =====================================================
// إنشاء الصفحة الرئيسية للمستشفى
// StatefulWidget لأن الصفحة تحتوي على بيانات تتغير
// مثل الزر النشط في شريط التنقل والسلايدر
// =====================================================
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  // حفظ رقم العنصر المحدد حالياً في شريط التنقل السفلي
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =================================================
      // الشريط العلوي للتطبيق (AppBar)
      // =================================================
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        automaticallyImplyLeading: false,

        // اسم المستشفى أعلى الصفحة
        title: const Text(
          'Grand Hospital',
          style: TextStyle(
            color: Color.fromARGB(255, 5, 5, 5),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        // زر الإشعارات الموجود في الشريط العلوي
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications_none,
              color: AppColors.darkText,
            ),
          ),
        ],
      ),

      // =================================================
      // محتوى الصفحة الرئيسية
      // SingleChildScrollView للسماح بالتمرير لأعلى وأسفل
      // =================================================
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // رسالة الترحيب بالمستخدم
              const Text(
                'Good morning',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyText,
                ),
              ),

              const SizedBox(height: 4),

              // السؤال الرئيسي للمستخدم
              const Text(
                'How can we help you?',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: AppColors.darkText,
                ),
              ),

              const SizedBox(height: 16),

              // =================================================
              // مربع البحث عن الأطباء والتخصصات والخدمات
              // =================================================
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search doctors, specialties, services',
                  hintStyle: const TextStyle(
                    color: AppColors.greyText,
                  ),

                  // أيقونة البحث داخل مربع البحث
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.greyText,
                  ),

                  filled: true,
                  fillColor: AppColors.searchBackground,

                  // تنسيق حواف مربع البحث
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // =================================================
              // قسم الصور المتحركة الخاصة بالمستشفى
              // =================================================
              _buildSectionHeader('Your Health, Our Priority', ''),

              const SizedBox(height: 12),

              // استدعاء كلاس السلايدر لعرض الصور والنقاط
              const ImageSliderWithIndicator(),

              const SizedBox(height: 24),

              // =================================================
              // قسم التخصصات الطبية
              //  See all ينقل المستخدم إلى جميع التخصصات ب زر
              // =================================================
              _buildSectionHeader(
                'Medical specialties',
                'See all',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const MedicalSpecialtiesScreen(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              // =================================================
              // عرض التخصصات الطبية الرئيسية
              // كل تخصص يحتوي على أيقونة واسم وصفحة الأطباء
              // =================================================
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // تخصص الباطنة
                  _buildSpecialty(
                    context,
                    Icons.medical_services_outlined,
                    'Internal Medicine',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DoctorsListScreen1(),
                        ),
                      );
                    },
                  ),

                  // تخصص القلب
                  _buildSpecialty(
                    context,
                    Icons.monitor_heart_outlined,
                    'Cardiology',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DoctorsListScreen3(),
                        ),
                      );
                    },
                  ),

                  // تخصص الأطفال
                  _buildSpecialty(
                    context,
                    Icons.child_care,
                    'Pediatrics',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DoctorsListScreen4(),
                        ),
                      );
                    },
                  ),

                  // تخصص المخ والأعصاب
                  _buildSpecialty(
                    context,
                    Icons.psychology_outlined,
                    'Neurology',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              const DoctorsListScreen2(),
                        ),
                      );
                    },
                  ),
                ],
              ),

              const SizedBox(height: 25),

              // =================================================
              // قسم أطبائنا
              //  See all ينقل المستخدم إلى صفحة الأطباء ب زر
              // =================================================
              _buildSectionHeader(
                'Our doctors',
                'See all',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const DoctorsListScreen1(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 18),

              // =================================================
              // عرض بيانات أحد الأطباء في الصفحة الرئيسية
              // =================================================
              Row(
                children: [

                  // عرض صورة الدكتور من مجلد الصور
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'images/01_Ahmed_Gabr.png',
                      width: 64,
                      height: 64,
                      fit: BoxFit.cover,
                    ),
                  ),

                  const SizedBox(width: 12),

                  // بيانات الدكتور
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      // اسم الدكتور
                      Text(
                        'Dr. Ahmed Gabr',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: AppColors.darkText,
                        ),
                      ),

                      SizedBox(height: 2),

                      // التخصص الطبي
                      Text(
                        'Internal Medicine',
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.greyText,
                        ),
                      ),

                      SizedBox(height: 4),

                      // سنوات الخبرة وحالة التوفر
                      Text(
                        '12 years of experience · Available today',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // =================================================
              // قسم الخدمات الطبية المتاحة بالمستشفى
              // =================================================
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),

                // تنسيق خلفية وحواف صندوق الخدمات
                decoration: BoxDecoration(
                  color: AppColors.searchBackground,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [

                    // أيقونة الخدمات الطبية
                    const Icon(
                      Icons.document_scanner_outlined,
                      color: AppColors.primary,
                    ),

                    const SizedBox(width: 12),

                    // اسم الخدمات ووصفها
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Healthcare services',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: AppColors.darkText,
                            ),
                          ),

                          SizedBox(height: 2),

                          Text(
                            'Radiology, lab tests and more',
                            style: TextStyle(
                              fontSize: 13,
                              color: AppColors.greyText,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // سهم الانتقال
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // =====================================================
      // شريط التنقل السفلي (Bottom Navigation Bar)
      // يحتوي على أربعة أقسام رئيسية
      // =====================================================
      bottomNavigationBar: BottomNavigationBar(

        // تحديد الزر النشط حالياً
        currentIndex: _currentIndex,

        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyText,
        type: BottomNavigationBarType.fixed,

        // تنفيذ حدث عند الضغط على أي عنصر
        onTap: (index) {

          // تحديث رقم الزر المحدد وإعادة بناء الواجهة
          setState(() {
            _currentIndex = index;
          });

          // تحديد الإجراء حسب الزر الذي ضغط عليه المستخدم
          switch (index) {

            case 0:
              // قسم الصفحة الرئيسية Home
              break;

            case 1:
              // قسم المواعيد Appointments
              break;

            case 2:
              // قسم الخدمات Services
              break;

            case 3:
              // قسم الإعدادات Settings
              break;
          }
        },

        // عناصر شريط التنقل السفلي
        items: [

          // زر الصفحة الرئيسية
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),

            // شكل الأيقونة عند تحديدها
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.home),
            ),

            label: 'Home',
          ),

          // زر المواعيد
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_month_outlined),
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.calendar_month),
            ),
            label: 'Appointments',
          ),

          // زر الخدمات
          BottomNavigationBarItem(
            icon: const Icon(Icons.grid_view_outlined),
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.grid_view),
            ),
            label: 'Services',
          ),

          // زر الإعدادات
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.settings),
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  // =====================================================
  // دالة إنشاء عنصر التخصص الطبي
  // تستقبل الأيقونة والاسم ودالة الانتقال عند الضغط
  // =====================================================
  Widget _buildSpecialty(
    BuildContext context,
    IconData icon,
    String title, {
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: 72,

      // InkWell لإضافة إمكانية الضغط على التخصص
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(14),

        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),

          child: Column(
            children: [

              // صندوق الأيقونة
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  borderRadius: BorderRadius.circular(14),
                ),

                // عرض أيقونة التخصص
                child: Icon(
                  icon,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 8),

              // اسم التخصص أسفل الأيقونة
              Text(
                title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.darkText,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // =====================================================
  // دالة إنشاء عنوان الأقسام
  // تستقبل اسم القسم واسم الزر الاختياري ودالة الضغط
  // =====================================================
  Widget _buildSectionHeader(
    String title,
    String action, {
    VoidCallback? onTap,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [

        // عنوان القسم
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.darkText,
          ),
        ),

        // زر See all أو أي نص آخر قابل للضغط
        GestureDetector(
          onTap: onTap,
          child: Text(
            action,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}

// =========================================================
// كلاس السلايدر المسؤول عن عرض صور المستشفى
// مع نقاط توضح الصورة الحالية
// =========================================================
class ImageSliderWithIndicator extends StatefulWidget {
  const ImageSliderWithIndicator({super.key});

  @override
  State<ImageSliderWithIndicator> createState() =>
      _ImageSliderWithIndicatorState();
}

class _ImageSliderWithIndicatorState
    extends State<ImageSliderWithIndicator> {

  // حفظ رقم الصورة المعروضة حالياً
  int _currentIndex = 0;

  // التحكم في التنقل بين الصور
  final PageController _pageController = PageController();

  // التخلص من PageController عند إغلاق الصفحة
  // لتجنب استهلاك موارد إضافية
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // =================================================
        // مساحة عرض الصور باستخدام PageView
        // =================================================
        SizedBox(
          height: 180,

          child: PageView(
            controller: _pageController,

            // تحديث رقم الصورة عند الانتقال لصورة أخرى
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },

            // الصور الموجودة داخل السلايدر
            children: [

              // الصورة الأولى
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'images/banner_1.png',
                  fit: BoxFit.cover,
                ),
              ),

              // الصورة الثانية
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'images/banner_2.png',
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // =================================================
        // النقاط الموجودة أسفل الصور
        // النقطة النشطة تكون أكبر من باقي النقاط
        // =================================================
        Row(
          mainAxisAlignment: MainAxisAlignment.center,

          // إنشاء نقطتين بعدد الصور الموجودة
          children: List.generate(2, (index) {

            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),

              margin: const EdgeInsets.symmetric(horizontal: 4),

              // تغيير عرض النقطة حسب الصورة الحالية
              width: _currentIndex == index ? 20 : 8,
              height: 8,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),

                // تغيير لون النقطة النشطة
                color: _currentIndex == index
                    ? AppColors.primary
                    // ignore: deprecated_member_use
                    : AppColors.greyText.withOpacity(0.3),
              ),
            );
          }),
        ),
      ],
    );
  }
}
