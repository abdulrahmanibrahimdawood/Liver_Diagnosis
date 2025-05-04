import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/helper_functions/on_generate_routes.dart';
import 'package:liver_diagnosis/core/services/custom_bloc_observer.dart';
import 'package:liver_diagnosis/core/services/get_it_servece.dart';
import 'package:liver_diagnosis/core/services/shared_preferences_singleton.dart';
import 'package:liver_diagnosis/features/splash/presentation/views/splash_view.dart';
import 'package:liver_diagnosis/firebase_options.dart';
import 'package:liver_diagnosis/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = CustomBlocObserver();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await SharedPrefs.init();
  setupGetit();
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const HebatoDiagnosis(),
    ),
  );
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
          builder: DevicePreview.appBuilder,
          locale: DevicePreview.locale(context),
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
          home: const SplashView(),
        );
      },
    );
  }
}
