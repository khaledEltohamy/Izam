import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam/src/core/validation/textFiled/text_field_app.dart';
import '../../../config/theme/color.dart';
import '../cubit/visible_password_cubit.dart';
import '../validations.dart';

class TextFieldWidget {
  static Widget emailTextField({
    required BuildContext context,
    String? hint,
    required TextEditingController textEditingController,
  }) =>
      TextFieldApp(
        controllerText: textEditingController,
        textType: TextInputType.emailAddress,
        isPassword: false,
        action: TextInputAction.next,
        withPrefixIcon: false,
        prefixChild: const Icon(Icons.mail_outline_rounded),
        hint: hint ?? " ",
        validator: (_) => Validations.validateEmail(textEditingController.text),
      );

  static Widget passwordTextField({
    required BuildContext context,
    String? hint,
    required TextEditingController textEditingController,
  }) =>
      BlocBuilder<VisiblePasswordCubit, bool>(
        builder: (context, state) {
          return TextFieldApp(
              hint: hint ?? "",
              controllerText: textEditingController,
              textType: TextInputType.text,
              isPassword: state,
              action: TextInputAction.done,
              withPrefixIcon: false,
              suffixIcon: GestureDetector(
                onTap: () {
                  context
                      .read<VisiblePasswordCubit>()
                      .changeVisiblePassword(); //Need to convert to stf widget
                },
                child: state
                    ? Icon(Icons.visibility_off, color: ColorApp.black)
                    : Icon(Icons.visibility, color: ColorApp.blueButton(1.0)),
              ),
              validator: (_) =>
                  Validations.validatePassword(textEditingController.text),
              prefixChild: null);
        },
      );
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
