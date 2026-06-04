import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:chatapp/src/components/common_widgets/custom_text_feild.dart';
import 'package:chatapp/src/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [

          Container(
            height: Responsive.height(300),
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.purpleAccent,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                )
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top: Responsive.height(80) ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.chat,size: 50,color: Colors.white),
                  SizedBox(height: Responsive.height(20)),
                  BlackText(
                    text: "Login",
                    textColor: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(height: Responsive.height(20)),
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsetsGeometry.symmetric(horizontal: 20,vertical: 40),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(.5),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 4,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(children: [

                      BlackText(
                        text: "Welcome Back",
                        textColor: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                      ),
                      SizedBox(height: Responsive.height(10)),
                      CustomTextFeild(
                          labelText: "Enter Email",
                          controller: authController.emailController,
                          prefixIcon: LucideIcons.mail),
                      SizedBox(height: Responsive.height(20)),
                      CustomTextFeild(
                        labelText: "Enter Password",
                        controller: authController.passController,
                        prefixIcon: LucideIcons.lock,
                        isPassword: true,
                      ),
                      SizedBox(height: Responsive.height(30)),
                      ElevatedButton(
                          onPressed: (){
                            context.go('sdscd');
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.purpleAccent,
                              minimumSize: Size(double.infinity, Responsive.height(40)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadiusGeometry.circular(50),
                              )
                          ),
                          child: BlackText(
                            text: "Sign In",
                            textColor: Colors.white,
                          )
                      ),
                      SizedBox(height: Responsive.height(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          BlackText(
                            text: "Don't have an account? ",
                            fontSize: 14,
                          ),
                          BlackText(
                            onTap: (){
                              context.go('/');
                            },
                            text: "Sign Up",
                            fontSize: 14,
                            textColor: Colors.purpleAccent,
                          ),

                        ],)
                    ],),
                  ),
                  SizedBox(height: Responsive.height(20)),
                ],),
            ),
          )
        ],),
      ),
    );
  }
}
