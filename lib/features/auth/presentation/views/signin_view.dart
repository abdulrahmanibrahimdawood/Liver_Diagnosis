import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/core/widgets/custom_app_bar.dart';
import 'package:liver_diagnosis/features/auth/data/repos/auth_repo.dart';
import 'package:liver_diagnosis/features/auth/presentation/managers/signin_cubit/cubit/signin_cubit.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';

import '../../../../core/services/get_it_servece.dart';

class SigninView extends StatelessWidget {
  const SigninView({super.key});
  static const routeName = 'login';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(
        getIt<AuthRepo>(),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: true,
        appBar: buildAppBar(context, title: 'Login'),
        body: const SafeArea(child: SigninViewBodyBlocConsumer()),
      ),
    );
  }
}
