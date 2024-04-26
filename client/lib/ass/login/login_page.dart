import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_totarial/homepage/og.dart';
import 'package:login_totarial/ass/login/sign_up.dart';
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
             // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                //const SizedBox(height: 0),
                Image.asset("assets/imdb1.png"),
                const SizedBox(height: 5),
                Container(
                  color: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 54),
                  height: 770,
                  child: Form(
                    key: _logincardKey,
                    child: Column(
                      //mainAxisSize: MainAxisSize.min,
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
                              // if (_logincardKey.currentState!.validate()) {
                              //   http
                              //       .post(
                              //         Uri.parse(
                              //             'http://192.168.43.154/api/login'),
                              //         headers: {
                              //           HttpHeaders.contentTypeHeader:
                              //               'application/json; charset=UTF-8',
                              //         },
                              //         body: jsonEncode({
                              //           'username': loginUsername.text,
                              //           'password': loginPassword.text,
                              //         }),
                              //       )
                              //       .then((value) => {
                              //             if (value.statusCode == 200)
                              //               {
                              //                 toastification.show(
                              //                     backgroundColor: Colors.green,
                              //                     context: context,
                              //                     title: const Text(
                              //                         "Login up successfully"),
                              //                     autoCloseDuration:
                              //                         const Duration(
                              //                             seconds: 3)),
                              //                 Get.to(const OgCard())
                              //               }
                              //             else
                              //               {
                              //                 toastification.show(
                              //                     backgroundColor: Colors.red,
                              //                     context: context,
                              //                     title: const Text(
                              //                         "The information is invalid"),
                              //                     autoCloseDuration:
                              //                         const Duration(
                              //                             seconds: 3))
                              //               }
                              //           })
                              //       .onError((error, stackTrace) => {});
                              // }
                              Get.to(const OgCard());
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12)),
                                foregroundColor: Colors.black,
                                backgroundColor: const Color(0xFFF6C700),
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
                              onPressed: () {
                                Get.to(SignUpCard());
                              },
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)),
                                  foregroundColor: Colors.white,
                                  backgroundColor:
                                      Color.fromARGB(255, 0, 0, 0),
                                  textStyle: const TextStyle(
                                    fontSize: 20,
                                  )),
                              child: const Text("Create account")),
                        ),
                        const SizedBox(
                          height: 33,
                        ),
                        Row(
                          children: [
                            const Text(
                              "Conditions of Use",
                              style: TextStyle(
                                decoration: TextDecoration.none,
                               color: Color.fromARGB(255, 99, 99, 99),
                                fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.normal
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
                                    text: "Privacy Notice",
                                    style: const TextStyle(
                                        color: Color.fromARGB(255, 99, 99, 99),
                                        fontSize: 14,fontFamily: "Roboto",fontWeight: FontWeight.normal),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => Get.to(SignUpCard())
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
