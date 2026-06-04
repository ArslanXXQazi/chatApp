import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  final FormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();


  String? validateEmail(String value ){
    if(value==null || value.trim().isEmpty)
      {
        return "Email is Required";
      }
    if(GetUtils.isEmail(value.trim()))
      {
        return "Enter Valid Email";
      }
    return null;
  }

  String? validatePassword(String value){

    if(value==null || value.isEmpty)
      {
        return "Enter Password";
      }
    if(value.length < 6)

  }




  void togglePasswordVisibility (){
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}