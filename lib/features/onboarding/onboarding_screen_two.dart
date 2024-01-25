import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_image.dart';

class OnboardingScreenTwo extends StatelessWidget {
  const OnboardingScreenTwo({super.key});

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
                    SizedBox(height: Dimensions.h30,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dimensions.w20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Transform.rotate(
                            angle: 80 * (math.pi / 180),
                            child: CustomSvgAssetImage(
                              image: ImageAsset.lineIllustration2,
                              height: Dimensions.w100,
                              width: Dimensions.w100,
                              color: ColorConst.whiteColor.withOpacity(0.5),
                            ),
                          ),
                          CustomSvgAssetImage(
                            image: ImageAsset.smileIllustration,
                            height: Dimensions.w50,
                            width: Dimensions.w50,
                            color: ColorConst.whiteColor.withOpacity(0.5),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomAssetImage(
                        image: ImageAsset.onboardingShoe2,
                        onTap: null,
                      ),
                    ),

                    SizedBox(height: Dimensions.h10),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: Dimensions.commonPaddingForScreen),
                      child: Column(
                        children: [
                          Text(
                            AppString.letsStartJourneyWithMike,
                            style: fontStyleBlack30.apply(
                                color: ColorConst.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            AppString.startMessage1,
                            style: fontStyleRegular16.apply(
                                color: ColorConst.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    )
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
