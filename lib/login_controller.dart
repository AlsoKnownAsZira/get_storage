import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class login_controller extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();

  RxBool isObscure = true.obs;
  RxBool rememberme = false.obs;
  //storage untuk menyimpan data local memory
  final box = GetStorage();
  void login() async {
    if (emailC.text.toLowerCase() == "admin@admin.com" &&
        passC.text.toLowerCase() == "admin") {
      if (box.read("dataRememberme") != null) {
        box.remove("dataRememberme");
      }
      //jika tidak dicentang akan menghapus data local memory dengan fungsi remove diatas
      if (rememberme.isTrue) {
        //Jika true akan simpan ke local memory
        box.write(
            "dataRememberme", {"email": emailC.text, "password": passC.text});
      }

      Get.offAllNamed('/homePage');
    } else {
      Get.snackbar("Error Occured", "Email/Password is not correct",
          backgroundColor: Colors.red,
          snackPosition: SnackPosition.BOTTOM,
          isDismissible: true,
          borderRadius: 20,
          icon: Icon(Icons.error_outline_outlined),
          animationDuration: Duration(seconds: 3));
    }
  }

  void logout() {
    Get.offAllNamed('/loginPage');
  }
}
