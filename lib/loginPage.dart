import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storing/login_controller.dart';
import 'package:get_storage/get_storage.dart';

class loginPage extends StatelessWidget {
  loginPage({super.key});
  //storage untuk menyimpan data local memory
  final box = GetStorage();
  final login_controller loginC = Get.put(login_controller());

  @override
  Widget build(BuildContext context) {
    //jika data local tidak  kosong, maka akan ditampilkan di textfield dan bisa langsung login

    if (box.read("dataRememberme") != null) {
      loginC.emailC.text = box.read("dataRememberme")["email"];
      loginC.passC.text = box.read("dataRememberme")["password"];
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: loginC.emailC,
            autocorrect: false,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Obx(() => TextField(
                controller: loginC.passC,
                autocorrect: false,
                obscureText: loginC.isObscure.value,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                        onPressed: () {
                          loginC.isObscure.toggle();
                        },
                        icon: Icon(Icons.remove_red_eye))),
              )),
          Obx(
            () => CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              value: loginC.rememberme.value,
              onChanged: (value) {
                loginC.rememberme.toggle();
              },
              title: Text("Remember me"),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                loginC.login();
              },
              child: Text("Login!"))
        ],
      ),
    );
  }
}
