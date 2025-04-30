import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/analysis/presentation/views/analysis_view.dart';
import 'package:e_commerce/features/doctors/presentation/views/doctors_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/questions/presentation/views/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});
  static const routeName = 'navBar';

  @override
  State<CustomNavBar> createState() => _MainPageState();
}

class _MainPageState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomeView(),
    AnalysisView(),
    QuesthionsView(),
    DoctorsView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          height: 67.h,
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: BottomNavigationBar(
            selectedLabelStyle:
                TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp),
            unselectedLabelStyle: TextStyle(fontSize: 13.sp),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: List.generate(4, (index) {
              return BottomNavigationBarItem(
                icon: Container(
                  padding: EdgeInsets.all(8.sp),
                  decoration: BoxDecoration(
                    color: _selectedIndex == index
                        ? AppColor.kPrimaryColor.withValues(alpha: .2)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: SvgPicture.asset(
                    _selectedIndex == index
                        ? _activeIcons[index]
                        : _inactiveIcons[index],
                    width: 24.sp,
                    height: 24.sp,
                  ),
                ),
                label: index == 0
                    ? 'Home'
                    : index == 1
                        ? 'Medical Analysis'
                        : index == 2
                            ? 'Qs & Ans'
                            : 'Doctors',
              );
            }),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.kPrimaryColor,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            elevation: 0,
          ),
        ),
      ),
    );
  }

  final List<String> _activeIcons = [
    'assets/images/home_active.svg',
    'assets/images/medical_analysis_active.svg',
    'assets/images/Q_active.svg',
    'assets/images/doc_active.svg',
  ];

  final List<String> _inactiveIcons = [
    'assets/images/home.svg',
    'assets/images/medical_analysis.svg',
    'assets/images/QandAns.svg',
    'assets/images/doc.svg',
  ];
}
