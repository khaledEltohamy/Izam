// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../config/theme/color.dart';
import '../validations.dart';

class TextFieldApp extends StatelessWidget with Validations {
  final String hint;
  final String? label;
  final Color? hintColor;
  final TextEditingController controllerText;
  final TextInputType textType;
  final String? errors;
  final bool isPassword;
  final bool withPrefixIcon;
  final Widget? prefixChild;
  final FocusNode? focusFieldNode;
  final double? width;
  final TextInputAction action;
  final Widget? suffixIcon;
  final Function()? onTap;
  final Function(String?)? onChange;
  final Function(String)? onFieldSubmitted;
  final Function()? onEditingComplete;
  final bool readOnly;
  final double? widthPrifxIcon;
  final String? Function(String?)? validator;

  TextFieldApp({
    required this.hint,
    required this.controllerText,
    required this.textType,
    required this.isPassword,
    this.label,
    required this.withPrefixIcon,
    required this.prefixChild,
    required this.action,
    this.focusFieldNode,
    this.errors,
    this.suffixIcon,
    this.onTap,
    this.readOnly = false,
    this.validator,
    this.onChange,
    this.width,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.widthPrifxIcon,
    this.hintColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChange,
      onFieldSubmitted: onFieldSubmitted,
      onEditingComplete: onEditingComplete,
      readOnly: readOnly,
      focusNode: focusFieldNode,
      enableInteractiveSelection: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      onTap: onTap,
      inputFormatters: [
        FilteringTextInputFormatter.deny(RegExp(r'^0+')),
      ],
      keyboardType: textType,
      validator: (value) => validator!(value),
      cursorColor: ColorApp.black,
      controller: controllerText,
      textInputAction: action,
      decoration: _textFieldInputDecoration(context),
      obscureText: isPassword,
    );
  }

  InputDecoration _textFieldInputDecoration(BuildContext context) =>
      InputDecoration(
        hintTextDirection: TextDirection.ltr,
        hintText: hint,
        labelText: label,
        suffixIcon: Padding(
          padding: const EdgeInsets.only(right: 12),
          child: suffixIcon,
        ), //Adding Suffix Icon to password Form
        suffixIconConstraints: const BoxConstraints(minWidth: 20, maxWidth: 34),
      );
}

class LowerCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toLowerCase(),
      selection: newValue.selection,
    );
  }
}
