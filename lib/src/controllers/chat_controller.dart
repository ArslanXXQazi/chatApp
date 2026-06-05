import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  var userList = <Map<String, dynamic>>[].obs;
  var isLoading = false.obs;
  var currentUserName = "".obs;

  // Real-time messages store karne ke liye RxList 📱
  var chatMessages = <Map<String,dynamic>>[].obs;


  




  @override
  void onInit() {
    super.onInit();
    getUser();
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