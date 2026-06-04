import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Container(
      padding: const EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 12),
      margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        
        CircleAvatar(
          radius: Responsive.width(25),
          backgroundColor: Colors.purpleAccent,
          child: Icon(Icons.person,color: Colors.white,size: Responsive.width(30),),
        ),
        SizedBox(width: Responsive.width(15)),
        Expanded(
          child: BlackText(
            text: "Arslan Qazi",
            fontSize: 16,
            fontWeight: FontWeight.w700,

          ),
        )

      ],),
    );
  }
}
