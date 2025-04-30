import 'package:e_commerce/core/utils/app_color.dart';
import 'package:e_commerce/core/utils/app_images.dart';
import 'package:e_commerce/features/on_boarding/presentation/views/widgets/page_view_item.dart';
import 'package:flutter/material.dart';

class OnBoardingPageView extends StatelessWidget {
  const OnBoardingPageView({super.key, required this.pageController});
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          isVisiable: true,
          image: 'assets/images/one.png',
          backgroundImage: Assets.assetsImagesBackgroundImage,
          subtitle:
              'We help you monitor liver health with accurate and easy-to-use diagnostic tools, empowering you to understand your health condition and take appropriate steps.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Welcome to ',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Text(
                'HDx App',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColor.kPrimaryColor),
              )
            ],
          ),
        ),
        PageViewItem(
          isVisiable: true,
          image: 'assets/images/two.png',
          backgroundImage: Assets.assetsImagesBackgroundImage,
          subtitle:
              'We provide quick analysis with high accuracy, ensuring you get the information you need at the right time with minimal effort.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Fast and Reliable Results',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        PageViewItem(
          isVisiable: false,
          image: 'assets/images/three.png',
          backgroundImage: Assets.assetsImagesBackgroundImage,
          subtitle:
              'Take a step towards a healthier life now and begin your journey with us to achieve a better, brighter health future.',
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Start Your Health Journey',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
