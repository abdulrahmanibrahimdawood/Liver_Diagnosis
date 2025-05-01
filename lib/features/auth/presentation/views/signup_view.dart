import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/services/get_it_servece.dart';
import 'package:liver_diagnosis/features/auth/data/repos/auth_repo.dart';
import 'package:liver_diagnosis/features/auth/presentation/cubits/signup_cupit/cubit/signup_cubit.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = 'signup';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        appBar: buildAppBar(
          context,
          title: 'Register',
          icon: Icon(
            size: 21.sp,
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        body: const SafeArea(child: SignupViewBodyBlocConsumer()),
      ),
    );
  }
}
