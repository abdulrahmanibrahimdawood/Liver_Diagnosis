import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/doctors/presentation/views/map_view.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      // CustomImageProfile(
                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      'Welcome to ',
                      style: TextStyle(
                          fontSize: 28.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'HDx app !',
                      style: TextStyle(
                          fontSize: 28.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kPrimaryColor),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w, top: 9.h),
                  child: Text(
                    'Advice',
                    style:
                        TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const AdvicesListView(),
              SizedBox(
                height: 18.h,
              ),
              Container(
                height: 50.h,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  color: AppColor.kPrimaryColor,
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MapScreen(
                            lat: 30.5667,
                            long: 31.5,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      'Check results',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 13.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
