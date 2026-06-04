import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:chatapp/src/components/common_widgets/user_card.dart';
import 'package:chatapp/src/controllers/chat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InboxView extends StatelessWidget {
   InboxView({super.key});

  final ChatController _chatController = Get.put(ChatController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
        title: Obx((){
          return BlackText(
            text: _chatController.isLoading.value ? "Loading...":
            _chatController.currentUserName.value,
            fontWeight: FontWeight.w700,
            fontSize: 16,
            textColor: Colors.white,
          );
        })
      ),
      body: Obx((){

      if (_chatController.isLoading.value && _chatController.userList.isEmpty)
        {
          return const Center(
            child: CircularProgressIndicator(color: Colors.deepPurple),
          );
        }

      if(_chatController.userList.isEmpty)
        {
          return const Center(
            child: BlackText(
              text: "NO DATA FOUND",
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          );
        }


      return ListView.builder(
        itemCount: _chatController.userList.length,
        itemBuilder: (context,index){
         var userData = _chatController.userList[index];
         return UserCard(
           name: userData['user_name']?? "N/A",
         );
        },
      );


      }),
    );
  }
}
