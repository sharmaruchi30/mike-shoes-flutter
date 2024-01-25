import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_image.dart';

class OnboardingScreenOne extends StatelessWidget {
  const OnboardingScreenOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.blueSecondaryColor,
      body: SafeArea(
        child: SizedBox(
          height: Get.height,
          width: Get.width,
          child: Stack(
            children: [

              /// LOGO BACKGROUND
              Positioned(
                bottom: Get.height * 0.25,
                child: CustomSvgAssetImage(
                  image: ImageAsset.icLogoBg,
                  width: Get.width,
                ),
              ),

              /// MAIN CONTENT
              SizedBox(
                height: Get.height,
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Dimensions.h80,
                    ),
                    Text(
                      AppString.welcomeToMike.toUpperCase(),
                      style: fontStyleBlack30.copyWith(
                          color: ColorConst.whiteColor, height: 0),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: Dimensions.h10,
                    ),
                    CustomSvgAssetImage(
                      image: ImageAsset.lineIllustration1,
                      height: Dimensions.w15,
                      width: Dimensions.w15,
                    ),
                    SizedBox(
                      height: Dimensions.h20,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CustomAssetImage(
                        image: ImageAsset.onboardingShoe1,
                        onTap: null,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: Dimensions.w30),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Transform.rotate(
                          angle: 70 * (math.pi / 180),
                          child: CustomSvgAssetImage(
                            image: ImageAsset.lineIllustration2,
                            height: Dimensions.w80,
                            width: Dimensions.w80,
                            color: ColorConst.whiteColor.withOpacity(0.5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: Dimensions.w30),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: CustomSvgAssetImage(
                          image: ImageAsset.lineIllustration2,
                          height: Dimensions.w80,
                          width: Dimensions.w80,
                          color: ColorConst.whiteColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
