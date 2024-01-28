import 'package:flutter/material.dart';
import 'package:flutter_project_base/core/basic_features.dart';

import '../core/widgets/custom_image.dart';

class CustomIconButton extends StatelessWidget {
  final Widget? icon;
  final String? assetName;
  final double? height;
  final Function() onTap;
  final Color? color;
  final Color? backgroundColor;

  const CustomIconButton(
      {super.key,
      this.icon,
      required this.onTap,
      this.assetName,
      this.height,
      this.backgroundColor,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor ?? ColorConst.whiteColor,
      borderRadius: BorderRadius.circular(Dimensions.r40),
      child: InkWell(
        borderRadius: BorderRadius.circular(height ?? Dimensions.r40),
        onTap: onTap,
        child: Container(
            padding: EdgeInsets.all(Dimensions.w15),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: icon ??
                CustomSvgAssetImage(
                  image: assetName ?? ImageAsset.icBag,
                  height: Dimensions.w25,
                  width: Dimensions.w25,
                  color: color,
                )),
      ),
    );
  }
}
