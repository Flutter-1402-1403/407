import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:login_totarial/login_page.dart';
import 'package:login_totarial/og.dart';

String register = "register";

class SignUpCard extends StatelessWidget {
  SignUpCard({super.key});

  final signupFullname = TextEditingController();
  final signupEmail = TextEditingController();
  final signupPhone = TextEditingController();
  final signupPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: ConstrainedBox(
            constraints: const BoxConstraints(),
            child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                    reverse: true,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(height: 70),
                        Image.asset("assets/imdb.png"),
                        const SizedBox(height: 70),
                        Container(
                            color: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 44),
                            height: 500,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  controller: signupFullname,
                                  decoration: InputDecoration(
                                    label: const Text('Full Name'),
                                    hintText: 'Enter Your Full Name',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
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
                                  controller: signupEmail,
                                  decoration: InputDecoration(
                                    label: const Text('Email'),
                                    hintText: 'Enter Your Email',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
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
                                  controller: signupPhone,
                                  decoration: InputDecoration(
                                    label: const Text('Phone Number'),
                                    hintText: 'Enter Your Phone Number',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
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
                                  controller: signupPassword,
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    label: const Text('password'),
                                    hintText: 'Enter Your Password',
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          const BorderSide(color: Colors.grey),
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
                                    onPressed: () {
                                      http
                                          .post(
                                            Uri.parse(
                                                'https://jsonplaceholder.typicode.com/api/register'),
                                            headers: {
                                              HttpHeaders.contentTypeHeader:
                                                  'application/json; charset=UTF-8',
                                            },
                                            body: jsonEncode({
                                              'fullname': signupFullname.text,
                                              'email': signupEmail.text,
                                              'phone': signupPhone.text,
                                              'password': signupPassword.text,
                                            }),
                                          ).then((value) => {
                                            if (value.statusCode != null) {
                                              Get.to(LoginCard())
                                            } else {
                                               
                                            }
                                          }).onError((error, stackTrace) => {});
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
                                    child: const Text("Sign Up"),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                  const Text(
                                    "Do you have an account ?",
                                    style: TextStyle(
                                      decoration: TextDecoration.none,
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 35,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      Get.to(LoginCard());
                                    },
                                    style: ElevatedButton.styleFrom(),
                                    child: const Text("Login"))
                                  ],
                                )
                              ],
                            ))
                      ],
                    )))));
  }
}
