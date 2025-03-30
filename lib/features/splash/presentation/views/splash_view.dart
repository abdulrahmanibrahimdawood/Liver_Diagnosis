import 'package:e_commerce/core/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const routeName = "splash";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColor.kPrimaryColor,
      body: SplashViewBody(),
    );
  }
}
