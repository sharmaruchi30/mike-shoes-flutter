import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:get/get.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
          child: Column(
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
                  ),
                ],
              ),
              SizedBox(
                height: Dimensions.h10,
              ),
              Text(
                AppString.otpVerification,
                style: fontStyleBold32,
              ),
              SizedBox(
                height: Dimensions.h10,
              ),
              Text(
                AppString.pleaseCheckYourEmailToSeeTheVerificationCode,
                style:
                    fontStyleRegular16.apply(color: ColorConst.textGreyColor),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: Dimensions.h20,
              ),
              OtpTextField(
                numberOfFields: 4,
                showFieldAsBox: true,
                borderWidth: 0,
                filled: true,
                fillColor: ColorConst.btnGrayColor,
                fieldWidth: Get.width / 5,
                focusedBorderColor: ColorConst.btnGrayColor,

                borderRadius: BorderRadius.circular(Dimensions.r12),
                onCodeChanged: (String code) {},
                onSubmit: (String verificationCode) {}, // end onSubmit
              ),
              SizedBox(
                height: Dimensions.h20,
              ),
              MyButton(title: AppString.verify, onPressed: () {}),
              SizedBox(
                height: Dimensions.h5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppString.resendCodeTo,
                    style:
                        fontStyleRegular12.apply(color: ColorConst.textGreyColor),
                  ),
                  Text(
                    '00:30',
                    style:
                    fontStyleRegular12.apply(color: ColorConst.textGreyColor),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
