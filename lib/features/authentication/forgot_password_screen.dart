import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_image.dart';
import '../../core/widgets/text_field/text_field/my_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Material(
                  color: ColorConst.btnGrayColor,
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
                )
              ],
            ),
            SizedBox(
              height: Dimensions.h10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppString.forgotPassword,
                style: fontStyleBold32,
              ),
            ),
            SizedBox(
              height: Dimensions.h10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                AppString.enterYourEmailToReset,
                style:
                    fontStyleRegular16.apply(color: ColorConst.textGreyColor),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: Dimensions.h20,
            ),
            const MyTextField(
              hintText: AppString.xHintText,
            ),
            SizedBox(
              height: Dimensions.h40,
            ),
            MyButton(
              height: Dimensions.h45,
              title: AppString.resetPassword,
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          content: SizedBox(
                            height: Dimensions.h130,
                            width: Get.width * 0.8,
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(Dimensions.w10),
                                  decoration: const BoxDecoration(
                                      color: Colors.blue,
                                      shape: BoxShape.circle),
                                  child: CustomSvgAssetImage(
                                    image: ImageAsset.icEmail,
                                  ),
                                ),
                                SizedBox(height: Dimensions.h20,),
                                Text(
                                  AppString.checkYourEmail,
                                  style: fontStyleBold16,
                                ),
                                Text(
                                  AppString.weHaveSendRecoveryCode,
                                  style: fontStyleRegular16.apply(
                                      color: ColorConst.textGreyColor),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ));
              },
              btnBgColor: ColorConst.blueColor,
            ),
          ],
        ),
      ),
    ));
  }
}
