import 'package:flutter/material.dart';

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
