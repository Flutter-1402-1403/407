import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_totarial/login/login.dart';
import 'package:login_totarial/login/resource.dart';

//Login Page
class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}
class _ForgotPasswordState extends State<ForgotPassword> {
  final forgotPasswordEmail = TextEditingController();
  final _logincardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            Heading('Forgot Password'),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _logincardKey,
                child: Column(
                  children: <Widget>[
                    const Text(
                      'To reset your email, please enter a valid email to send the reset password link.',
                      style: TextStyle(
                         color: Colors.grey,
                        decoration: TextDecoration.none,
                        fontFamily: 'Roboto',
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: forgotPasswordEmail,
                      validator: (value) {
                        RegExp emailRegex =
                            RegExp(r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                        if (value == null || value.isEmpty) {
                          return 'Please Enter Your Email';
                        } else if (!emailRegex.hasMatch(value)) {
                          return 'Your Email is wrong';
                        }
                        return null;
                      },
                      decoration: Input('Email', 'Enter Your Email'),
                    ),
                    const SizedBox(height: 50),
                    Container(
                      width: double.infinity,
                      decoration: ShadowBtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                        //forget password: sent email 



                        
                        },
                        style: StyleBtn(Colors.white, Colors.black),
                        child: const Text("Continue"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      decoration: ShadowBtn(),
                      child: ElevatedButton(
                        onPressed: () async {
                           Get.to(const Login());
                        },
                        style: StyleBtn(Colors.white, const Color(0xFFFFB409)),
                        child: const Text("Back"),
                      ),
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TxtBtnCU('Conditions of Use'),
                        TxtBtnPN('Privacy Notice'),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
