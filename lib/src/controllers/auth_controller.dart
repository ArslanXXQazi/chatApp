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
        return "Email is requried";
      }
  }


  void togglePasswordVisibility (){
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}