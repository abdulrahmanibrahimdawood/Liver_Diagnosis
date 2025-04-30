import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/features/doctors/presentation/views/map_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/advices_list_view.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/custom_drower.dart';
import 'package:e_commerce/features/home/presentation/views/widgets/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});
  static const routeName = 'home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
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
                  const Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      // CustomImageProfile(
                      //   onTap: () {},
                      // ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Row(
                  children: [
                    Text(
                      'Welcome to ',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'HDx app !',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColor.kPrimaryColor),
                    ),
                  ],
                ),
              ),
              const Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 9, top: 10),
                  child: Text(
                    'Advice',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const AdvicesListView(),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 57,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
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
                    child: const Text(
                      'Go to know the result now',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
