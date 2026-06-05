import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserCard extends StatelessWidget {

  final String name;

  const UserCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return GestureDetector(
      onTap: (){
        context.go("/chatDetail");
      },
      child: Container(
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
              text:name,
              fontSize: 16,
              fontWeight: FontWeight.w700,

            ),
          )
        ],),
      ),
    );
  }
}
