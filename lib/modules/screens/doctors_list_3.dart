import 'package:flutter/material.dart';
import 'package:grand_hospital_app/modules/color.dart';
import 'home_screen.dart';

// =====================================================
//Cardiology إنشاء صفحة قائمة أطباء القلب 
// =====================================================

// استخدمنا StatefulWidget لأن الصفحة فيها حالة ممكن تتغير
// زي العنصر المحدد في شريط التنقل السفلي
class DoctorsListScreen3 extends StatefulWidget {
  const DoctorsListScreen3({super.key});

  @override
  State<DoctorsListScreen3> createState() => _DoctorsListScreen1State();
}

// =====================================================
// إدارة الحالة الخاصة بالصفحة
// =====================================================

class _DoctorsListScreen1State extends State<DoctorsListScreen3> {

  // المتغير ده بيحدد العنصر المختار في شريط التنقل
  // 0 معناها إن أول عنصر Home هو المحدد
  int _currentIndex = 0;

  // =====================================================
  // بناء واجهة صفحة قائمة الأطباء
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // =====================================================
      // الشريط العلوي AppBar
      // =====================================================

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

        // عنوان الصفحة
        title: const Text(
          'Doctors List',
          style: TextStyle(
            color: AppColors.darkText,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      // =====================================================
      // محتوى الصفحة الرئيسي
      // =====================================================

      body: SingleChildScrollView(
        // إضافة مسافات حوالين محتويات الصفحة
        // والتمرير بيسمح بعرض المحتوى لو أطول من الشاشة
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // =====================================================
            // مربع البحث عن الأطباء
            // =====================================================

            TextField(
              decoration: InputDecoration(
                hintText: 'Search doctor name',
                hintStyle: const TextStyle(
                  color: AppColors.greyText,
                ),

                // أيقونة البحث داخل مربع النص
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.greyText,
                ),

                filled: true,
                fillColor: AppColors.searchBackground,

                // تحديد شكل مربع البحث
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),

                contentPadding: const EdgeInsets.symmetric(
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // =====================================================
            // عرض التخصص الطبي وأيقونة الفلترة
            // =====================================================

            Row(
              children: [

                // Expanded بتخلي صندوق التخصص ياخد المساحة المتاحة
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

                        // أيقونة تخصص القلب
                        Icon(
                          Icons.monitor_heart_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),

                        SizedBox(width: 10),

                        // اسم التخصص الطبي
                        Expanded(
                          child: Text(
                            'Cardiology',
                            style: TextStyle(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(width: 12),

                // أيقونة الفلترة
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

            // =====================================================
            // عرض عدد الأطباء وطريقة ترتيبهم
            // =====================================================

            const Text(
              '3 specialists · Sorted by next availability',
              style: TextStyle(
                color: AppColors.greyText,
                fontSize: 13,
              ),
            ),

            const SizedBox(height: 16),

            // =====================================================
            // قائمة الأطباء
            // =====================================================

            // بنستدعي نفس الدالة لكل دكتور وبنبعتلها بياناته
            // علشان تعرض كل دكتور في كارت بنفس التصميم

            _buildDoctorCard(
              name: 'Dr. Rami Raafat',
              specialty: 'Cardiology',
              experience: '12 years of experience',
              time: 'Today, 10:30 AM',
              price: '\$80 / consultation',
              imagePath: 'images/07_Rami_Raafat.png',
            ),

            const SizedBox(height: 16),

            _buildDoctorCard(
              name: 'Dr. Yahya Zakaria',
              specialty: 'Cardiology',
              experience: '9 years of experience',
              time: 'Today, 2:00 PM',
              price: '\$75 / consultation',
              imagePath: 'images/08_Yahya_Zakaria.png',
            ),

            const SizedBox(height: 16),

            _buildDoctorCard(
              name: 'Dr. Amira El-Mohammadi',
              specialty: 'Cardiology',
              experience: '15 years of experience',
              time: 'Tomorrow, 9:00 AM',
              price: '\$90 / consultation',
              imagePath: 'images/09_Amira_El_Mohammadi.png',
            ),
          ],
        ),
      ),

      // =====================================================
      // Navbar شريط التنقل السفلي ال 
      // =====================================================

      bottomNavigationBar: BottomNavigationBar(
        // تحديد العنصر النشط حاليًا
        currentIndex: _currentIndex,

        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyText,
        type: BottomNavigationBarType.fixed,

        // الدالة دي بتشتغل لما المستخدم يضغط على أي عنصر
        onTap: (index) {

          // تحديث العنصر المختار وإعادة بناء الواجهة
          setState(() {
            _currentIndex = index;
          });

          // تحديد الإجراء حسب العنصر اللي المستخدم اختاره
          switch (index) {

            case 0:

              // الرجوع للصفحة الرئيسية ومسح الصفحات السابقة
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );

              break;

            case 1:
              // هنا ممكن نضيف الانتقال لصفحة المواعيد
              break;

            case 2:
              // هنا ممكن نضيف الانتقال لصفحة الخدمات
              break;

            case 3:
              // هنا ممكن نضيف الانتقال لصفحة الإعدادات
              break;
          }
        },

        // عناصر شريط التنقل السفلي
        items: [

          // الصفحة الرئيسية
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_outlined),

            // شكل الأيقونة لما تكون محددة
            activeIcon: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // خلفية خفيفة للأيقونة النشطة
                // ignore: deprecated_member_use
                color: AppColors.primary.withOpacity(0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.home),
            ),
            label: 'Home',
          ),

          // المواعيد
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

          // الخدمات
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

          // الإعدادات
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

  // =====================================================
  // دالة إنشاء كارت الطبيب
  // =====================================================

  // عملنا دالة واحدة علشان نستخدمها مع كل الدكاترة
  // required معناها إن لازم نبعت كل البيانات المطلوبة
  // Widget هو نوع القيمة اللي الدالة بترجعها

  Widget _buildDoctorCard({
    required String name,
    required String specialty,
    required String experience,
    required String time,
    required String price,
    required String imagePath,
  }) {

    return Container(
      // المسافة الداخلية بين محتويات الكارت وحدوده
      padding: const EdgeInsets.all(16),

      // الشكل الخارجي للكارت
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        // إطار خفيف حوالين الكارت
        border: Border.all(
          color: AppColors.searchBackground,
          width: 1.5,
        ),

        // ظل بسيط أسفل الكارت
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      // محتويات الكارت الداخلية
      child: Column(
        children: [

          // =====================================================
          // صورة الطبيب وبياناته
          // =====================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // عرض صورة الطبيب وقص زواياها بشكل دائري
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

              // بيانات الطبيب بتاخد المساحة المتبقية جنب الصورة
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // اسم الطبيب
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkText,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // التخصص الطبي
                    Text(
                      specialty,
                      style: const TextStyle(
                        fontSize: 13,
                        color: AppColors.greyText,
                      ),
                    ),

                    const SizedBox(height: 2),

                    // عدد سنوات الخبرة
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

          // خط فاصل بين بيانات الطبيب وبيانات الحجز
          const Divider(
            height: 1,
            color: AppColors.searchBackground,
          ),

          const SizedBox(height: 12),

          // =====================================================
          // الموعد والسعر وزر الحجز
          // =====================================================

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              // عرض موعد الكشف وسعر الاستشارة
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // موعد الكشف المتاح
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greenText,
                    ),
                  ),

                  const SizedBox(height: 2),

                  // سعر الاستشارة الطبية
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

              // زر الحجز
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,

                    // تحديد شكل زوايا زر الحجز
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
