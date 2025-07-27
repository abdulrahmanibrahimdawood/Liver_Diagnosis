import 'package:flutter/material.dart';
import 'package:liver_diagnosis/core/widgets/custom_nav_bar.dart';
import 'package:liver_diagnosis/features/diagnotic/presentation/views/diagnotic_view.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/signin_view.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/signup_view.dart';
import 'package:liver_diagnosis/features/doctors/presentation/views/doctors_view.dart';
import 'package:liver_diagnosis/features/home/presentation/views/home_view.dart';
import 'package:liver_diagnosis/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:liver_diagnosis/features/questions/presentation/views/questions_view.dart';
import 'package:liver_diagnosis/features/splash/presentation/views/splash_view.dart';

Route<dynamic> onGenerateRoutes(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.routeName:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case SigninView.routeName:
      return MaterialPageRoute(builder: (context) => const SigninView());
    case OnBoardingView.routeName:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case SignupView.routeName:
      return MaterialPageRoute(builder: (context) => const SignupView());
    case CustomNavBar.routeName:
      return MaterialPageRoute(builder: (context) => const CustomNavBar());
    case AnalysisView.routeName:
      return MaterialPageRoute(builder: (context) => const AnalysisView());
    case DoctorsView.routeName:
      return MaterialPageRoute(builder: (context) => const DoctorsView());
    case HomeView.routeName:
      return MaterialPageRoute(builder: (context) => const HomeView());
    case QuesthionsView.routeName:
      return MaterialPageRoute(builder: (context) => const QuesthionsView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
