import 'dart:io';

import 'package:e_commerce/constants.dart';
import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_form_feild.dart';
import 'package:e_commerce/core/widgets/password_feild.dart';
import 'package:e_commerce/features/auth/presentation/cubits/signin_cubit/cubit/signin_cubit.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/dont_have_an_account_widget.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/or_divider.dart';
import 'package:e_commerce/features/auth/presentation/views/widgets/social_login_botton.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: khorizontalPadding),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(
                height: 24,
              ),
              CustomTextFormFeild(
                controller: emailController,
                icon: const Icon(
                  Icons.email,
                  color: Colors.blueGrey,
                ),
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
              ),
              const SizedBox(
                height: 16,
              ),
              PasswordFeild(
                controller: passwordController,
              ),
              const SizedBox(
                height: 16,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: GestureDetector(
                  onTap: () {
                    resetPassword();
                  },
                  child: Text(
                    'Forget Password !',
                    style: TextStyle(
                        color: AppColor.kPrimaryColor.withValues(alpha: 1),
                        fontSize: 15,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 33,
              ),
              CustomButton(
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      context.read<SigninCubit>().signIn(
                          emailController.text, passwordController.text);
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  },
                  text: 'Login'),
              const SizedBox(
                height: 33,
              ),
              const DontHaveAnAccountWidget(),
              const SizedBox(
                height: 33,
              ),
              const OrDivider(),
              const SizedBox(
                height: 33,
              ),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithGoogle();
                },
                icon: Assets.assetsImagesGoogleIcon,
                title: 'Register with Google',
              ),
              const SizedBox(
                height: 16,
              ),
              Platform.isIOS
                  ? Column(children: [
                      SocialLoginButton(
                        onPressed: () {
                          context.read<SigninCubit>().signInWithApple();
                        },
                        icon: Assets.assetsImagesAppleIcon,
                        title: 'Register with Apple',
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ])
                  : const SizedBox(),
              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                icon: Assets.assetsImagesFacebookIcon,
                title: 'Register with Facebook',
              ),
            ],
          ),
        ),
      ),
    );
  }

  resetPassword() async {
    if (emailController.text.isEmpty || !emailController.text.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address')),
      );
      return;
    }

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password reset link has been sent to your email'),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${e.toString()}'),
        ),
      );
    }
  }
}
