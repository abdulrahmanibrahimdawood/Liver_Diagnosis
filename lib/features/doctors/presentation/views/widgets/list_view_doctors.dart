import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liver_diagnosis/features/doctors/cubit/cubit/doctor_cubit.dart';
import 'package:liver_diagnosis/features/doctors/presentation/views/widgets/doctors_card.dart';

class ListViewDoctors extends StatefulWidget {
  const ListViewDoctors({
    super.key,
  });

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
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                const SizedBox(height: 16),
                Text(
                  state.errMessage,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context.read<DoctorCubit>().fetchDoctors();
                  },
                  child: const Text('Try Again'),
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
                  const SizedBox(
                    height: 15,
                  )
                ],
              );
            }),
          );
        } else {
          return const Center(
            child: Text("No doctors available."),
          );
        }
      },
    );
  }
}
