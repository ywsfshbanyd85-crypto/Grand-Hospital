import 'package:flutter/material.dart';
import 'package:grand_hospital_app/modules/color.dart';
import 'home_screen.dart';

// هنا بنعمل صفحة عرض الدكاترة الخاصة بتخصص الجلدية
class DoctorsListScreen6 extends StatefulWidget {
  const DoctorsListScreen6({super.key});

  @override
  State<DoctorsListScreen6> createState() => _DoctorsListScreen1State();
}

class _DoctorsListScreen1State extends State<DoctorsListScreen6> {

  // متغير بيحفظ رقم التبويب الحالي في الـ Bottom Navigation Bar
  int _currentIndex = 0;

  // دي الدالة المسؤولة عن بناء وعرض الصفحة
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // الشريط العلوي الخاص بعنوان الصفحة وزر الرجوع
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,

        // زر الرجوع للصفحة السابقة
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.darkText,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),

        title: const Text(
          'Doctors List',
          style: TextStyle(
            color: AppColors.darkText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // هنا بنستخدم SingleChildScrollView عشان نقدر نعمل Scroll للصفحة
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // شريط البحث عن اسم الدكتور
            TextField(
              decoration: InputDecoration(
                hintText: 'Search doctor name',
                hintStyle: const TextStyle(color: AppColors.greyText),
                prefixIcon: const Icon(Icons.search, color: AppColors.greyText),
                filled: true,
                fillColor: AppColors.searchBackground,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),

            const SizedBox(height: 16),

            // هنا بنعرض اسم التخصص وأيقونة الفلتر
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.searchBackground,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.face_retouching_natural,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Dermatology	',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        // Icon(Icons.keyboard_arrow_down, color: AppColors.primary),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // أيقونة الفلتر
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.searchBackground,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.tune, color: AppColors.primary),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // عدد الدكاترة وطريقة ترتيب ظهورهم
            const Text(
              '3 specialists · Sorted by next availability',
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 16),

            // كارت الدكتور الأول
            _buildDoctorCard(
              name: 'Dr. Jessy Sharm',
              specialty: 'Internal Medicine',
              experience: '12 years of experience',
              time: 'Today, 10:30 AM',
              price: '\$80 / consultation',
              imagePath: 'images/16_Jessy_Sharm.png',
            ),

            const SizedBox(height: 16),

            // كارت الدكتور الثاني
            _buildDoctorCard(
              name: 'Dr. Victor Michael',
              specialty: 'Internal Medicine',
              experience: '9 years of experience',
              time: 'Today, 2:00 PM',
              price: '\$75 / consultation',
              imagePath: 'images/17_Victor_Michael.png',
            ),

            const SizedBox(height: 16),

            // كارت الدكتور الثالث
            _buildDoctorCard(
              name: ' Dr. Walter Jonathan',
              specialty: 'Internal Medicine',
              experience: '15 years of experience',
              time: 'Tomorrow, 9:00 AM',
              price: '\$90 / consultation',
              imagePath: 'images/18_Walter_Jonathan.png',
            ),
          ],
        ),
      ),

      // Navbar شريط التنقل السفلي ال 
      
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyText,
        type: BottomNavigationBarType.fixed,

        // هنا بنحدد هيحصل إيه لما المستخدم يضغط على أي تبويب
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          switch (index) {

            case 0:
              // الرجوع للهوم ومسح الصفحات القديمة من سجل التنقل
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
              break;

            case 1:
              // الانتقال لصفحة المواعيد
              break;

            case 2:
              // الانتقال لصفحة الخدمات
              break;

            case 3:
              // الانتقال لصفحة الإعدادات
              break;
          }
        },

        items: [

          // زر الصفحة الرئيسية
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),
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
            icon: const Icon(Icons.settings_outlined),
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

  // دالة مسؤولة عن تصميم كارت الدكتور
  // استخدمنا Parameters عشان نقدر نغير بيانات كل دكتور بسهولة
  Widget _buildDoctorCard({
    required String name,
    required String specialty,
    required String experience,
    required String time,
    required String price,
    required String imagePath,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),

      // تنسيق شكل الكارت من حيث اللون والحواف والظل
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.searchBackground,
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      child: Column(
        children: [

          // الجزء الأول من الكارت: صورة الدكتور وبياناته
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // عرض صورة الدكتور من ملفات المشروع
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  imagePath,
                  width: 64,
                  height: 64,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              // عرض اسم الدكتور والتخصص وسنوات الخبرة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkText,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      specialty,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.greyText,
                      ),
                    ),

                    const SizedBox(height: 2),

                    Text(
                      experience,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // خط فاصل بين بيانات الدكتور والموعد والسعر
          const Divider(
            height: 1,
            color: AppColors.searchBackground,
          ),

          const SizedBox(height: 12),

          // الجزء الثاني من الكارت: الموعد والسعر وزر الحجز
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // عرض موعد الدكتور وسعر الكشف
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greenText,
                    ),
                  ),

                  const SizedBox(height: 2),

                  Text(
                    price,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.darkText,
                    ),
                  ),
                ],
              ),

              // زر حجز موعد مع الدكتور
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    elevation: 0,
                  ),

                  onPressed: () {},

                  child: const Text(
                    'Book',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
