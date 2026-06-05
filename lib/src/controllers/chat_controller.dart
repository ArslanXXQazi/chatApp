import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var userList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var currentUserName = "".obs;

  // Real-time messages store karne ke liye RxList
  var chatMessages = <Map<String,dynamic>>[].obs;



  @override
  void onInit() {
    super.onInit();
    getUser();
  }


  // 1. Chat Room ID banane ka unique logic (Dono IDs ko sort kar ke combine karna)
  String getChatRoomId(String user1, String user2)
  {
    return user1.compareTo(user2)<0? "${user1}_$user2" : "${user2}_$user1";
  }

  // 2. Message Send karne ka function
  void sendMessage(String receiverId, String messageText) async
  {
    if(messageText.trim().isEmpty) return;

    try
    {
      String currentUserId = _auth.currentUser?.uid ?? "";
      String chatRoomId = getChatRoomId(currentUserId, receiverId);

      // 'chat_rooms' -> 'room_id' -> 'messages' (sub-collection)
      await _firebaseFirestore.collection("chat_rooms").doc(chatRoomId).collection("messages").add({

        "sender_id":currentUserId,
        "receiver_id":receiverId,
        "messages": messageText.trim(),
        "timestamp": FieldValue.serverTimestamp(),

      });
    }
    catch (e) {
      print("Error sending message: ${e.toString()}");
    }
  }


  // 3. Messages ko real-time stream (listen) karne ka function

  void listenToMessages(String receiverId) async
  {

    String currentUserId = _auth.currentUser?.uid ?? "";
    String chatRoomId = getChatRoomId(currentUserId, receiverId);
    
    try
    {
      await _firebaseFirestore.collection("chat_rooms").
      doc(chatRoomId).collection("messages").orderBy("timestamp",descending: false).
      snapshots().listen((snapshot){
        List<Map<String,dynamic>> temporalMessages = [];
        chatMessages.value = temporalMessages;
      });
    }
    catch (e) {
      print("Error sending message: ${e.toString()}");
    }
    
  }
















  void getUser() async {
    try {
      isLoading.value = true;
      String currentUserId = _auth.currentUser?.uid ?? "";

      if(currentUserId.isNotEmpty)
        {
          var currentUserDoc = await _firebaseFirestore.
          collection('userData').doc(currentUserId).get();
          if(currentUserDoc.exists)
            {
              currentUserName.value=currentUserDoc.data()?['user_name']??"N/A";
            }
        }

      _firebaseFirestore.collection("userData").snapshots().listen((snapshot) {
        List<Map<String, dynamic>> temporalList = [];

        for (var doc in snapshot.docs) {
          if (doc.data()["user_id"] != currentUserId) {
            temporalList.add(doc.data());
          }
        }
        userList.value = temporalList;
        isLoading.value = false;
      });

    } catch (e) {
      isLoading.value = false;
      print("Error fetching users: ${e.toString()}");
    }
  }
}