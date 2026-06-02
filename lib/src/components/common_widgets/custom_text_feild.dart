import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
class CustomTextFeild extends StatelessWidget {

 final  String labelText;
 final  TextEditingController controller ;
 final  IconData prefixIcon;
 final  IconData? suffixIcon;

   CustomTextFeild({super.key,
     required this.labelText,
     required this.controller,
     required this.prefixIcon,
     this.suffixIcon
   });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white70,
        hint: BlackText(text: labelText,textColor: Colors.grey,fontSize: 12,),
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: Colors.grey)
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(500),
            borderSide: BorderSide(color: Colors.purpleAccent)
        ),
        prefixIcon: Icon(prefixIcon,size: 20,color: Colors.grey,),
        suffixIcon: Icon(suffixIcon,size: 20,color: Colors.grey,),
      ),
    );
  }
}
