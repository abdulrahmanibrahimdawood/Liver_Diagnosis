import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/constants.dart';
import 'package:liver_diagnosis/core/services/shared_preferences_singleton.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/auth/presentation/views/signin_view.dart';
import 'package:liver_diagnosis/features/home/presentation/managers/logout_cubit/logout_cubit.dart';
import 'package:liver_diagnosis/features/home/presentation/managers/logout_cubit/logout_state.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LogoutCubit(),
      child: BlocConsumer<LogoutCubit, LogoutState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            SharedPrefs.setBoolLogin(kIsLogedin, false);
            Navigator.pushNamedAndRemoveUntil(
              context,
              SigninView.routeName,
              (route) => false,
            );
          } else if (state is LogoutFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return Drawer(
            width: 220.w,
            child: Stack(
              children: [
                ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(
                      height: 70.h,
                      child: DrawerHeader(
                        decoration: const BoxDecoration(
                          color: AppColor.kPrimaryColor,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              size: 24.sp,
                              Icons.settings,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Text(
                              'LDx App',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 10.w),
                      leading: Icon(
                        Icons.exit_to_app,
                        size: 22.sp,
                      ),
                      title: Text(
                        'Logout',
                        style: TextStyle(fontSize: 14.sp),
                      ),
                      onTap: () => context.read<LogoutCubit>().signOut(),
                    ),
                  ],
                ),
                if (state is LogoutLoading)
                  Container(
                    color: Colors.black.withValues(alpha: .5),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CircularProgressIndicator(
                            color: AppColor.kPrimaryColor,
                            strokeWidth: 3,
                          ),
                          SizedBox(height: 14.h),
                          Text(
                            'Logging out...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
