import 'package:e_commerce/core/services/get_it_servece.dart';
import 'package:e_commerce/core/widgets/custom_app_bar.dart';
import 'package:e_commerce/features/auth/domain/repos/auth_repo.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signin_cubit/cubit/signin_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        body: const SigninViewBodyBlocConsumer(),
      ),
    );
  }
}
