import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

      String uid = userCredential.user!.uid;

      userData(uid);
      Fluttertoast.showToast(
          msg: "Account Created Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0
      );
      clear();
      print("USER ID ======>>> ${userCredential.user?.uid}");
      print("================= ACCOUNT CREATED SUCCESSFULLY===================");
      isLoading.value=false;
    }
    catch(e)
    {
      isLoading.value=false;
      print(e.toString());
      Get.snackbar(
        "Error",
        "${e.toString()}",
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red
      );
    }

  }

  void userData (String uid) async
  {
    try
    {
      await FirebaseFirestore.instance.collection('userData').doc(uid).set({
        "user_id": uid,
        "user_name": nameController.text,
        "user_email": emailController.text,
        "created_at": DateTime.now(),
      });
    }
    catch(e)
    {
      print(e.toString());
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