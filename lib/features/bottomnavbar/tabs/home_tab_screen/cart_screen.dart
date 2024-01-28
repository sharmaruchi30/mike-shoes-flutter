import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/core/model/design_model/product_data_model.dart';
import 'package:flutter_project_base/custom/CustomAppBar.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import '../../../../core/widgets/custom_image.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  RxInt itemCount = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: AppString.myCart,
            ),
            Padding(
              padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
              child: Column(
                children: [
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: ProductDataModel.sampleProductData2.length,
                    itemBuilder: (context, index) => Padding(
                      padding: EdgeInsets.only(bottom: Dimensions.h10),
                      child: Slidable(
                        startActionPane: ActionPane(
                          extentRatio: 1 / 4,
                          motion: const StretchMotion(),
                          children: [
                            Flexible(
                              child: Container(
                                // padding: EdgeInsets.all(Dimensions.w5),
                                // height: Dimensions.h100,
                                width: Get.width / 4 - Dimensions.w20,
                                decoration: BoxDecoration(
                                    color: ColorConst.blueColor,
                                    borderRadius:
                                        BorderRadius.circular(Dimensions.r12)),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                      onPressed: () => itemCount.value++,
                                      icon: Icon(
                                        Icons.add,
                                        color: ColorConst.whiteColor,
                                        size: Dimensions.w20,
                                      ),
                                    ),
                                    Obx(
                                      () => Text(
                                        itemCount.value.toString(),
                                        style: fontStyleSemiBold20.apply(
                                            color: ColorConst.whiteColor),
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => itemCount.value--,
                                      icon: Icon(
                                        Icons.remove,
                                        color: ColorConst.whiteColor,
                                        size: Dimensions.w20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                        endActionPane: ActionPane(
                          extentRatio: 1 / 4,
                          motion: const StretchMotion(),
                          children: [
                            Flexible(
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  // padding: EdgeInsets.all(Dimensions.w5),
                                  // height: Dimensions.h100,
                                  width: Get.width / 4 - Dimensions.w20,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.r12)),
                                  child: Center(
                                    child: Icon(
                                      Icons.delete_outline,
                                      color: ColorConst.whiteColor,
                                      size: Dimensions.w25,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        child: Container(
                          height: Dimensions.h100,
                          padding: EdgeInsets.all(Dimensions.w10),
                          width: Get.width,
                          decoration: BoxDecoration(
                              color: ColorConst.whiteColor,
                              borderRadius:
                                  BorderRadius.circular(Dimensions.r12)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.r10),
                                child: CustomNetworkImage(
                                  image: ProductDataModel
                                      .sampleProductData2[index].asset[0],
                                  height: Dimensions.w90,
                                  width: Dimensions.w90,
                                  // image: assets[i],
                                ),
                              ),
                              SizedBox(
                                width: Dimensions.w10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    ProductDataModel
                                        .sampleProductData2[index].title,
                                    style: fontStyleMedium16,
                                  ),
                                  Text(
                                    "${ProductDataModel.sampleProductData2[index].currency} ${ProductDataModel.sampleProductData2[index].price.toString()}",
                                    style: fontStyleSemiBold16,
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
