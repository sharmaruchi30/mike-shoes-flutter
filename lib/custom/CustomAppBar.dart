import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';
import 'package:flutter_project_base/custom/custom_icon_button.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final String? leadingIconAsset;

  final String? actionIconAsset;

  final Widget? leadingIcon;
  final Function()? onLeadingTap;
  final Function()? onActionTap;

  final Widget? actionIcon;

  final EdgeInsets? padding;

  const CustomAppBar(
      {super.key,
      this.title,
      this.leadingIconAsset,
      this.actionIconAsset,
      this.leadingIcon,
      this.actionIcon,
      this.padding,
      this.onLeadingTap,
      this.onActionTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(Dimensions.commonPaddingForScreen),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leadingIcon ??
              CustomIconButton(
                onTap: onLeadingTap ?? () => Get.back(),
                icon: Icon(
                  Icons.arrow_back_ios_new,
                  size: Dimensions.w18,
                ),
                assetName: leadingIconAsset,
              ),
          title != null
              ? Text(
                  title!,
                  style: fontStyleSemiBold16,
                )
              : const SizedBox(),
          actionIcon ??
              SizedBox(
                width: Get.width * 0.1,
              )
        ],
      ),
    );
  }
}
