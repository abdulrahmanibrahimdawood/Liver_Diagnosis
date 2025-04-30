import 'package:e_commerce/core/helper_functions/on_generate_routes.dart';
import 'package:e_commerce/core/services/custom_bloc_observer.dart';
import 'package:e_commerce/core/services/get_it_servece.dart';
import 'package:e_commerce/core/services/shared_preferences_singleton.dart';
import 'package:e_commerce/features/splash/presentation/views/splash_view.dart';
import 'package:e_commerce/firebase_options.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ab@gmail.com
// 123456789
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefs.init();
  setupGetit();
  runApp(const HebatoDiagnosis());
}

class HebatoDiagnosis extends StatelessWidget {
  const HebatoDiagnosis({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          theme: ThemeData(
            fontFamily: 'Cairo',
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          onGenerateRoute: onGenerateRoutes,
          // initialRoute: CustomNavBar.routeName,

          home: const SplashView(),
        );
      },
    );
  }
}
//
