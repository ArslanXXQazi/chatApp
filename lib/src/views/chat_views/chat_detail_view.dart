import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';

class ChatDetailView extends StatelessWidget {
  const ChatDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        title: BlackText(
          text: "User Name",
          fontWeight: FontWeight.w900,
          fontSize: 14,
          textColor: Colors.white,
        ),

      ),
      body: SafeArea(child: Column(children: [




        


      ],))
    );
  }
}
