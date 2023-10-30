import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storing/login_controller.dart';

class homePage extends StatelessWidget {
   homePage({super.key});
final login_controller homeC = Get.find();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: 
      Center(
        
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          children: [ Text("Hi admin!"),
          FloatingActionButton(onPressed: (){
           homeC.logout();
          }, child: Icon(Icons.logout),)
          ],
        )
        
        ), 
    );
  }
}