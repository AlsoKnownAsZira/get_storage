import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:storing/loginPage.dart';
import 'package:storing/homePage.dart';
import 'package:get_storage/get_storage.dart';
void main() async{
  await GetStorage.init();
  runApp( const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      home: loginPage(),
      getPages: [
        GetPage(name: '/loginPage', page: () => loginPage()),
        GetPage(name: '/homePage', page: () => homePage()),
      ],
    );
  }
}