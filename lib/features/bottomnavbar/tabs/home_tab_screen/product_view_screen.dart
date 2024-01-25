import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:get/get.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:readmore/readmore.dart';

import '../../../../core/model/design_model/product_data_model.dart';
import '../../../../core/widgets/custom_image.dart';

class ProductViewScreen extends StatelessWidget {
  final List<String> assets;
  final List<String> assets3d;
  final ProductDataModel product;

  ProductViewScreen(
      {super.key,
      required this.assets,
      required this.assets3d,
      required this.product});

  final PageController pageController =
      Get.put(PageController(), tag: 'pageController');
  RxBool liked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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

              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimensions.commonPaddingForScreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // TITLE
                    Text(
                      product.fullTitle,
                      style: fontStyleBold26,
                    ),
                    // CATEGORY
                    Text(
                      'Men\'s Shoes',
                      style: fontStyleMedium16.apply(
                          color: ColorConst.textGreyColor),
                    ),

                    // PRICE
                    Text(
                      "${product.currency} ${product.price}",
                      style: fontStyleBlack23,
                    ),
                    SizedBox(
                      height: Dimensions.h10,
                    )
                  ],
                ),
              ),
              // Main Content
              SizedBox(
                height: Get.height * 0.3,
                child: PageView(
                  controller: pageController,
                  children: [
                    for (int i = 0; i < assets3d.length; i++)
                      SizedBox(
                        height: Get.height * 0.3,
                        child: ModelViewer(
                          backgroundColor: ColorConst.screenBackground,
                          src: assets3d[i],
                          ar: true,
                          autoRotate: true,
                          // disableZoom: true,
                        ),
                      ),
                    for (int i = assets3d.length; i < assets.length; i++)
                      SizedBox(
                          height: Get.height * 0.3,
                          child: CustomNetworkImage(
                            image: assets[i],
                            height: Get.height * 0.3,
                            width: Get.width * 0.3,
                            // image: assets[i],
                          )),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.h20,
              ),
              // IMAGES
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
                        child: CustomNetworkImage(
                          width: Dimensions.h80,
                          height: Dimensions.h80,
                          // onTap: null,
                          image: assets[index],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
                child: Column(
                  children: [
                    ReadMoreText(
                      product.description,
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Show more',
                      trimExpandedText: 'Show less',
                      style: fontStyleRegular14,
                      lessStyle:
                          fontStyleRegular14.apply(color: ColorConst.blueColor),
                      moreStyle:
                          fontStyleRegular14.apply(color: ColorConst.blueColor),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
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
                  liked.value = !liked.value;
                },
                child: Container(
                    padding: EdgeInsets.all(Dimensions.w15),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Obx(
                      () => CustomSvgAssetImage(
                        image: liked.value
                            ? ImageAsset.icHeartFilled
                            : ImageAsset.icHeart,
                        height: Dimensions.w25,
                        width: Dimensions.w25,
                      ),
                    )),
              ),
            ),
            MyButton(
              title: AppString.addToCart,
              onPressed: () {},
              leadingIcon: Padding(
                padding: EdgeInsets.only(right: Dimensions.w10),
                child: CustomSvgAssetImage(
                  image: ImageAsset.icBag,
                  color: ColorConst.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
