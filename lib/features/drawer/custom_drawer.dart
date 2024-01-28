import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/core/widgets/custom_image.dart';
import 'package:flutter_project_base/features/bottomnavbar/app_bottom_navbar.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  final double maxSlide = 225.0;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (context, child) {
        double slide = maxSlide * animationController.value;
        double rotation = -(10 * animationController.value) * (math.pi / 180);
        double scale = 1 - (animationController.value * 0.3);
        return Stack(
          children: [
            // DRAWER
            Container(
              height: Get.height,
              width: Get.width,
              color: ColorConst.blueSecondaryColor,
              child: Padding(
                padding: EdgeInsets.all(Dimensions.commonPaddingForScreen)
                    .copyWith(top: Dimensions.h40),
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: Dimensions.r50,
                        child: CustomRoundCornerNetworkImage(
                          radius: Dimensions.r50,
                          image:
                              'https://i.pinimg.com/736x/35/fd/ca/35fdcac242231ee2fd91077cf8c938ae.jpg',
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.h20,
                      ),
                      SizedBox(
                        width: Get.width / 2 - Dimensions.w40,
                        child: Text(
                          'Chanandler Bong',
                          style: fontStyleSemiBold16.apply(
                              color: ColorConst.whiteColor),
                        ),
                      ),

                      SizedBox(
                        height: Dimensions.h40,
                      ),

                      // PROFILE TILE
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomSvgAssetImage(
                              image: ImageAsset.icProfile,
                              height: Dimensions.w25,
                              width: Dimensions.w25,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(
                              width: Dimensions.w10,
                            ),
                            Text(
                              AppString.profile,
                              style: fontStyleRegular16.apply(
                                  color: ColorConst.whiteColor),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: Dimensions.h20,
                      ),

                      // MY CART TILE
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomSvgAssetImage(
                              image: ImageAsset.icBag,
                              height: Dimensions.w25,
                              width: Dimensions.w25,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(
                              width: Dimensions.w10,
                            ),
                            Text(
                              AppString.myCart,
                              style: fontStyleRegular16.apply(
                                  color: ColorConst.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.h20,
                      ),
                      // FAVOURITE TILE
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomSvgAssetImage(
                              image: ImageAsset.icHeart,
                              height: Dimensions.w25,
                              width: Dimensions.w25,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(
                              width: Dimensions.w10,
                            ),
                            Text(
                              AppString.favorite,
                              style: fontStyleRegular16.apply(
                                  color: ColorConst.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.h20,
                      ),
                      // ORDERS TILE
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomSvgAssetImage(
                              image: ImageAsset.icOrder,
                              height: Dimensions.w25,
                              width: Dimensions.w25,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(
                              width: Dimensions.w10,
                            ),
                            Text(
                              AppString.orders,
                              style: fontStyleRegular16.apply(
                                  color: ColorConst.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.h20,
                      ),
                      // NOTIFICATIONS TILE
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomSvgAssetImage(
                              image: ImageAsset.icNotification,
                              height: Dimensions.w25,
                              width: Dimensions.w25,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(
                              width: Dimensions.w10,
                            ),
                            Text(
                              AppString.notifications,
                              style: fontStyleRegular16.apply(
                                  color: ColorConst.whiteColor),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Dimensions.h20,
                      ),
                      // PROFILE TILE
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomSvgAssetImage(
                              image: ImageAsset.icSettings,
                              height: Dimensions.w25,
                              width: Dimensions.w25,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(
                              width: Dimensions.w10,
                            ),
                            Text(
                              AppString.settings,
                              style: fontStyleRegular16.apply(
                                  color: ColorConst.whiteColor),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: Dimensions.h30,
                      ),

                      Container(
                        height: 1.3.dynamicH,
                        width: Get.width,
                        color: ColorConst.whiteColor,
                      ),
                      SizedBox(
                        height: Dimensions.h30,
                      ),

                      // SIGN OUT TILE
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            CustomSvgAssetImage(
                              image: ImageAsset.icSignOut,
                              height: Dimensions.w25,
                              width: Dimensions.w25,
                              color: ColorConst.whiteColor,
                            ),
                            SizedBox(
                              width: Dimensions.w10,
                            ),
                            Text(
                              AppString.signOut,
                              style: fontStyleRegular16.apply(
                                  color: ColorConst.whiteColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Transform(
              transform: Matrix4.identity()
                ..translate(slide)
                ..rotateZ(rotation)
                ..scale(scale),
              alignment: Alignment.centerLeft,
              child: ClipRRect(
                  borderRadius: rotation == 0
                      ? BorderRadius.circular(0)
                      : BorderRadius.circular(Dimensions.r20),
                  child: AppBottomNavBar(
                    openDrawer: () {
                      if (animationController.isDismissed) {
                        animationController.forward();
                      } else {
                        animationController.reverse();
                      }
                    },
                  )),
            ),
          ],
        );
      },
    );
  }
}
