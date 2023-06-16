import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../config/theme/color.dart';

class TextApp extends StatelessWidget {
  final String text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? size;
  final TextAlign? textAlign;
  final double? maxSize;
  final int? maxline;
  const TextApp(
      {super.key,
      required this.text,
      this.textColor,
      this.fontWeight,
      this.size,
      this.maxSize,
      this.maxline,
      this.textAlign});

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      maxLines: maxline ?? 1,
      maxFontSize: maxSize ?? double.infinity,
      minFontSize: size ?? 12,
      textAlign: textAlign,
      style: TextStyle(
        color: textColor ?? ColorApp.white,
        fontWeight: fontWeight ?? FontWeight.w900,
      ),
    );
  }
}
