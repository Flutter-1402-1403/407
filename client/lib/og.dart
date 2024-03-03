import 'package:flutter/material.dart';
import 'package:get/get.dart';
class OgCard extends StatelessWidget {
  const OgCard({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            "Welcome",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 50,
            ),
          ),
           Text(
            "Welcome",
            style: TextStyle(
              decoration: TextDecoration.none,
              color: Colors.black,
              fontSize: 50,
            ),
          ),
          
        ],
      ),
    );
  }
}
    //messageBox
     void _showAlertDialog(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Alert Dialog Title'),
            content: const Text('This is the content of the alert dialog.'),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: const Text('Confirm'),
                onPressed: () {
                  // Handle the confirm action
                   Get.to(OgCard());
                },
              ),
            ],
          );
        },
      );
    }
