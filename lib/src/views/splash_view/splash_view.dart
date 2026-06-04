import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}
class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 3));
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: BlackText(
          text: "Chat App",
          fontWeight: FontWeight.w900,
          fontSize: 35,
          letterSpacing: 8.0,
          height: 2.0,
        ),
      ),
    );
  }
}
