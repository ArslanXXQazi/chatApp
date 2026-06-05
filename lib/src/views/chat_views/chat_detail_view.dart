import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:chatapp/src/controllers/chat_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDetailView extends StatefulWidget {

   final Map<String , dynamic> userData;

   ChatDetailView({super.key, required this.userData});

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {
  final ChatController _chatController = Get.find<ChatController>();
  final String currentUserId = FirebaseAuth.instance.currentUser?.uid ?? "";
  String typedMsg = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _chatController.listenToMessages(widget.userData["user_id"]);
  }
  @override
  Widget build(BuildContext context) {

    String receiverName = widget.userData['user_name'] ?? "user";
    String receiverId = widget.userData['user_id'] ?? "";

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                context.pop();
              },
              icon: const Icon(Icons.arrow_back, color: Colors.white)
          ),
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
          title: BlackText(
            text: receiverName,
            fontWeight: FontWeight.w900,
            fontSize: 14,
            textColor: Colors.white,
          ),
        ),
        body: SafeArea(
            child: Column(
              children: [
                // 1. Messages ki List (Scrollable Area)
                Expanded(
                  child: Obx((){

                   if(_chatController.chatMessages.isEmpty)
                     {
                       return Column(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: const [
                           Icon(Icons.message_outlined, size: 50, color: Colors.grey),
                           SizedBox(height: 10),
                           Center(child: BlackText(text: "No Messages Found")),
                         ],
                       );
                     }

                   return ListView.builder(
                     padding: EdgeInsets.only(top: 20),
                     itemCount: _chatController.chatMessages.length,
                     itemBuilder: (context, index){
                       var msgData = _chatController.chatMessages[index];
                       // Check karo: Agar message bhejne wala main hoon toh true, warna false
                       bool isMe = msgData['sender_id'] == currentUserId;
                       return BubbleSpecialThree(
                         seen: true,
                         text: msgData["message"] ?? "",
                         color: isMe ? Colors.purpleAccent : const Color(0xFFE8E8EE),
                         tail: true,
                         isSender: isMe,
                         textStyle: GoogleFonts.poppins(
                             color: isMe ? Colors.white : Colors.black,
                             fontSize: 15),
                       );

                     },
                   );

                  })
                ),

                // 2. Message likhne wali Bar
                MessageBar(
                  messageBarColor: Colors.purpleAccent,
                  sendButton: const CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.send, color: Colors.purpleAccent),
                  ),
                  onSend: (message) {
                    print("=====================");
                    print("Message Typed: $message");
                    print("=====================");

                    _chatController.sendMessage(receiverId, message);

                  },
                ),

              ],
            )
        )
    );
  }
}