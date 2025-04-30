import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/analysis/presentation/views/analysis_view.dart';
import 'package:e_commerce/features/doctors/presentation/views/doctors_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/questions/presentation/views/questions_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: AppColor.kPrimaryColor.withValues(alpha: .4),
                spreadRadius: 15.w,
                blurRadius: 20.r,
              ),
            ],
          ),
          child: BottomNavigationBar(
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
                  child: FaIcon(
                    index == 0
                        ? FontAwesomeIcons.houseChimney
                        : index == 1
                            ? FontAwesomeIcons.magnifyingGlass
                            : index == 2
                                ? FontAwesomeIcons.circleQuestion
                                : FontAwesomeIcons.stethoscope,
                    size: 24.sp,
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
            backgroundColor: AppColor.kPrimaryColor.withValues(alpha: .2),
          ),
        ),
      ),
    );
  }
}
