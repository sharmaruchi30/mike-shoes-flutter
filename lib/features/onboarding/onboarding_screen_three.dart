import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../core/widgets/custom_image.dart';

class OnboardingScreenThree extends StatelessWidget {
  const OnboardingScreenThree({super.key});

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
                      height: Dimensions.h30,
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: Dimensions.w20),
                        child: CustomSvgAssetImage(
                          image: ImageAsset.smileIllustration,
                          height: Dimensions.w80,
                          width: Dimensions.w80,
                          color: ColorConst.whiteColor.withOpacity(0.5),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: CustomAssetImage(
                        image: ImageAsset.onboardingShoe3,
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
                            AppString.youHaveThePower,
                            style: fontStyleBlack30.apply(
                                color: ColorConst.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            AppString.startMessage2,
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
