import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/analysis/presentation/views/analysis_view.dart';
import 'package:e_commerce/features/doctors/presentation/views/doctors_view.dart';
import 'package:e_commerce/features/home/presentation/views/home_view.dart';
import 'package:e_commerce/features/questions/presentation/views/questions_view.dart';
import 'package:flutter/material.dart';
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

  static const List<BottomNavigationBarItem> _navigationItems = [
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.houseChimney,
        size: 28,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.magnifyingGlass,
        size: 28,
      ),
      label: 'Analysis',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.circleQuestion,
        size: 28,
      ),
      label: 'Questions',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.stethoscope,
        size: 28,
      ),
      label: 'Doctors',
    ),
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
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: .2),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _navigationItems,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.kPrimaryColor,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
