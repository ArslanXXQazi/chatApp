import 'package:chatapp/src/components/common_widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatDetailView extends StatefulWidget {
  const ChatDetailView({super.key});

  @override
  State<ChatDetailView> createState() => _ChatDetailViewState();
}

class _ChatDetailViewState extends State<ChatDetailView> {

  String typedMsg = "";

  @override
  Widget build(BuildContext context) {
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
            text: "User Name",
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
                  child: ListView(
                    padding: const EdgeInsets.all(8.0),
                    children:  [


                      typedMsg.isEmpty?
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.message_outlined,size: 50,),
                              Center(child: BlackText(text: "No Messages Found",)),
                            ],
                          ) :
                          BubbleSpecialThree(
                              text: typedMsg,
                            color: Colors.purpleAccent,
                            tail: true,
                            isSender: true,
                            textStyle: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 15
                            ),
                          )


                      // // ======= RECEIVER KA MESSAGE (Left Side) =======
                      // BubbleSpecialThree(
                      //   text: 'Hello! Kaise ho tum?',
                      //   color: Color(0xFFE8E8EE), // Light grey color
                      //   tail: true, // Niche jo choti si punch (tail) nikli hoti hai
                      //   isSender: false, // isSender false ka matlab ye left side par aayega
                      //   textStyle: GoogleFonts.poppins(
                      //       color: Colors.black,
                      //       fontSize: 15
                      //   ),
                      // ),
                      //
                      // // ======= SENDER KA MESSAGE (Right Side) =======
                      // BubbleSpecialThree(
                      //   text: 'Main theek, Allah ka shukar. Tum sunao?',
                      //   color: Colors.purpleAccent, // App ke theme ka color
                      //   tail: true,
                      //   isSender: true, // isSender true ka matlab ye right side par aayega
                      //   textStyle: GoogleFonts.poppins(
                      //       color: Colors.white,
                      //       fontSize: 15,
                      //   ),
                      // ),
                    ],
                  ),
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


                    setState(() {
                      typedMsg=message;
                    });

                  },
                ),

              ],
            )
        )
    );
  }
}