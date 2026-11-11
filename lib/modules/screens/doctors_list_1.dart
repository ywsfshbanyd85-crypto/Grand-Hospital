import 'package:flutter/material.dart';
import 'package:grand_hospital_app/modules/color.dart';
import 'home_screen.dart';

// =====================================================
//Internal Medicine إنشاء صفحة قائمة الأطباء
// =====================================================

// استخدمنا StatefulWidget لأن الصفحة فيها حالة ممكن تتغير
// زي العنصر المحدد في شريط التنقل اللي تحت
class DoctorsListScreen1 extends StatefulWidget {
  const DoctorsListScreen1({super.key});

  @override
  State<DoctorsListScreen1> createState() => _DoctorsListScreen1State();
}

// =====================================================
// إدارة الحالة الخاصة بالصفحة
// =====================================================

class _DoctorsListScreen1State extends State<DoctorsListScreen1> {

  // المتغير ده بيحدد العنصر المختار في شريط التنقل السفلي
  // 0 معناها إن أول عنصر Home هو المحدد
  int _currentIndex = 0;

  // =====================================================
  // بناء واجهة صفحة قائمة الأطباء
  // =====================================================

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // الشريط العلوي للصفحة
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
        // ضفنا مسافات حوالين المحتوى، والتمرير بيسمح بعرض
        // كل المحتوى حتى لو كان أطول من مساحة الشاشة
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

                // أيقونة البحث اللي بتظهر داخل مربع البحث
                prefixIcon: const Icon(
                  Icons.search,
                  color: AppColors.greyText,
                ),

                filled: true,
                fillColor: AppColors.searchBackground,

                // شكل مربع البحث من الخارج
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

                        // أيقونة الخدمات الطبية
                        Icon(
                          Icons.medical_services_outlined,
                          color: AppColors.primary,
                          size: 20,
                        ),

                        SizedBox(width: 10),

                        // اسم التخصص
                        Expanded(
                          child: Text(
                            'Internal Medicine',
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

            // عدد الأطباء وطريقة ترتيبهم
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

            // بنستدعي نفس الدالة لكل دكتور، وبنبعتلها بياناته
            // علشان تعرض كل دكتور في كارت لوحده

            _buildDoctorCard(
              name: 'Dr. Ahmed Gabr',
              specialty: 'Internal Medicine',
              experience: '12 years of experience',
              time: 'Today, 10:30 AM',
              price: '\$80 / consultation',
              imagePath: 'images/01_Ahmed_Gabr.png',
            ),

            const SizedBox(height: 16),

            _buildDoctorCard(
              name: 'Dr. Dina Abdel Fattah',
              specialty: 'Internal Medicine',
              experience: '9 years of experience',
              time: 'Today, 2:00 PM',
              price: '\$75 / consultation',
              imagePath: 'images/02_Dina_Abdel_Fattah.png',
            ),

            const SizedBox(height: 16),

            _buildDoctorCard(
              name: 'Dr. Ibrahim Magdy',
              specialty: 'Internal Medicine',
              experience: '15 years of experience',
              time: 'Tomorrow, 9:00 AM',
              price: '\$90 / consultation',
              imagePath: 'images/03_Ibrahim_Magdy.png',
            ),
          ],
        ),
      ),

      // =====================================================
      // Navbar شريط التنقل السفلي ال 
      // =====================================================

      bottomNavigationBar: BottomNavigationBar(
        // بيحدد العنصر النشط في الشريط
        currentIndex: _currentIndex,

        backgroundColor: Colors.white,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.greyText,
        type: BottomNavigationBarType.fixed,

        // الدالة دي بتشتغل لما المستخدم يضغط على أي عنصر
        onTap: (index) {

          // بنحدث العنصر المختار ونعيد بناء الواجهة
          setState(() {
            _currentIndex = index;
          });

          // بنحدد هنعمل إيه حسب العنصر اللي المستخدم اختاره
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

            // الأيقونة اللي بتظهر لما العنصر يكون متحدد
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

  // عملنا دالة واحدة بدل ما نكرر تصميم الكارت لكل دكتور
  // required معناها إن كل البيانات دي لازم تتبعت للدالة
  // والدالة بترجع Widget علشان تعرض كارت الطبيب

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

      // الشكل الخارجي للكارت
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),

        // إطار خفيف حوالين الكارت
        border: Border.all(
          color: AppColors.searchBackground,
          width: 1.5,
        ),

        // ظل بسيط تحت الكارت
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),

      // محتويات الكارت
      child: Column(
        children: [

          // =====================================================
          // صورة الطبيب وبياناته
          // =====================================================

          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // عرض صورة الطبيب من ملفات المشروع
              // ClipRRect بيخلي زوايا الصورة دائرية
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

              // البيانات بتاخد المساحة المتبقية جنب الصورة
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

                    // عدد سنين الخبرة
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

                  // الموعد المتاح
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

              // زر حجز موعد مع الطبيب
              SizedBox(
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,

                    // تحديد شكل الزوايا بتاعة الزر
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
