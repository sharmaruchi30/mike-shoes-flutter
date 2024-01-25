import 'package:flutter_project_base/core/basic_features.dart';

class ProductDataModel {
  final String title;
  final String fullTitle;
  final String description;
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
    required this.fullTitle,
    required this.description,
  });

  static List<ProductDataModel> sampleProductData = [
    ProductDataModel(
        title: 'Mike Force',
        fullTitle: 'Mike Force Max 270 Essential',
        description:
            'The Mike Force Max 270 Essential is a stylish and performance-oriented athletic shoe that seamlessly blends comfort with cutting-edge design. With its innovative Max Air cushioning technology, these shoes provide optimal impact absorption for a responsive and comfortable stride. ',
        currency: '\$',
        price: 249.0,
        asset: [
          'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/25458954/2023/10/13/51d704c3-9ed9-489d-8659-1f87d6cd6f5d1697176413846RedTapeLeatherBikerBoots5.jpg',
          'https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/25458954/2023/10/13/d32b11f0-a2cf-44e2-8028-88d632b6552a1697176413821RedTapeLeatherBikerBoots3.jpg',
          'https://assets.myntassets.com/h_720,q_90,w_540/v1/assets/images/25458954/2023/10/13/35c2a77f-6c33-4f62-80a0-8f184ff06da21697176413862RedTapeLeatherBikerBoots4.jpg',
          'https://assets.myntassets.com/h_1440,q_90,w_1080/v1/assets/images/25458954/2023/10/13/b7a1d374-ee9e-455d-ab1f-14c83432c29b1697176413854RedTapeLeatherBikerBoots2.jpg',

          // ImageAsset.airforce1,
          // ImageAsset.airforce2,
          // ImageAsset.airforce3,
          // ImageAsset.airforce4
        ],
        asset3d: [
          ImageAsset.leatherShoes3d
        ]),
    ProductDataModel(
        title: 'Mike Jordan',
        fullTitle: 'Mike Jordan Classic 120',
        description:
            'The Mike Jordan Classic 120 is a timeless and iconic sneaker, paying homage to the basketball legend\'s enduring legacy. Designed with a perfect balance of style and performance, these shoes feature premium materials and craftsmanship.',
        currency: '\$',
        price: 580.0,
        asset: [
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2c9a790b-8421-4bd2-a5de-e83817e26035/dunk-low-lx-nbhd-shoes-D1868r.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d015d68b-1318-4c9d-bc79-9ac67c01cae4/dunk-low-lx-nbhd-shoes-D1868r.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/604ca4ae-e1b7-423d-be90-31640f8d045e/dunk-low-lx-nbhd-shoes-D1868r.png',
          'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5ca80c60-82c6-4c4e-bff5-052593ef7759/dunk-low-lx-nbhd-shoes-D1868r.png'
        ],
        asset3d: [
          ImageAsset.nikeShoes3d
        ]),
    ProductDataModel(
      title: 'Mike Free Flex',
      fullTitle: 'Mike Free Flex Trainer',
      description:
          'Unleash your full potential with the Mike Free Flex Trainer. Designed for versatile training, these shoes offer a flexible and supportive fit. The Free Flex technology allows natural movement, while the durable construction ensures stability during intense workouts. Elevate your training sessions with the ultimate in flexibility and comfort.',
      currency: '\$',
      price: 99.99,
      asset: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/d4776188-7104-419e-a1c8-f055737b9e6e/court-vision-low-next-nature-shoes-N2fFHb.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8c75f88c-968f-424c-9286-5c668336fed8/court-vision-low-next-nature-shoes-N2fFHb.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/a0aae2ee-c89e-4eb2-a1b2-3644e6a10828/court-vision-low-next-nature-shoes-N2fFHb.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e9776563-0cf2-432e-94e2-eb5159dd4a57/court-vision-low-next-nature-shoes-N2fFHb.png'
      ],
      asset3d: [],
    ),
  ];
  static List<ProductDataModel> sampleProductData2 = [
    ProductDataModel(
      title: 'Mike Air Fusion',
      fullTitle: 'Mike Air Fusion 2.0',
      description:
          'Experience the perfect fusion of style and comfort with the Mike Air Fusion 2.0. These lifestyle sneakers feature a modern design and Air Max cushioning for all-day comfort. Whether you\'re hitting the streets or relaxing with friends, the Air Fusion 2.0 keeps you on-trend and at ease.',
      currency: '\$',
      price: 129.99,
      asset: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/0e261286-0c03-4b3e-ae4e-dba569d41548/air-jordan-legacy-312-low-shoes-v3FcRT.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/50e906af-7ae1-44aa-9735-59fc0eefc49f/air-jordan-legacy-312-low-shoes-v3FcRT.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/fd36c762-a33c-4e1d-bcf2-16f5335d229d/air-jordan-legacy-312-low-shoes-v3FcRT.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco,u_126ab356-44d8-4a06-89b4-fcdcc8df0245,c_scale,fl_relative,w_1.0,h_1.0,fl_layer_apply/fa1a24e8-ff57-43b1-ab1a-b929ee5b175b/air-jordan-legacy-312-low-shoes-v3FcRT.png'
      ],
      asset3d: [],
    ),
    ProductDataModel(
      title: 'Mike React Runner',
      fullTitle: 'Mike React Runner Pro',
      description:
          'Elevate your running experience with the Mike React Runner Pro. Engineered for performance, these shoes feature responsive React foam cushioning, ensuring a smooth and energy-efficient stride. The sleek design and breathable upper make them a perfect choice for both casual runs and daily activities.',
      currency: '\$',
      price: 189.99,
      asset: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5619ddca-fb24-4fbb-988c-ae22fc1cc0a9/air-force-1-07-lv8-shoes-lPdFPQ.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/8757e64a-4fbc-44d3-96c1-8f9fb60345e0/air-force-1-07-lv8-shoes-lPdFPQ.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/2873384f-22aa-4774-8e45-6e6f4cc20e6c/air-force-1-07-lv8-shoes-lPdFPQ.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5a05182b-4160-41a6-89cd-5c47b6e917c4/air-force-1-07-lv8-shoes-lPdFPQ.png'
      ],
      asset3d: [],
    ),
    ProductDataModel(
      title: 'Mike Zoom Precision',
      fullTitle: 'Mike Zoom Precision X',
      description:
          'Introducing the Mike Zoom Precision X, a high-performance basketball shoe designed for precision and agility on the court. With Zoom Air technology providing exceptional responsiveness, these shoes deliver explosive energy for quick cuts and dynamic plays. Make every move count with the precision of Mike Zoom.',
      currency: '\$',
      price: 169.99,
      asset: [
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/5f9fdb54-e995-478c-99ed-a4be03fe3b49/air-max-ishod-shoes-pJPHs6.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/1c94b161-a27f-442f-884b-7ebb25a1d17a/air-max-ishod-shoes-pJPHs6.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/218a0e5e-2a1c-48c2-aec9-861fdc7b0720/air-max-ishod-shoes-pJPHs6.png',
        'https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/dc9ad8ee-96d4-4c56-9338-d7d71e1616ab/air-max-ishod-shoes-pJPHs6.png',
      ],
      asset3d: [],
    ),
  ];
}
