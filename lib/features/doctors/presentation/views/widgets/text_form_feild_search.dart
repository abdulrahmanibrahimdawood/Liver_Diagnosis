import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/core/utils/app_color.dart';
import 'package:liver_diagnosis/features/doctors/presentation/managers/doctors_cubit/cubit/doctor_cubit.dart';

class TextFormFeildSearch extends StatefulWidget {
  const TextFormFeildSearch({super.key});

  @override
  State<TextFormFeildSearch> createState() => _TextFormFeildSearchState();
}

class _TextFormFeildSearchState extends State<TextFormFeildSearch> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.h),
      child: TextFormField(
        controller: _controller,
        onFieldSubmitted: (value) {
          final governorate = value.trim();
          context.read<DoctorCubit>().fetchDoctors(
                governorate: governorate.isEmpty ? null : governorate,
              );
        },
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            size: 26.sp,
            color: const Color(0xFF4781C0),
          ),
          hintText: 'Search by governorate',
          contentPadding: EdgeInsets.symmetric(vertical: 9.w),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColor.kPrimaryColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: const BorderSide(color: AppColor.kPrimaryColor),
          ),
        ),
      ),
    );
  }
}
