import 'package:flutter/material.dart';
import 'package:login_totarial/routs/routs.dart';
import 'package:login_totarial/appbar.dart';
import 'package:get/get.dart';
void main (){
  runApp( const MaterialApp(
    // theme: ThemeData(fontFamily: 'Vazirmatn-Medium'),
    home:  Scaffold(
      resizeToAvoidBottomInset : true,
      appBar: LoginAppbar(),
      // backgroundColor: Color(0xFFF6C700),
      body: MyApp(),
      
    ),
  ));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Route Managment',
      initialRoute: '/Login',
      getPages: appRoutes(),
    );
  }
}
  
  

  