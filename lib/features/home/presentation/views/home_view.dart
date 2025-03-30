import 'package:e_commerce/features/home/cubit/cubit/home_cubit.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const routeName = 'home';
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..fetchAdvices(),
      child: const SafeArea(
        child: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 15, left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(height: 700, child: HomeViewBody()),
                // BodyBottomAppBar(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
