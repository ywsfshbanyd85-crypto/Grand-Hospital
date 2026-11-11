import 'package:flutter/material.dart';
import 'package:grand_hospital_app/modules/color.dart';
import 'home_screen.dart';

// هنا بنعمل صفحة عرض الدكاترة الخاصة بتخصص العظام Orthopedics
class DoctorsListScreen5 extends StatefulWidget {
  const DoctorsListScreen5({super.key});

  @override
  State<DoctorsListScreen5> createState() => _DoctorsListScreen1State();
}

class _DoctorsListScreen1State extends State<DoctorsListScreen5> {
  // المتغير ده بيحفظ رقم التبويب الحالي في شريط التنقل
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // الشريط العلوي اللي فيه زر الرجوع وعنوان الصفحة
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: AppColors.darkText,
            size: 20,
          ),

          // لما المستخدم يضغط على السهم بيرجع للصفحة السابقة
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

      // محتوى الصفحة، واستخدمنا SingleChildScrollView
      // عشان نقدر نعمل Scroll لو المحتوى أكبر من مساحة الشاشة
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
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.greyText,
                ),
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

            // الجزء اللي بيعرض اسم التخصص وأيقونة الفلتر
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
                        // أيقونة تخصص العظام
                        Icon(
                          Icons.healing_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            'Orthopedics	',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        // أيقونة السهم موجودة في الكود الأصلي لكنها متعطلة
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
                  child: const Icon(
                    Icons.tune,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // هنا بنوضح عدد الدكاترة وطريقة ترتيب مواعيدهم
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
              name: 'Dr. Mohamed Samir',
              specialty: 'Orthopedics',
              experience: '12 years of experience',
              time: 'Today, 10:30 AM',
              price: '\$80 / consultation',
              imagePath: 'images/13_Mohamed_Samir.png',
            ),

            const SizedBox(height: 16),

            // كارت الدكتور التاني
            _buildDoctorCard(
              name: 'Dr. Karim Ashraf',
              specialty: 'Orthopedics',
              experience: '9 years of experience',
              time: 'Today, 2:00 PM',
              price: '\$75 / consultation',
              imagePath: 'images/14_Karim_Ashraf.png',
            ),

            const SizedBox(height: 16),

            // كارت الدكتور التالت
            _buildDoctorCard(
              name: 'Dr. Youssef Tarek',
              specialty: 'Orthopedics',
              experience: '15 years of experience',
              time: 'Tomorrow, 9:00 AM',
              price: '\$90 / consultation',
              imagePath: 'images/15_Youssef_Tarek.png',
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
            // بنحدث رقم التبويب المختار
            _currentIndex = index;
          });

          switch (index) {
            case 0:
              // لما يضغط على Home بنرجعه للشاشة الرئيسية
              // وبنمسح الصفحات القديمة من سجل التنقل
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
              break;

            case 1:
              // مكان الانتقال لصفحة المواعيد
              break;

            case 2:
              // مكان الانتقال لصفحة الخدمات
              break;

            case 3:
              // مكان الانتقال لصفحة الإعدادات
              break;
          }
        },

        // العناصر اللي بتظهر في شريط التنقل
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

  // الدالة دي مسؤولة عن تصميم كارت الدكتور
  // بدل ما نكرر نفس التصميم لكل دكتور، بنستدعيها ونبعتلها بياناته
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

              // بيانات الدكتور زي الاسم والتخصص وسنوات الخبرة
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

          // الجزء التاني من الكارت: الموعد والسعر وزر الحجز
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // موعد الدكتور المتاح
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greenText,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // سعر الكشف
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

                  // الزر موجود في التصميم لكن لسه مفيش إجراء مربوط بيه
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
