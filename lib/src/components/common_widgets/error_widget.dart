import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ErrorWidget extends StatelessWidget {

  final String text;

  const ErrorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: BlackText(
            text: "Error",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
          ),
        ),
        body: Center(child:BlackText(
          text: text,
        ),),
      ),
    );
  }
}
