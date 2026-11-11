import 'package:flutter/material.dart';
import 'package:grand_hospital_app/modules/color.dart';
import 'home_screen.dart';
import 'doctors_list_1.dart';
import 'doctors_list_2.dart';
import 'doctors_list_3.dart';
import 'doctors_list_4.dart';
import 'doctors_list_5.dart';
import 'doctors_list_6.dart';

// =====================================================
// إنشاء صفحة التخصصات الطبية
// StatefulWidget لأن الصفحة تحتوي على متغير بيتغير
// وهو رقم العنصر المحدد في شريط التنقل السفلي
// =====================================================
class MedicalSpecialtiesScreen extends StatefulWidget {
  const MedicalSpecialtiesScreen({super.key});

  @override
  State<MedicalSpecialtiesScreen> createState() =>
      _MedicalSpecialtiesScreenState();
}

class _MedicalSpecialtiesScreenState extends State<MedicalSpecialtiesScreen> {

  // حفظ رقم العنصر المحدد حالياً في شريط التنقل السفلي
  // القيمة 0 تعني أن أول عنصر هو المحدد
  int _currentIndex = 0;

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
        centerTitle: false,

        // زر الرجوع إلى الصفحة السابقة
        // Navigator.pop بيرجع المستخدم للشاشة الموجودة قبل الحالية
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.darkText,
            size: 18,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        // عنوان صفحة التخصصات الطبية
        title: const Text(
          'Medical Specialties',
          style: TextStyle(
            color: AppColors.darkText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =================================================
      // محتوى الصفحة الرئيسي
      // SingleChildScrollView للسماح بالتمرير
      // لأن عدد التخصصات ممكن يتجاوز مساحة الشاشة
      // =================================================
      body: SingleChildScrollView(
        child: Padding(
          // إضافة مسافة داخلية حول محتوى الصفحة
          padding: const EdgeInsets.all(16),

          child: Column(
            // ترتيب العناصر من بداية الصفحة
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [

              // وصف مختصر يساعد المستخدم على اختيار التخصص المناسب
              const Text(
                'Find the right specialist for your needs.',
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.greyText,
                ),
              ),

              const SizedBox(height: 16),

              // =================================================
              // مربع البحث عن التخصصات الطبية
              // =================================================
              TextField(
                decoration: InputDecoration(

                  // النص الذي يظهر داخل مربع البحث قبل الكتابة
                  hintText: 'Search specialties',

                  hintStyle: const TextStyle(
                    color: AppColors.greyText,
                  ),

                  // إضافة أيقونة البحث داخل مربع البحث
                  prefixIcon: const Icon(
                    Icons.search,
                    color: AppColors.greyText,
                  ),

                  // تفعيل لون الخلفية لمربع البحث
                  filled: true,
                  fillColor: AppColors.searchBackground,

                  // تحديد شكل وحواف مربع البحث
                  // borderSide.none لإخفاء إطار مربع البحث
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // =================================================
              // قائمة التخصصات الطبية المتاحة بالمستشفى
              // كل تخصص يحتوي على أيقونة واسم ووصف وعدد الأطباء
              // =================================================

              // التخصص الأول: الباطنة
              _buildSpecialtyCard(
                icon: Icons.medical_services_outlined,
                title: 'Internal Medicine',
                subtitle: 'Adult health & ongoing care',
                doctorsCount: '3 doctors',

                // عند الضغط على التخصص يتم فتح صفحة أطباء الباطنة
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsListScreen1(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              // التخصص الثاني: المخ والأعصاب
              _buildSpecialtyCard(
                icon: Icons.psychology_outlined,
                title: 'Neurology',
                subtitle: 'Imaging & diagnostic scans',
                doctorsCount: '3 doctors',

                // الانتقال إلى صفحة أطباء المخ والأعصاب
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsListScreen2(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              // التخصص الثالث: القلب
              _buildSpecialtyCard(
                icon: Icons.monitor_heart_outlined,
                title: 'Cardiology',
                subtitle: 'Heart & vascular health',
                doctorsCount: '3 doctors',

                // الانتقال إلى صفحة أطباء القلب
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsListScreen3(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              // التخصص الرابع: الأطفال
              _buildSpecialtyCard(
                icon: Icons.child_care,
                title: 'Pediatrics',
                subtitle: 'Care for children & teens',
                doctorsCount: '3 doctors',

                // الانتقال إلى صفحة أطباء الأطفال
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsListScreen4(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              // التخصص الخامس: العظام
              _buildSpecialtyCard(
                icon: Icons.healing_outlined,
                title: 'Orthopedics',
                subtitle: 'Bones, joints & movement',
                doctorsCount: '3 doctors',

                // الانتقال إلى صفحة أطباء العظام
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsListScreen5(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 12),

              // التخصص السادس: الجلدية
              _buildSpecialtyCard(
                icon: Icons.face_outlined,
                title: 'Dermatology',
                subtitle: 'Skin, hair & nail health',
                doctorsCount: '3 doctors',

                // الانتقال إلى صفحة أطباء الجلدية
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DoctorsListScreen6(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),

      // =====================================================
      // شريط التنقل السفلي (Bottom Navigation Bar)
      // يحتوي على أربعة أقسام رئيسية في التطبيق
      // =====================================================
      bottomNavigationBar: BottomNavigationBar(

        // تحديد رقم العنصر النشط حالياً
        // القيمة مرتبطة بالمتغير _currentIndex
        currentIndex: _currentIndex,

        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyText,

        // fixed يجعل جميع عناصر شريط التنقل ظاهرة
        // حتى لو كان عدد العناصر أكثر من ثلاثة
        type: BottomNavigationBarType.fixed,

        // =================================================
        // تنفيذ حدث عند الضغط على أي عنصر في شريط التنقل
        // =================================================
        onTap: (index) {

          // تحديث رقم العنصر المحدد
          // setState تجعل Flutter يعيد بناء الواجهة
          // حتى يظهر العنصر الجديد على أنه نشط
          setState(() {
            _currentIndex = index;
          });

          // تحديد الإجراء المطلوب حسب رقم العنصر المختار
          switch (index) {

            case 0:
              // =========================================
              // العودة إلى الصفحة الرئيسية (Home)
              // =========================================

              // pushAndRemoveUntil للانتقال إلى HomeScreen
              // مع حذف الصفحات السابقة من سجل التنقل
              // الشرط false يعني إزالة جميع الصفحات القديمة
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
              break;

            case 1:
              // قسم المواعيد (Appointments)
              // سيتم ربطه بصفحة المواعيد لاحقاً
              break;

            case 2:
              // قسم الخدمات (Services)
              // سيتم ربطه بصفحة الخدمات لاحقاً
              break;

            case 3:
              // قسم الإعدادات (Settings)
              // سيتم ربطه بصفحة الإعدادات لاحقاً
              break;
          }
        },

        // =================================================
        // عناصر شريط التنقل السفلي
        // كل عنصر يحتوي على أيقونة عادية وأيقونة عند التحديد
        // =================================================
        items: [

          // زر الصفحة الرئيسية
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),

            // activeIcon هي الأيقونة التي تظهر عند تحديد العنصر
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(

                // إضافة خلفية شفافة حول الأيقونة النشطة
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
  // دالة إنشاء بطاقة التخصص الطبي
  // _buildSpecialtyCard مسؤولة عن تصميم بطاقة واحدة
  // بدلاً من كتابة نفس كود التصميم لكل تخصص
  //
  // تستقبل الدالة:
  // icon         : الأيقونة الخاصة بالتخصص
  // title        : اسم التخصص
  // subtitle     : وصف التخصص
  // doctorsCount : عدد الأطباء
  // onTap        : الأمر الذي يتم تنفيذه عند الضغط
  // =====================================================
  Widget _buildSpecialtyCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String doctorsCount,
    required VoidCallback onTap,
  }) {

    // InkWell لإضافة إمكانية الضغط على البطاقة
    // وتنفيذ الدالة onTap عند الضغط عليها
    return InkWell(
      onTap: onTap,

      // تحديد شكل الحواف الخاصة بتأثير الضغط
      borderRadius: BorderRadius.circular(16),

      child: Container(
        // إضافة مسافة داخلية بين محتوى البطاقة وحدودها
        padding: const EdgeInsets.all(16),

        // =================================================
        // تنسيق شكل بطاقة التخصص
        // =================================================
        decoration: BoxDecoration(
          color: Colors.white,

          // تحديد انحناء زوايا البطاقة
          borderRadius: BorderRadius.circular(16),

          // إضافة إطار خارجي بلون رمادي فاتح
          border: Border.all(
            color: const Color(0xFFE2E8F0),
            width: 1,
          ),
        ),

        // Row لترتيب الأيقونة والبيانات والسهم أفقياً
        child: Row(
          children: [

            // =================================================
            // مربع الأيقونة الخاصة بالتخصص
            // =================================================
            Container(
              width: 56,
              height: 56,

              decoration: BoxDecoration(
                color: AppColors.cardBackground,
                borderRadius: BorderRadius.circular(14),
              ),

              // عرض الأيقونة التي تم إرسالها إلى الدالة
              child: Icon(
                icon,
                color: AppColors.primary,
                size: 28,
              ),
            ),

            const SizedBox(width: 16),

            // =================================================
            // بيانات التخصص
            // Expanded للسماح للبيانات باستخدام المساحة المتاحة
            // داخل Row دون تجاوز حدود البطاقة
            // =================================================
            Expanded(
              child: Column(

                // ترتيب النصوص من بداية العمود
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [

                  // اسم التخصص الطبي
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // وصف التخصص الطبي
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      color: AppColors.greyText,
                    ),
                  ),

                  const SizedBox(height: 4),

                  // عدد الأطباء المتاحين داخل التخصص
                  Text(
                    doctorsCount,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ],
              ),
            ),

            // =================================================
            // سهم جانبي يوضح إمكانية فتح بطاقة التخصص
            // =================================================
            const Icon(
              Icons.chevron_right,
              color: AppColors.greyText,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }
}
