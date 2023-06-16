import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:izam/src/modules/auth/presentation/view/widget/form_container.dart';
import 'package:izam/src/utils/constant/app_assets.dart';
import '../../../../../utils/extensions/keys.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Keys.scaffoldKey(),
      resizeToAvoidBottomInset: false,
      body: Center(
        child: SingleChildScrollView(
          child: AnimationLimiter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: AnimationConfiguration.toStaggeredList(
                    duration: const Duration(milliseconds: 1000),
                    delay: const Duration(milliseconds: 800),
                    childAnimationBuilder: (widget) => SlideAnimation(
                          verticalOffset: 50.0,
                          child: FadeInAnimation(
                            child: widget,
                          ),
                        ),
                    children: [
                      Image.asset("".logoImage(), width: 141, height: 37),
                      FormContainerWidget(),
                    ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    ScaffoldMessenger.of(context).clearMaterialBanners();
    super.deactivate();
  }

  @override
  void dispose() {
    Hive.close();
    ScaffoldMessenger.of(context).clearMaterialBanners();
    super.dispose();
  }
}
