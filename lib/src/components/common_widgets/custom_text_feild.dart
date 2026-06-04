import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:chatapp/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
class CustomTextFeild extends StatelessWidget {

 final  String labelText;
 final  TextEditingController controller ;
 final  IconData prefixIcon;
 final  bool isPassword;


   CustomTextFeild({super.key,
     required this.labelText,
     required this.controller,
     required this.prefixIcon,
     this.isPassword=false,

   });


 final AuthController authController = Get.put(AuthController());
 @override
  Widget build(BuildContext context) {
    return Obx((){
      return TextFormField(
        controller: controller,
        obscureText: isPassword ? authController.isPasswordVisible.value : false,
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
          suffixIcon: isPassword
              ? IconButton(
            onPressed: () {
              authController.togglePasswordVisibility();
            },
            icon: Icon(
              authController.isPasswordVisible.value
                  ? LucideIcons.eyeOff
                  : LucideIcons.eye,
            ),
          )
              : null,
        ),
      );
    });
  }
}
