import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:chatapp/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class CustomTextFeild extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final IconData prefixIcon;
  final bool isPassword;
  final validator;

  CustomTextFeild({
    super.key,
    required this.labelText,
    required this.controller,
    required this.prefixIcon,
    this.isPassword = false,
    required this.validator,
  });

  final AuthController authController = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {

    // Email Field
    if (!isPassword) {
      return TextFormField(
        controller: controller,
        style: GoogleFonts.poppins(fontSize: 14),
        validator: validator,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          hint: BlackText(
            text: labelText,
            textColor: Colors.grey,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.purpleAccent),
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: 20,
            color: Colors.grey,
          ),
        ),
      );
    }

    // Password Field
    return Obx(
          () => TextFormField(
        controller: controller,
        obscureText: !authController.isPasswordVisible.value,
        validator: validator,
        style: GoogleFonts.poppins(
          fontSize: 16
        ),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white70,
          hint: BlackText(
            text: labelText,
            textColor: Colors.grey,
            fontSize: 12,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: const BorderSide(color: Colors.purpleAccent),
          ),
          prefixIcon: Icon(
            prefixIcon,
            size: 20,
            color: Colors.grey,
          ),
          suffixIcon: IconButton(
            onPressed: authController.togglePasswordVisibility,
            icon: Icon(
              authController.isPasswordVisible.value
                  ? LucideIcons.eyeOff
                  : LucideIcons.eye,
            ),
          ),
        ),
      ),
    );
  }
}