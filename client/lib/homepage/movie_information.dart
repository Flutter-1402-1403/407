import 'package:flutter/material.dart';
import 'package:login_totarial/login/resource.dart';

//Login Page
class MovieInformation extends StatefulWidget {
  const MovieInformation({super.key});

  @override
  State<MovieInformation> createState() => _MovieInformationState();
}

class _MovieInformationState extends State<MovieInformation> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Heading('movie information'),
    );
  }
}
