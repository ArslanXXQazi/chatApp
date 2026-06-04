import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {

  final String text;

  const CustomErrorWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.all(20),
          child: BlackText(
            text: "Error",
            fontSize: 20,
            fontWeight: FontWeight.w700,
            textColor: Colors.white,
          ),
        ),
      ),
      body: Center(child:BlackText(
        text: text,
      ),),
    );
  }
}
