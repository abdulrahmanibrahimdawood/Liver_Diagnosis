import 'package:flutter/material.dart';
import 'package:liver_diagnosis/features/on_boarding/presentation/views/widgets/on_boarding_views_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const String routeName = 'onBoardingView';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: OnBoardingViewsBody()),
    );
  }
}
