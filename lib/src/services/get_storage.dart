import 'package:get_storage/get_storage.dart';

class GetStorageService {
  static final box = GetStorage();

  // ==========>> User_Id save method
  static saveUserId(String userId) {
    box.write("userId", userId);
  }

  static String? getUserId() {
    return box.read("userId");
  }

  static deleteUserId() {
    box.remove("userId");
  }

}