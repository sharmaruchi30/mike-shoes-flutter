import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/features/authentication/otp_verification_screen.dart';
import 'package:get/get.dart';

import '../../core/widgets/custom_image.dart';
import '../../core/widgets/text_field/text_field/my_text_field.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: Dimensions.commonPaddingForScreen),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                AppString.alreadyHaveAccount,
                style: fontStyleMedium16.apply(color: ColorConst.textGreyColor),
              ),
              InkWell(
                  borderRadius: BorderRadius.circular(Dimensions.r8),
                  onTap: () {
                    Get.back();
                  },
                  child: Text(AppString.login, style: fontStyleMedium16)),
            ],
          ),
        ),
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
                    AppString.registerAccount,
                    style: fontStyleBold32,
                  ),
                ),
                SizedBox(
                  height: Dimensions.h10,
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    AppString.fillYourDetailsOrContinueWithSocialMedia,
                    style: fontStyleRegular16.apply(
                        color: ColorConst.textGreyColor),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
                Text(
                  AppString.yourName,
                  style: fontStyleMedium16,
                ),
                SizedBox(
                  height: Dimensions.h5,
                ),
                const MyTextField(
                  hintText: AppString.xHintText,
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
                Text(
                  AppString.emailAddress,
                  style: fontStyleMedium16,
                ),
                SizedBox(
                  height: Dimensions.h5,
                ),
                const MyTextField(
                  hintText: AppString.emailHint,
                ),
                SizedBox(
                  height: Dimensions.h20,
                ),
                Text(
                  AppString.password,
                  style: fontStyleMedium16,
                ),
                SizedBox(
                  height: Dimensions.h5,
                ),
                const MyTextField(
                  obscureText: true,
                ),
                SizedBox(
                  height: Dimensions.h40,
                ),
                MyButton(
                  height: Dimensions.h45,
                  title: AppString.signUp,
                  onPressed: () {
                    Get.to(() => const OtpVerificationScreen());
                  },
                  btnBgColor: ColorConst.blueColor,
                ),
                SizedBox(
                  height: Dimensions.h10,
                ),
                MyButton(
                  height: Dimensions.h45,
                  title: AppString.signInWithGoogle,
                  textStyle: fontStyleSemiBold15,
                  leadingIcon: Padding(
                    padding: EdgeInsets.only(right: Dimensions.w10),
                    child: CustomSvgAssetImage(
                      image: ImageAsset.icGoogle,
                    ),
                  ),
                  onPressed: () {},
                  btnBgColor: ColorConst.btnGrayColor,
                ),
              ],
            ),
          ),
        ));
  }
}
