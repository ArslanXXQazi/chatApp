import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {

  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  final FormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();


  String? validateEmail(String? value ){
    if(value==null || value.trim().isEmpty)
      {
        return "Email is Required";
      }
    if(!GetUtils.isEmail(value.trim()))
      {
        return "Enter Valid Email";
      }
    return null;
  }

  String? validatePassword(String? value){

    if(value==null || value.isEmpty)
      {
        return "Password is Required";
      }
    if(value.length < 6)
      {
        return "Password must be at least 6 characters";
      }
    return null;

  }


  String? validateConfirmPassword(String? value) {

    if (value == null || value.isEmpty) {
      return "Confirm Password is Required";
    }

    if (value != passController.text) {
      return "Passwords do not match";
    }

    return null;
  }

  String? validateName(String? value){

    if(value==null || value.isEmpty)
    {
      return "Name is Required";
    }
    return null;

  }


  void togglePasswordVisibility (){
    isPasswordVisible.value = !isPasswordVisible.value;
  }
}