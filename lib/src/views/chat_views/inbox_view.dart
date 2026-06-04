import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:chatapp/src/components/common_widgets/user_card.dart';
import 'package:flutter/material.dart';

class InboxView extends StatelessWidget {
  const InboxView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        title: BlackText(
          text: "Inbox",
          fontWeight: FontWeight.w700,
          fontSize: 16,
          textColor: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index)
          {
            return UserCard(
              name: "qazi",
            );
          }
      ),
    );
  }
}
