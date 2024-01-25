import 'package:flutter/material.dart';

enum MD2IndicatorSize {
  tiny,
  normal,
  full,
}

class MD2Indicator extends Decoration {
  final double indicatorHeight;
  final Color indicatorColor;
  final MD2IndicatorSize indicatorSize;

  const MD2Indicator(
      {required this.indicatorHeight,
      required this.indicatorColor,
      required this.indicatorSize});

  @override
  MD2Painter createBoxPainter([VoidCallback? onChanged]) {
    return MD2Painter(this, onChanged!);
  }
}

class MD2Painter extends BoxPainter {
  final MD2Indicator decoration;

  MD2Painter(this.decoration, VoidCallback onChanged);

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    assert(configuration.size != null);

    Rect? rect;
    if (decoration.indicatorSize == MD2IndicatorSize.full) {
      rect = Offset(offset.dx,
              (configuration.size!.height - decoration.indicatorHeight)) &
          Size(configuration.size!.width, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == MD2IndicatorSize.normal) {
      rect = Offset(offset.dx + 6,
              (configuration.size!.height - decoration.indicatorHeight)) &
          Size(configuration.size!.width - 12, decoration.indicatorHeight);
    } else if (decoration.indicatorSize == MD2IndicatorSize.tiny) {
      rect = Offset(offset.dx + configuration.size!.width / 2 - 8,
              (configuration.size!.height - decoration.indicatorHeight)) &
          Size(16, decoration.indicatorHeight);
    }

    final Paint paint = Paint();
    paint.color = decoration.indicatorColor;
    paint.style = PaintingStyle.fill;
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          rect!,
          // bottomRight: const Radius.circular(10),
          // bottomLeft: const Radius.circular(10),
          topRight: const Radius.circular(10),
          topLeft: const Radius.circular(10),
        ),
        paint);



    Path path_1 = Path()
      ..moveTo(offset.dx + configuration.size!.width / 2, // X coordinate remains the same
          (configuration.size!.height - decoration.indicatorHeight - 15)) // Y coordinate remains the same
      ..lineTo(offset.dx + configuration.size!.width / 2 - 8, // Adjusted X coordinate
          (configuration.size!.height - decoration.indicatorHeight) + 2) // Adjusted Y coordinate
      ..lineTo(offset.dx + configuration.size!.width / 2 + 8, // Adjusted X coordinate
          (configuration.size!.height - decoration.indicatorHeight) + 2) // Adjusted Y coordinate
      ..close();

    // Path path_1 = Path()
    //   ..moveTo(offset.dx + configuration.size!.width / 2,
    //       (configuration.size!.height - decoration.indicatorHeight - 10)) // Move up by 10 units
    //   ..lineTo(offset.dx + configuration.size!.width / 2 - 13,
    //       (configuration.size!.height - decoration.indicatorHeight) + 12) // Adjusted Y coordinate
    //   ..lineTo(offset.dx + configuration.size!.width / 2 + 13,
    //       (configuration.size!.height - decoration.indicatorHeight) + 12) // Adjusted Y coordinate
    //   ..close();


    Paint paint_1_fill = Paint()
      ..style = PaintingStyle.fill;
    paint_1_fill.color = decoration.indicatorColor;
    paint_1_fill.style = PaintingStyle.fill;
    canvas.drawPath(path_1, paint_1_fill);
  }

  }
