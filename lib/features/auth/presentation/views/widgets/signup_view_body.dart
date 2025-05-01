import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/constants.dart';
import 'package:liver_diagnosis/core/helper_functions/build_error_bar.dart';
import 'package:liver_diagnosis/core/widgets/custom_button.dart';
import 'package:liver_diagnosis/core/widgets/custom_text_form_feild.dart';
import 'package:liver_diagnosis/core/widgets/password_feild.dart';
import 'package:liver_diagnosis/features/auth/presentation/cubits/signup_cupit/cubit/signup_cubit.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/widgets/have_an_account_widget.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/widgets/terms_and_condations.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController userNameController = TextEditingController();

  bool istermedAccepts = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: khorizontalPadding),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              SizedBox(
                height: 22.h,
              ),
              CustomTextFormFeild(
                controller: userNameController,
                icon: Icon(
                  size: 22.sp,
                  Icons.person,
                  color: Colors.blueGrey,
                ),
                textInputType: TextInputType.name,
                hintText: 'Name',
              ),
              SizedBox(
                height: 14.h,
              ),
              CustomTextFormFeild(
                controller: emailController,
                icon: Icon(
                  size: 20.sp,
                  Icons.email,
                  color: Colors.blueGrey,
                ),
                textInputType: TextInputType.emailAddress,
                hintText: 'Email',
              ),
              SizedBox(
                height: 14.h,
              ),
              PasswordFeild(
                controller: passwordController,
              ),
              SizedBox(
                height: 14.h,
              ),
              TermsAndCondationsWidgets(
                onChanged: (value) {
                  istermedAccepts = value;
                },
              ),
              SizedBox(
                height: 28.h,
              ),
              CustomButton(
                text: 'Create an account',
                onPressed: () {
                  FocusScope.of(context).unfocus();

                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    if (istermedAccepts) {
                      context
                          .read<SignupCubit>()
                          .createUserWithEmailAndPassword(
                            emailController.text,
                            passwordController.text,
                            userNameController.text,
                          );
                    } else {
                      buildErrorBar(
                          context, ' You must accept the terms and conditions');
                    }
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
              ),
              SizedBox(
                height: 24.h,
              ),
              const HaveAnAccountWidget()
            ],
          ),
        ),
      ),
    );
  }
}
