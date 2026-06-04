import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: BlackText(
        text: "Chat App",
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),),
    );
  }
}
