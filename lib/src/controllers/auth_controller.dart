import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  var isPasswordVisible = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();




  void togglePasswordVisibility (){
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}