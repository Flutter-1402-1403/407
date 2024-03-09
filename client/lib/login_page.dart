import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_totarial/og.dart';
import 'package:login_totarial/sign_up.dart';
// import 'package:fluttertoast/fluttertoast.dart';
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 44),
                        height: 500,
                        child: Form(
                            key: _logincardKey,
                            child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      RegExp emailRegex = RegExp(
                                          r'^[a-zA-Z0-9._%+-]+@gmail\.com$');
                                      if (value == null || value.isEmpty) {
                                        return "Please Enter Your Email";
                                      } else if (!emailRegex.hasMatch(value)) {
                                        return 'Wrong Email';
                                      }
                                      return null;
                                    },
                                    controller: loginUsername,
                                    decoration: InputDecoration(
                                      label: const Text('Email'),
                                      hintText: 'Enter Your Email',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          )),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Colors.black,
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      errorStyle: const TextStyle(),
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
                                      RegExp Password1Regex = RegExp(
                                          r'^(?=.*[a-zA-Z])(?=.*\d)(?=.*\w).{8,}$');
                                      if (value == null || value.isEmpty) {
                                        return 'Please Enter Your Password';
                                      } else if (!Password1Regex.hasMatch(
                                          value)) {
                                        return "Your Password must contian character and numbers and words";
                                      }
                                      return null;
                                    },
                                    controller: loginPassword,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      focusedErrorBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: const BorderSide(
                                            color: Colors.red,
                                            width: 1,
                                          )),
                                      label: const Text('password'),
                                      hintText: 'Enter Your Password',
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.grey),
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
                                    height: 16,
                                  ),
                                  SizedBox(
                                    height: 50,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (_logincardKey.currentState!
                                            .validate()) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content:
                                                      Text("wait for login")));
                                        }
                                        http
                                            .post(
                                              Uri.parse(
                                                  'https://jsonplaceholder.typicode.com/api/login'),
                                              headers: {
                                                HttpHeaders.contentTypeHeader:
                                                    'application/json; charset=UTF-8',
                                              },
                                              body: jsonEncode({
                                                'email': loginUsername.text,
                                                'password': loginPassword.text,
                                              }),
                                            )
                                            .then((value) => {
                                                  if (value.statusCode != null)
                                                    {}
                                                  else
                                                    {}
                                                })
                                            .onError((error, stackTrace) => {});
                                      },
                                      style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(12)),
                                          foregroundColor: Colors.black,
                                          backgroundColor:
                                              const Color(0xFFFFC107),
                                          textStyle: const TextStyle(
                                            fontSize: 20,
                                          )),
                                      child: const Text("login"),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 60,
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(12)),
                                            foregroundColor: Colors.black,
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 255, 255, 255),
                                            textStyle: const TextStyle(
                                              fontSize: 20,
                                            )),
                                        child:
                                            const Text("I forgot my password")),
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
                                          fontSize: 14,
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
                                                color: Color.fromARGB(
                                                    255, 0, 0, 0),
                                                fontSize: 20),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap =
                                                  () => Get.to(SignUpCard()),
                                          ),
                                        ],
                                      ))
                                    ],
                                  )
                                ])))
                  ],
                )))));
  }
}
