import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:izam/src/core/widget/materialBanner_widget.dart';

import '../../../../../config/theme/color.dart';
import '../../../../../core/widget/button_app.dart';
import '../../../../../utils/extensions/keys.dart';
import '../../bloc/auth_bloc/auth_bloc.dart';

// ignore: must_be_immutable
class AuthButton extends StatelessWidget {
  final String email, pass;
  final GlobalKey<FormState> formKey;
  GlobalKey<ScaffoldState> key = Keys.scaffoldKey();
  AuthButton(
      {super.key,
      required this.email,
      required this.pass,
      required this.formKey});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LoginSuccess) {
          ScaffoldMessenger.of(key.currentContext!)
              .showMaterialBanner(MaterialBanner(
            leading: const Icon(Icons.done_all, color: Colors.green),
            content: Text(
                "Success Login. \n EMAIL: ${state.userEntity.email} \n COUNTER: ${state.userEntity.counter}"),
            actions: [],
          ).authMaterialBanner(key.currentContext!));
        }
        if (state is LoginField) {
          ScaffoldMessenger.of(key.currentContext!)
              .showMaterialBanner(MaterialBanner(
            leading: const Icon(Icons.error_outline, color: Colors.red),
            content: Text(
                "Field login please try agin. \n ${state.errorModel.contact}"),
            actions: [],
          ).authMaterialBanner(key.currentContext!));
        }
      },
      builder: (context, state) {
        if (state is LoginLoading) {
          return const ButtonLoading(title: "");
        }
        return ButtonApp(
          title: "",
          minWidth: MediaQuery.of(context).size.width,
          minHeight: 48,
          onTap: () {
            ScaffoldMessenger.of(key.currentContext!).clearMaterialBanners();
            if (!formKey.currentState!.validate()) {
              ScaffoldMessenger.of(key.currentContext!)
                  .showMaterialBanner(MaterialBanner(
                content:
                    const Text("please check your Fields , before log In."),
                actions: [
                  TextButton(
                      onPressed: () => ScaffoldMessenger.of(key.currentContext!)
                          .clearMaterialBanners(),
                      child: const Text("Done"))
                ],
              ).authMaterialBanner(key.currentContext!));
            } else {
              BlocProvider.of<AuthBloc>(context).add(LoginEvent(
                email,
                pass,
              ));
            }
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Log In",
                style: TextStyle(color: ColorApp.white),
              ),
              Text(
                "Sgin-in-alt",
                style: TextStyle(color: ColorApp.white),
              ),
            ],
          ),
        );
      },
    );
  }
}
