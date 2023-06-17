import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:izam/src/core/validation/textFiled/text_fields_widgets.dart';
import 'package:izam/src/utils/extensions/screen_dimensions.dart';

import '../../../../../config/theme/color.dart';
import '../component/auth_button.dart';

// ignore: must_be_immutable
class FormContainerWidget extends StatelessWidget {
  FormContainerWidget({super.key});
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _passTextController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth > 600 ? 440 : 362,
        margin: const EdgeInsets.symmetric(vertical: 48),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 48),
        decoration: BoxDecoration(
          color: ColorApp.white,
          borderRadius: BorderRadius.circular(24),
          boxShadow: [
            BoxShadow(color: ColorApp.gryShadow(0.4), blurRadius: 8),
          ],
        ),
        child: Form(
          key: _formKey,
          child: AnimationLimiter(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: AnimationConfiguration.toStaggeredList(
                  duration: const Duration(milliseconds: 1000),
                  childAnimationBuilder: (widget) => SlideAnimation(
                    verticalOffset: 50.0,
                    child: FadeInAnimation(
                      child: widget,
                    ),
                  ),
                  children: [
                    Text(
                      "Welcome, log In",
                      style: TextStyle(
                          color: ColorApp.black,
                          fontSize: 28,
                          fontWeight: FontWeight.w500),
                    ),
                    TextFieldWidget.emailTextField(
                      hint: "Email Address",
                      context: context,
                      textEditingController: _emailTextController,
                    ),
                    TextFieldWidget.passwordTextField(
                        hint: "Password",
                        textEditingController: _passTextController,
                        context: context),
                    Align(
                        alignment: constraints.maxWidth > 600
                            ? Alignment.center
                            : Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {},
                            child: Text("Forgot Password?",
                                style: TextStyle(
                                    color: ColorApp.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500)))),
                    AuthButton(
                      email: _emailTextController,
                      pass: _passTextController,
                      formKey: _formKey,
                    ),
                  ]
                      .toAddSeparator(element: const SizedBox(height: 14))
                      .toList(),
                )),
          ),
        ),
      );
    });
  }
}
