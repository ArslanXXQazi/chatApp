import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [

        Container(
          height: Responsive.height(400),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.deepPurple,
                Colors.purpleAccent,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
          ),
        ),
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
            Icon(Icons.add_reaction_sharp,size: 50,color: Colors.white),
            SizedBox(height: Responsive.height(20)),
            BlackText(
              text: "Create Account",
              textColor: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: Responsive.height(20)),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsetsGeometry.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.9),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 10,
                    spreadRadius: 4,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(children: [
                TextFormField(
                  decoration: InputDecoration(
                    label: BlackText(text: "Enter Name",textColor: Colors.grey,fontSize: 12,),
                    border:OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.grey)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.purpleAccent)
                    ),
                    prefixIcon: Icon(LucideIcons.user,size: 20,color: Colors.grey,),


                  ),
                )

              ],),
            )

          ],),
        )
      ],),
    );
  }
}
