import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/features/authentication/login_screen.dart';
import 'package:flutter_project_base/features/onboarding/onboarding_screen_one.dart';
import 'package:flutter_project_base/features/onboarding/onboarding_screen_three.dart';
import 'package:flutter_project_base/features/onboarding/onboarding_screen_two.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final PageController pageController = Get.put(PageController());
  RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorConst.blueSecondaryColor,
        body: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                selectedIndex.value = index;
              },
              children: const [
                OnboardingScreenOne(),
                OnboardingScreenTwo(),
                OnboardingScreenThree(),
              ],
            ),
            Positioned(
              right: 1,
              left: 1,
              bottom: Dimensions.h100,
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: selectedIndex.value == 0
                          ? Dimensions.w45
                          : Dimensions.w30,
                      height: Dimensions.h5,
                      decoration: BoxDecoration(
                          color: selectedIndex.value == 0
                              ? ColorConst.whiteColor
                              : ColorConst.yellowColor,
                          borderRadius: BorderRadius.circular(Dimensions.r5)),
                    ),
                    SizedBox(
                      width: Dimensions.w10,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: selectedIndex.value == 1
                          ? Dimensions.w45
                          : Dimensions.w30,
                      height: Dimensions.h5,
                      decoration: BoxDecoration(
                          color: selectedIndex.value == 1
                              ? ColorConst.whiteColor
                              : ColorConst.yellowColor,
                          borderRadius: BorderRadius.circular(Dimensions.r5)),
                    ),
                    SizedBox(
                      width: Dimensions.w10,
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: selectedIndex.value == 2
                          ? Dimensions.w45
                          : Dimensions.w30,
                      height: Dimensions.h5,
                      decoration: BoxDecoration(
                          color: selectedIndex.value == 2
                              ? ColorConst.whiteColor
                              : ColorConst.yellowColor,
                          borderRadius: BorderRadius.circular(Dimensions.r5)),
                    )
                  ],
                ),
              ),
            ),
            Positioned(
                right: Dimensions.w10,
                left: Dimensions.w10,
                bottom: Dimensions.h20,
                child: Obx(
                  () => MyButton(
                    textStyle: fontStyleSemiBold14,
                    title: selectedIndex.value == 2
                        ? AppString.getStarted
                        : AppString.next,
                    onPressed: selectedIndex.value == 2
                        ? () {
                            SystemChrome.setSystemUIOverlayStyle(
                                const SystemUiOverlayStyle(
                                    statusBarColor: Colors.transparent,
                                    statusBarIconBrightness: Brightness.dark));

                            Get.offAll(() => const LoginScreen());
                          }
                        : () {
                            pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn);
                          },
                    btnBgColor: ColorConst.whiteColor,
                  ),
                )),
          ],
        ));
  }
}
