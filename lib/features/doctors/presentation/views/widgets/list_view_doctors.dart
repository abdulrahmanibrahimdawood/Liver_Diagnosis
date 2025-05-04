import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:liver_diagnosis/features/doctors/cubit/cubit/doctor_cubit.dart';
import 'package:liver_diagnosis/features/doctors/presentation/views/widgets/doctors_card.dart';

class ListViewDoctors extends StatefulWidget {
  const ListViewDoctors({super.key});

  @override
  State<ListViewDoctors> createState() => _ListViewDoctorsState();
}

class _ListViewDoctorsState extends State<ListViewDoctors> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorCubit>().fetchDoctors();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DoctorCubit, DoctorState>(
      builder: (context, state) {
        if (state is DoctorLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is DoctorFailure) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 50.sp,
                ),
                SizedBox(height: 14.h),
                Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 14.h),
                SizedBox(
                  height: 35.h,
                  width: 100.w,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<DoctorCubit>().fetchDoctors();
                    },
                    child: Text(
                      'Try Again',
                      style: TextStyle(fontSize: 12.sp),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is DoctorSuccess) {
          return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: state.doctors.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: ((context, index) {
              return Column(
                children: [
                  DoctorCard(
                    doctors: state.doctors[index],
                  ),
                  SizedBox(
                    height: 13.sp,
                  )
                ],
              );
            }),
          );
        } else {
          return Center(
            child: Text(
              "No doctors available.",
              style: TextStyle(fontSize: 12.sp),
            ),
          );
        }
      },
    );
  }
}
