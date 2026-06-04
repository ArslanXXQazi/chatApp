import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
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



  // SignUp Function Starts
  void signUp () async
  {
    try{
      isLoading.value=true;
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text
      );
      clear();
      Get.snackbar(
        "Success",
        "Account created successfully",
        snackPosition: SnackPosition.BOTTOM,
      );
      print(userCredential.user?.uid);
      isLoading.value=false;
    }
    catch(e)
    {
      isLoading.value=false;
      print(e.toString());
      Get.snackbar(
        "Error",
        "Account Creation Failed",
        snackPosition: SnackPosition.BOTTOM,
      );
    }

  }




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



   void clear (){

    nameController.clear();
    emailController.clear();
    passController.clear();
    confirmPassController.clear();

   }
}