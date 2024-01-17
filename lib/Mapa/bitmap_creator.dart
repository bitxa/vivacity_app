import 'dart:ui' as ui;
import 'package:flutter/material.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<BitmapDescriptor> _createBitmapDescriptorFromIconData(
    IconData iconData, Color color) async {
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final textPainter = TextPainter(textDirection: TextDirection.ltr);

  textPainter.text = TextSpan(
    text: String.fromCharCode(iconData.codePoint),
    style: TextStyle(
      letterSpacing: 0.0,
      fontSize: 100.0,
      fontFamily: iconData.fontFamily,
      package: iconData.fontPackage,
      color: color,
    ),
  );

  textPainter.layout();
  textPainter.paint(canvas, Offset.zero);
  final picture = pictureRecorder.endRecording();
  final image = await picture.toImage(100, 100);
  final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(bytes!.buffer.asUint8List());
}

class LocationTag {
  final String label;
  final IconData iconData;
  final Color color;

  LocationTag({
    required this.label,
    required this.iconData,
    required this.color,
  });
}
