import 'package:flutter/material.dart';
import 'package:izam/src/core/widget/text_app.dart';

import '../../config/theme/color.dart';

class ButtonApp extends StatelessWidget {
  final Color? color;
  final String title;
  final Color? titleColor;
  final double minWidth;
  final double? maxWidth;
  final double? minHeight;
  final BoxBorder? border;
  final FontWeight? fontWeightText;
  final double? maxHeight;
  final double? elevation;
  final Function() onTap;
  final Widget? child;
  const ButtonApp({
    super.key,
    this.color,
    required this.title,
    this.titleColor,
    required this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
    this.elevation,
    required this.onTap,
    this.child,
    this.border,
    this.fontWeightText,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
              color: color ?? ColorApp.blueButton(1.0),
              borderRadius: BorderRadius.circular(5),
              border: border),
          padding: const EdgeInsets.symmetric(horizontal: 12),
          constraints: BoxConstraints(
              minWidth: minWidth,
              maxWidth: maxWidth ?? double.infinity,
              minHeight: minHeight ?? 42,
              maxHeight: maxHeight ?? 54),
          child: Center(
            child: child ??
                TextApp(
                  text: title,
                  size: 20,
                  fontWeight: fontWeightText,
                  textColor: titleColor,
                  maxSize: 24,
                ),
          )),
    );
  }
}

class ButtonLoading extends StatelessWidget {
  final String title;
  const ButtonLoading({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonApp(
          minWidth: 50,
          maxWidth: 80,
          minHeight: 42,
          maxHeight: 52,
          title: title,
          child: CircularProgressIndicator(color: ColorApp.white),
          onTap: () {}),
    );
  }
}

class ButtonSuccess extends StatelessWidget {
  final Widget title;
  const ButtonSuccess({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ButtonApp(
          minWidth: 50,
          maxWidth: 80,
          minHeight: 42,
          maxHeight: 52,
          title: "",
          child: title,
          onTap: () {}),
    );
  }
}
