import 'package:flutter/material.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SafeArea(child: SplashViewBody()),
    );
  }
}
