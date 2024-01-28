import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/core/model/design_model/product_data_model.dart';
import 'package:flutter_project_base/core/widgets/custom_image.dart';
import 'package:flutter_project_base/core/widgets/text_field/text_field/my_text_field.dart';
import 'package:flutter_project_base/custom/product_card.dart';
import 'package:flutter_project_base/features/bottomnavbar/tabs/home_tab_screen/cart_screen.dart';
import 'package:get/get.dart';

class HomeTabScreen extends StatelessWidget {
  final Function() openDrawer;

  HomeTabScreen({super.key, required this.openDrawer});

  final List<String> categories = ['All Shoes', 'Outdoor', 'Tennis', 'Running'];
  final RxList<String> selectedCategories = RxList<String>([]);

  // List<String> popularShoesName = [];
  // List<String> popularShoesAsset = [];
  // List<String> popularShoesAllAsset = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              /// App Bar
              Padding(
                padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Material(
                          color: ColorConst.btnGrayColor,
                          borderRadius: BorderRadius.circular(Dimensions.r40),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(Dimensions.r40),
                            onTap: openDrawer,
                            child: Container(
                                padding: EdgeInsets.all(Dimensions.w15),
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                                child: CustomSvgAssetImage(
                                  image: ImageAsset.icHamburger,
                                  height: Dimensions.w17,
                                  width: Dimensions.w17,
                                )),
                          ),
                        ),
                        CustomSvgAssetImage(image: ImageAsset.icExplore),
                        Material(
                          color: ColorConst.whiteColor,
                          borderRadius: BorderRadius.circular(Dimensions.r40),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(Dimensions.r40),
                            onTap: () => Get.to(CartScreen()),
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
                    SizedBox(
                      height: Dimensions.h10,
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: MyTextField(
                            height: Dimensions.h40,
                            hintText: AppString.lookingForShoes,
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(Dimensions.w7),
                              child: CustomSvgAssetImage(
                                image: ImageAsset.icSearch,
                                height: Dimensions.w10,
                                width: Dimensions.w10,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Dimensions.w10,
                        ),
                        Material(
                          color: ColorConst.primaryColor,
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
                                  image: ImageAsset.icFilter,
                                  height: Dimensions.w20,
                                  width: Dimensions.w20,
                                )),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Dimensions.h20,
                    ),
                    Text(
                      AppString.selectCategory,
                      style: fontStyleSemiBold16,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.h40,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.commonPaddingForScreen),
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) => Padding(
                    padding: EdgeInsets.only(right: Dimensions.w10),
                    child: Obx(
                      () => Material(
                        borderRadius: BorderRadius.circular(Dimensions.r12),
                        color: selectedCategories.contains(categories[index])
                            ? ColorConst.blueColor
                            : ColorConst.whiteColor,
                        child: InkWell(
                          splashColor:
                              ColorConst.blueSecondaryColor.withOpacity(0.2),
                          highlightColor:
                              ColorConst.blueSecondaryColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(Dimensions.r12),
                          onTap: () {
                            if (selectedCategories
                                .contains(categories[index])) {
                              selectedCategories.remove(categories[index]);
                            } else {
                              selectedCategories.add(categories[index]);
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: Dimensions.w20),
                            child: Center(
                                child: Text(
                              categories[index],
                              style: fontStyleRegular13.apply(
                                  color: selectedCategories
                                          .contains(categories[index])
                                      ? ColorConst.whiteColor
                                      : ColorConst.blackColor),
                            )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              // POPULAR SHOES
              Padding(
                padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.popularShoes,
                      style: fontStyleSemiBold16,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppString.seeAll,
                        style: fontStyleMedium13.apply(
                            color: ColorConst.blueColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.h251,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.commonPaddingForScreen),
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductDataModel.sampleProductData.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: ProductDataModel.sampleProductData[index]);
                  },
                ),
              ),

              // NEW Arrivals
              Padding(
                padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      AppString.newArrivals,
                      style: fontStyleSemiBold16,
                    ),
                    InkWell(
                      onTap: () {},
                      child: Text(
                        AppString.seeAll,
                        style: fontStyleMedium13.apply(
                            color: ColorConst.blueColor),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: Dimensions.h251,
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                      horizontal: Dimensions.commonPaddingForScreen),
                  scrollDirection: Axis.horizontal,
                  itemCount: ProductDataModel.sampleProductData2.length,
                  itemBuilder: (context, index) {
                    return ProductCard(
                        product: ProductDataModel.sampleProductData2[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
