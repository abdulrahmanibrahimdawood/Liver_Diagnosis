import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/core/widgets/app_bar_inside.dart';
import 'package:liver_diagnosis/features/doctors/cubit/cubit/doctor_cubit.dart';
import 'package:liver_diagnosis/features/doctors/presentation/views/widgets/list_view_doctors.dart';
import 'package:liver_diagnosis/features/doctors/presentation/views/widgets/text_form_feild_search.dart';

class DoctorsView extends StatelessWidget {
  const DoctorsView({super.key});
  static const routeName = 'doctors';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorCubit(),
      child: const Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBarInside(
                text1: "Doctors List",
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: TextFormFeildSearch(),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: ListViewDoctors(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
