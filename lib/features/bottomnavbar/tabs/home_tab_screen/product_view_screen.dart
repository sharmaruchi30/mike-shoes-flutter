import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

import '../../../../core/widgets/custom_image.dart';

class ProductViewScreen extends StatelessWidget {
  final List<String> assets;
  final List<String> assets3d;

  ProductViewScreen({super.key, required this.assets, required this.assets3d});

  PageController pageController =
      Get.put(PageController(), tag: 'pageController');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            /// AppBar
            Padding(
              padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Material(
                    color: ColorConst.whiteColor,
                    borderRadius: BorderRadius.circular(Dimensions.r40),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(Dimensions.r40),
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        padding: EdgeInsets.all(Dimensions.w15),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: Dimensions.w18,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    AppString.sneakerShop,
                    style: fontStyleSemiBold16,
                  ),
                  Material(
                    color: ColorConst.whiteColor,
                    borderRadius: BorderRadius.circular(Dimensions.r40),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(Dimensions.r40),
                      onTap: () {},
                      child: Container(
                          padding: EdgeInsets.all(Dimensions.w10),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: CustomSvgAssetImage(
                            image: ImageAsset.icBag,
                            height: Dimensions.w25,
                            width: Dimensions.w25,
                          )),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: Get.height * 0.3,
              child: PageView(
                controller: pageController,
                children: [
                  for (int i = 0; i < assets.length; i++)
                    SizedBox(
                        height: Get.height * 0.3,
                        child: CustomAssetImage(
                          onTap: null,
                          image: assets[i],
                        )),
                  for (int i = 0; i < assets3d.length; i++)
                    SizedBox(
                      height: Get.height * 0.3,
                      child: ModelViewer(
                        backgroundColor: ColorConst.screenBackground,
                        src: assets3d[i],
                        ar: true,
                        autoRotate: true,
                        disableZoom: true,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: Dimensions.h20,
            ),
            SizedBox(
              height: Dimensions.h80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: assets.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(horizontal: Dimensions.w10),
                  child: GestureDetector(
                    onTap: () {
                      pageController.animateToPage(index,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.linear);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(Dimensions.r12),
                      child: CustomAssetImage(
                        width: Dimensions.h80,
                        onTap: null,
                        image: assets[index],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
