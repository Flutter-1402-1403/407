import 'package:flutter/material.dart';
import 'package:login_totarial/routs/routs.dart';
import 'package:get/get.dart';

void main (){
  runApp( const MaterialApp(
    // theme: ThemeData(fontFamily: 'Vazirmatn-Medium'),
    home:  Scaffold(
      resizeToAvoidBottomInset : true,
      backgroundColor: Color(0xFFF6C700),
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

// class Home extends StatelessWidget {
//   const Home({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Snack bar'),
//       ),
//       body: Center(
//         child: RaisedButton(
//           onPressed: () => _showToast(context),
//           child: const Text('Show toast'),
//         ),
//       ),
//     );
//   }
//   void _showToast(BuildContext context) {
//     final scaffold = ScaffoldMessenger.of(context);
//     scaffold.showSnackBar(
//       SnackBar(
//         content: const Text('Added to favorite'),
//         action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
//       ),
//     );
//   }
// }
