import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_totarial/og.dart';
import 'package:login_totarial/sign_up.dart';
import 'package:toastification/toastification.dart';
import 'package:flutter/gestures.dart';

String register = "register";

class LoginCard extends StatelessWidget {
  LoginCard({super.key});

  final loginUsername = TextEditingController();
  final loginPassword = TextEditingController();
  final _logincardKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      reverse: true,
      // physics: const NeverScrollableScrollPhysics(),
      child: ConstrainedBox(
        constraints: const BoxConstraints(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: IntrinsicHeight(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 60),
                Image.asset("assets/imdb.png"),
                const SizedBox(height: 100.1),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 44),
                  height: 500,
                  child: Form(
                    key: _logincardKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
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
                          controller: loginUsername,
                          decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                )),
                            label: const Text('Email '),
                            hintText: 'Enter Your Email',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          validator: (value) {
                            RegExp Password2Regex = RegExp(
                                r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*\w).{8,}$');
                            if (value == null || value.isEmpty) {
                              return 'Please Enter Your Password';
                            } else if (!Password2Regex.hasMatch(value)) {
                              return "Your Password Is Wrong";
                            }
                            return null;
                          },
                          controller: loginPassword,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: const BorderSide(
                                  color: Colors.red,
                                  width: 1,
                                )),
                            label: const Text('password'),
                            hintText: 'Enter Your Password',
                            enabledBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_logincardKey.currentState!.validate()) {
                                http
                                    .post(
                                      Uri.parse(
                                          'http://192.168.43.154/api/login'),
                                      headers: {
                                        HttpHeaders.contentTypeHeader:
                                            'application/json; charset=UTF-8',
                                      },
                                      body: jsonEncode({
                                        'username': loginUsername.text,
                                        'password': loginPassword.text,
                                      }),
                                    )
                                    .then((value) => {
                                          if (value.statusCode == 200)
                                            {
                                              toastification.show(
                                                  backgroundColor: Colors.green,
                                                  context: context,
                                                  title: const Text(
                                                      "Login up successfully"),
                                                  autoCloseDuration:
                                                      const Duration(
                                                          seconds: 3)),
                                              Get.to(const OgCard())
                                            }
                                          else
                                            {
                                              toastification.show(
                                                  backgroundColor: Colors.red,
                                                  context: context,
                                                  title: const Text(
                                                      "The information is invalid"),
                                                  autoCloseDuration:
                                                      const Duration(
                                                          seconds: 3))
                                            }
                                        })
                                    .onError((error, stackTrace) => {});
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                foregroundColor: Colors.black,
                                backgroundColor: const Color(0xFFFFC107),
                                textStyle: const TextStyle(
                                  fontSize: 20,
                                )),
                            child: const Text("login"),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 65,
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  foregroundColor: Colors.black,
                                  backgroundColor:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  )),
                              child: const Text("I forgot my password")),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Don't have an account ?",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Colors.black,
                                fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.bold
                              ),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            RichText(
                              text: TextSpan(
                                children: [
                                  const TextSpan(
                                    text: "By  ",
                                  ),
                                  TextSpan(
                                    text: "Sign Up",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 22,fontFamily: "Roboto",fontWeight: FontWeight.bold),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Get.to(SignUpCard()),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
