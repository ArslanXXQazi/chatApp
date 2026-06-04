import 'package:chatapp/src/components/common_widgets/custom_toast.dart';
import 'package:chatapp/src/router/app_router.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// Yahan apni custom toast file ko import zaroor kar lena
// import 'package:your_app_name/widgets/custom_toast.dart';

class AuthController extends GetxController {
  var isPasswordVisible = false.obs;
  var isLoading = false.obs;
  final FormKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPassController = TextEditingController();


  //login function starts
  void login() async
  {

    try
    {
      isLoading.value=true;
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passController.text
      );

      AppRouter.route.go('/inbox');
      CustomToast.show(message: "Login Successfully");
      clear();
      isLoading.value=false;

    }
    catch(e)
    {
      CustomToast.show(message: "${e.toString()}",isError: true);
      isLoading.value=false;
    }

  }

  // SignUp Function Starts
  void signUp() async {
    try {
      isLoading.value = true;
      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text,
      );

      String uid = userCredential.user!.uid;

      await userData(uid);
      CustomToast.show(message: "Account Created Successfully");
      clear();

      print("USER ID ======>>> ${userCredential.user?.uid}");
      print("================= ACCOUNT CREATED SUCCESSFULLY===================");
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      print(e.toString());

      // Naya Custom Toast (Error case)
      CustomToast.show(message: e.toString(), isError: true);
    }
  }

  userData(String uid) async {
    try {
      await FirebaseFirestore.instance.collection('userData').doc(uid).set({
        "user_id": uid,
        "user_name": nameController.text,
        "user_email": emailController.text,
        "created_at": DateTime.now(),
      });
    } catch (e) {
      print(e.toString());
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Email is Required";
    }
    if (!GetUtils.isEmail(value.trim())) {
      return "Enter Valid Email";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Password is Required";
    }
    if (value.length < 6) {
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

  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is Required";
    }
    return null;
  }

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void clear() {
    nameController.clear();
    emailController.clear();
    passController.clear();
    confirmPassController.clear();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passController.dispose();
    confirmPassController.dispose();
    super.onClose();
  }
}