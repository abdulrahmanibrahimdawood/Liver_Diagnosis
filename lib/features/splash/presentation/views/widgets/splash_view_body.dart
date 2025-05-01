import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/constants.dart';
import 'package:liver_diagnosis/core/services/shared_preferences_singleton.dart';
import 'package:liver_diagnosis/core/utils/app_images.dart';
import 'package:liver_diagnosis/core/widgets/custom_nav_bar.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/signin_view.dart';
import 'package:liver_diagnosis/features/on_boarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.assetsImagesSplash,
        height: 250.h,
        width: 250.w,
      ),
    );
  }

  void excuteNavigation() {
    bool isOnboardingViewSeen = SharedPrefs.getBool(kIsOnboardingViewSeen);
    bool isLogedin = SharedPrefs.getBoolLogin(kIsLogedin);

    Future.delayed(
      const Duration(seconds: 1),
      () {
        //================================= ازاله الورنينج =======================================
        if (!mounted) return; // تحقق أن الودجت ما زال في الشجرة
        //====================================================================================
        if (isOnboardingViewSeen && isLogedin) {
          Navigator.pushReplacementNamed(context, CustomNavBar.routeName);
        } else if (isOnboardingViewSeen) {
          Navigator.pushReplacementNamed(context, SigninView.routeName);
        } else {
          Navigator.pushReplacementNamed(context, OnBoardingView.routeName);
        }
      },
    );
  }
}
