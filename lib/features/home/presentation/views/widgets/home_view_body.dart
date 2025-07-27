import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/home/presentation/views/widgets/advices_list_view.dart';
import 'package:liver_diagnosis/features/home/presentation/views/widgets/custom_drower.dart';
import 'package:liver_diagnosis/features/home/presentation/views/widgets/icon_button.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Builder(
        builder: (context) => Padding(
          padding: EdgeInsets.only(top: 13.h, left: 13.w, right: 13.w),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconsButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: FontAwesomeIcons.bars,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 13.w,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 2.0.w),
                      child: Text(
                        'Welcome to ',
                        style: TextStyle(
                            fontSize: 28.sp, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'LDx app !',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kPrimaryColor),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w, top: 0.h),
                  child: Text(
                    'Advices',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const AdvicesListView(),
            ],
          ),
        ),
      ),
    );
  }
}
