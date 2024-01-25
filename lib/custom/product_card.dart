import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/core/model/design_model/product_data_model.dart';
import 'package:get/get.dart';

import '../core/widgets/custom_image.dart';
import '../features/bottomnavbar/tabs/home_tab_screen/product_view_screen.dart';

class ProductCard extends StatelessWidget {
  final ProductDataModel product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Get.to(() => ProductViewScreen(
            product: product,
            assets: product.asset,
            assets3d: product.asset3d,
          )),
      child: Container(
        width: Get.width / 2,
        margin: EdgeInsets.only(right: Dimensions.w10),
        decoration: BoxDecoration(
          color: ColorConst.whiteColor,
          borderRadius: BorderRadius.circular(Dimensions.r12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimensions.r12),
                  topRight: Radius.circular(Dimensions.r12)),
              child: CustomNetworkImage(
                image: product.asset[0],
                // onTap: null,
                height: Dimensions.h150,
                width: Get.width / 2,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.w10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // CustomSvgAssetImage(
                  //   image: ImageAsset.icHeart,
                  //   height: Dimensions.w15,
                  //   width: Dimensions.w15,
                  // ),

                  Text(
                    AppString.bestSeller.toUpperCase(),
                    style: fontStyleMedium12.apply(color: ColorConst.blueColor),
                  ),
                  Text(
                    product.title,
                    style: fontStyleMedium16.apply(
                        color: ColorConst.textGreyColor),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: Dimensions.commonPaddingForScreen,
                      bottom: Dimensions.commonPaddingForScreen),
                  child: Text(
                    "${product.currency} ${product.price.toString()}",
                    style: fontStyleRegular16,
                  ),
                ),
                Container(
                  height: Dimensions.w25,
                  width: Dimensions.w25,
                  decoration: BoxDecoration(
                      color: ColorConst.blueColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(Dimensions.r10),
                          bottomRight: Radius.circular(Dimensions.r10))),
                  child: Icon(
                    Icons.add,
                    color: ColorConst.whiteColor,
                    size: Dimensions.w20,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
