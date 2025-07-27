import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/constants.dart';
import 'package:liver_diagnosis/core/helper_functions/build_error_bar.dart';
import 'package:liver_diagnosis/core/services/shared_preferences_singleton.dart';
import 'package:liver_diagnosis/core/widgets/custom_nav_bar.dart';
import 'package:liver_diagnosis/core/widgets/custom_progress_hud.dart';
import 'package:liver_diagnosis/features/auth/presentation/managers/signin_cubit/cubit/signin_cubit.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/widgets/signin_view_body.dart';

class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          buildErrorBar(context, 'You have been logged in successfully.');

          SharedPrefs.setBoolLogin(kIsLogedin, true);
          Navigator.pushNamed(context, CustomNavBar.routeName);
        }
        if (state is SigninFailure) {
          buildErrorBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHUD(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
