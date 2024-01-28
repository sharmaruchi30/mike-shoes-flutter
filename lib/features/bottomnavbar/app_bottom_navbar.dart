import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/custom/custom_icon_button.dart';
import 'package:flutter_project_base/features/bottomnavbar/tabs/home_tab_screen/home_tab_screen.dart';
import 'package:flutter_project_base/features/bottomnavbar/tabs/liked_tab_screen/liked_tab_screen.dart';
import 'package:flutter_project_base/features/bottomnavbar/tabs/notifications_tab_screen/notifications_tab_screen.dart';
import 'package:flutter_project_base/features/bottomnavbar/tabs/profile_tab_screen/profile_tab_screen.dart';
import 'package:get/get.dart';

import 'tabs/home_tab_screen/cart_screen.dart';

class AppBottomNavBar extends StatelessWidget {
  final Function() openDrawer;

  AppBottomNavBar({super.key, required this.openDrawer});

  final RxInt selectedIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            // SCREEN
            if (selectedIndex.value == 0) HomeTabScreen(openDrawer: openDrawer,),
            if (selectedIndex.value == 1) LikedTabScreen(),
            if (selectedIndex.value == 2) NotificationsTabScreen(),
            if (selectedIndex.value == 3) ProfileTabScreen(),

            // BOTTOM BAR
            Positioned(
              bottom: 0,
              left: 0,
              child: SizedBox(
                width: Get.width,
                height: Dimensions.h80,
                child: Stack(
                  // clipBehavior: cl,
                  // overflow: Overflow.visible,
                  children: [
                    CustomPaint(
                      size: Size(Get.width, Dimensions.h80),
                      painter: BNBCustomPainter(),
                    ),
                    Center(
                        heightFactor: 0.6,
                        child: CustomIconButton(
                          backgroundColor: ColorConst.blueColor,
                          onTap: () => Get.to(CartScreen()),
                          assetName: ImageAsset.icBag,
                          color: ColorConst.whiteColor,
                        )),
                    SizedBox(
                      width: Get.width,
                      height: Dimensions.h80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomIconButton(
                            onTap: () => selectedIndex.value = 0,
                            assetName: ImageAsset.icBag,
                            color: selectedIndex.value == 0
                                ? ColorConst.blueColor
                                : ColorConst.textGreyColor,
                          ),
                          CustomIconButton(
                            onTap: () => selectedIndex.value = 1,
                            assetName: ImageAsset.icHeart,
                            color: selectedIndex.value == 1
                                ? ColorConst.blueColor
                                : ColorConst.textGreyColor,
                          ),
                          SizedBox(
                            width: Get.width * 0.1,
                          ),
                          CustomIconButton(
                            onTap: () => selectedIndex.value = 2,
                            assetName: ImageAsset.icNotification,
                            color: selectedIndex.value == 2
                                ? ColorConst.blueColor
                                : ColorConst.textGreyColor,
                          ),
                          CustomIconButton(
                            onTap: () => selectedIndex.value = 3,
                            assetName: ImageAsset.icProfile,
                            color: selectedIndex.value == 3
                                ? ColorConst.blueColor
                                : ColorConst.textGreyColor,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Path path = Path();
    // double w = size.width;
    // double h = size.height;
    // path.moveTo(0, 0); // Start
    // path.quadraticBezierTo(w * 0.2, h * 0.2 , w * 0.35, h * .25); // 1
    // path.quadraticBezierTo(w * 0.40, h * 0.25 , w * 0.40, h * .40); //2
    // path.quadraticBezierTo(w * 0.40, h * 0.75 , w * 0.5, h * .75); // 4
    // path.quadraticBezierTo(w * 0.60, h * 0.75, w * 0.60, h * 0.25); // 3
    // path.quadraticBezierTo(w * 0.60, h * 0.75, w * 0.60, h * 0.25); // 3
    // path.quadraticBezierTo(w * 0.60, h * 0.75, w * 0.60, h * .40);// 5
    // path.quadraticBezierTo(w * 0.8, h * 0.2 , w, 0);// 6
    // path.lineTo(w, h);
    // path.lineTo(0, h);

    // path.quadraticBezierTo(w * 0.40, 25, w * 0.40, 45);
    // path.quadraticBezierTo(w * 0.40, 80, w * 0.45, 80);
    // path.quadraticBezierTo(w * 0.60, 80, w * 0.60, 80);
    // path.quadraticBezierTo(w * 0.65, 80, w * 0.60, 25);
    // path.quadraticBezierTo(w * 0.65, 25, w * 0.70, 25);

    // path.close();
    // canvas.drawShadow(path, Colors.black, 10, true);
    // canvas.drawPath(path, paint);

    Path path = Path();
    path.moveTo(0, 20); // Start
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(Dimensions.r20), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
