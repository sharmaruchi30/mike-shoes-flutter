import 'package:flutter_project_base/core/basic_features.dart';

class ProductDataModel {
  final String title;
  final String currency;
  final double price;
  final List<String> asset;
  final List<String> asset3d;

  ProductDataModel({
    required this.title,
    required this.currency,
    required this.price,
    required this.asset,
    required this.asset3d,
  });

  static List<ProductDataModel> sampleProductData = [
    ProductDataModel(title: 'Mike Force', currency: '\$', price: 249.0, asset: [
      ImageAsset.airforce1,
      ImageAsset.airforce2,
      ImageAsset.airforce3,
      ImageAsset.airforce4
    ], asset3d: [
      ImageAsset.perfume3d
    ]),
    ProductDataModel(
        title: 'Mike Jordan',
        currency: '\$',
        price: 580.0,
        asset: [
          ImageAsset.airjordan1,
          ImageAsset.airjordan2,
          ImageAsset.airjordan3,
          ImageAsset.airjordan4
        ],
        asset3d: [
          ImageAsset.perfume3d
        ]),
  ];
}
